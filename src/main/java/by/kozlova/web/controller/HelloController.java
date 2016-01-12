package by.kozlova.web.controller;

import by.kozlova.web.dao.*;
import by.kozlova.web.entity.*;
import by.kozlova.web.service.PersonDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HelloController {

    @Autowired
    private PersonDao pDao = new PersonDao();

    @Autowired
    private TestDao tDao = new TestDao();

    @Autowired
    QuestionDao qDao = new QuestionDao();

    @Autowired
    AnswerDao aDao = new AnswerDao();

    @Autowired
    ResultDao rDao = new ResultDao();

    @Autowired
    TopicDao topicDao = new TopicDao();

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public ModelAndView defaultPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("tests");
        return model;
    }

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        if (error != null)
            model.addObject("error", "Неверный пароль или логин!");
        if (logout != null)
            model.addObject("msg", "Выход совершен успешно!");
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = {"/showtestlist"})
    public ModelAndView showTestList() {
        ModelAndView model = new ModelAndView();
        List<Topic> topicList = new ArrayList<Topic>();
        List<List<Test>> testArray = new ArrayList<List<Test>>();
        topicList = topicDao.getAllTopic();
        List<Result> resultList = new ArrayList<Result>();
        for(Topic top: topicList) {
            List<Test> temp = tDao.getAllByTopic(top.getId());
            if(temp != null)
                for (int i = 0; i < temp.size(); i++) {
                    resultList.add(rDao.findByTestIdAndPersonId(temp.get(i).getId(), getPersonId()));
                }
            testArray.add(temp);
        }
        model.addObject("tests", testArray);
        model.addObject("topics", topicList);
        model.addObject("index", testArray.size());
        model.addObject("userId", getPersonId());
        model.addObject("results", resultList);
        model.setViewName("showTests");
        return model;
    }

    public Integer getPersonId() {
        PersonDetails pDet = (PersonDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return pDet.getPerson().getId();
    }

    @RequestMapping(value = {"/newTest"})
    public ModelAndView showNewTestPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("topics",topicDao.getAllTopic());
        model.setViewName("newTest");
        return model;
    }

    @RequestMapping(value = {"/showTestDescription"})
    public ModelAndView showTestDescription(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        try {
            String testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            String index = new String(request.getParameter("index").getBytes("ISO-8859-1"), "UTF-8");
            model.addObject("test", tDao.getTestById(testId));
            model.addObject("index", index);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        model.setViewName("showTestDescription");
        return model;
    }


    @RequestMapping(value = {"/createTopic"})
    public ModelAndView createTopic(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        try {
            String topicName = new String(request.getParameter("topicName").getBytes("ISO-8859-1"), "UTF-8");
            Topic t = new Topic(topicName);
            topicDao.addTopic(t);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return showNewTestPage();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addPerson(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        if (request.getParameter("password").equals(request.getParameter("check_password")))
            if (pDao.checkUsername(request.getParameter("username"))) {
                model.addObject("error", "Пользователь с таким логином уже существует!");
                model.setViewName("reg");
            } else {
                PersonRole role;
                if (request.getParameter("role").equals("0"))
                    role = PersonRole.ROLE_TEACHER;
                else
                    role = PersonRole.ROLE_STUDENT;
                try {
                    pDao.addPerson(new Person(request.getParameter("username"), new String(request.getParameter("firstname").getBytes("ISO-8859-1"), "UTF-8"),
                            new String(request.getParameter("lastname").getBytes("ISO-8859-1"), "UTF-8"), request.getParameter("email"), request.getParameter("password"),
                            role, true));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                model.addObject("msg", "Регистрация прошла успешно!");
                model.setViewName("login");
            }
        else {
            model.addObject("error", "Повторный пароль введен не верно!");
            model.setViewName("reg");
        }
        return model;
    }

    @RequestMapping(value = "/reg")
    public String reg() {
        return "reg";
    }

    @RequestMapping(value = "/newTest", method = RequestMethod.POST)
    public ModelAndView createNewTest(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        try {
            String testname = new String(request.getParameter("testName").getBytes("ISO-8859-1"), "UTF-8");
            String testd = new String(request.getParameter("testDescription").getBytes("ISO-8859-1"), "UTF-8");
            String testTopic = new String(request.getParameter("testTopic").getBytes("ISO-8859-1"), "UTF-8");
            String type = request.getParameter("testType");
            Test t = new Test(testname, testd, type, getPersonId(), Integer.parseInt(testTopic));
            tDao.addTest(t);
            model.addObject("testId", t.getId());
            model.addObject("index", 1);
            model.setViewName("addQuestion");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return model;
    }

    @RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
    public ModelAndView addNewQuestion(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        try {
            String testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            String questionText = new String(request.getParameter("questionText").getBytes("ISO-8859-1"), "UTF-8");
            String number = new String(request.getParameter("numberOfAnswer").getBytes("ISO-8859-1"), "UTF-8");
            String index = new String(request.getParameter("index").getBytes("ISO-8859-1"), "UTF-8");
            String type = new String(request.getParameter("type").getBytes("ISO-8859-1"), "UTF-8");
//            Question q = new Question(testId,questionText,Integer.parseInt(index));
//            qDao.addQuestion(q);
            model.addObject("numberOfAnswer", number);
            model.addObject("testId", testId);
            model.addObject("questionText", questionText);
            model.addObject("index", index);
            model.addObject("type", type);
            model.setViewName("newTestAnswer");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return model;
    }


    @RequestMapping(value = "/newQuestion", method = RequestMethod.POST)
    public ModelAndView createNewQuestion(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String testId = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            String questionText = new String(request.getParameter("questionText").getBytes("ISO-8859-1"), "UTF-8");
            String number = new String(request.getParameter("numberOfAnswer").getBytes("ISO-8859-1"), "UTF-8");
            String index = new String(request.getParameter("index").getBytes("ISO-8859-1"), "UTF-8");
            String type = new String(request.getParameter("type").getBytes("ISO-8859-1"), "UTF-8");

            Question que = new Question(Integer.parseInt(testId), questionText, Integer.parseInt(index), type);
            Integer indx = Integer.parseInt(index);
            indx++;
            qDao.addQuestion(que);
            List<Answer> answers = new ArrayList<Answer>();
            if (type.equals("open")) {
                Answer a = new Answer(new String(request.getParameter("correct").getBytes("ISO-8859-1"), "UTF-8"),
                        true, Integer.parseInt(request.getParameter("point")));
                a.setQuestion(que);
                aDao.addAnswer(a);
            } else {
                String[] correct = request.getParameterValues("correct");
                int j = 0;
                for (int i = 1; i <= Integer.parseInt(number); i++) {
                    Answer a;
                    int point;
                    if (request.getParameter("point_" + i).equals(""))
                        point = 0;
                    else
                        point = Integer.parseInt(request.getParameter("point_" + i));
                    if (j < correct.length && Integer.parseInt(correct[j]) == i) {
                        a = new Answer(new String(request.getParameter("answer_" + i).getBytes("ISO-8859-1"), "UTF-8"),
                                true, point);
                        j++;
                    } else
                        a = new Answer(new String(request.getParameter("answer_" + i).getBytes("ISO-8859-1"), "UTF-8"),
                                false, point);
                    a.setQuestion(que);
                    aDao.addAnswer(a);
                }
            }
            List<Question> questions = new ArrayList<Question>();
            questions = qDao.findAllByTest(testId);

            model.addObject("index", indx);
            model.addObject("testId", testId);
            model.addObject("questions", questions);
            model.addObject("size", questions.size());
            model.setViewName("addQuestion");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return model;
    }

    @RequestMapping(value = "/testIsReady", method = RequestMethod.POST)
      public ModelAndView setTestIsReady(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String testId = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        tDao.updateReady(testId, "ready");
        model.addObject("info", "Тест успешно добавлен!");
        model.setViewName("tests");
        return model;
    }

    @RequestMapping(value = "/showResult")
    public ModelAndView showResult() {
        ModelAndView model = new ModelAndView();
        List<Test> tests = tDao.getTestByTeacherId(getPersonId());
        List<List<DisplayResult>> results = new ArrayList<List<DisplayResult>>();
        for(Test test: tests)
            results.add(rDao.getResultByTestId(test.getId()));
        model.addObject("results", results);
        model.addObject("tests", tests);
        model.setViewName("results");
        return model;
    }

    @RequestMapping(value = "/changeReady", method = RequestMethod.POST)
    public ModelAndView changeReady(HttpServletRequest request) {
        String testId= null, status = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            status = new String(request.getParameter("status").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        tDao.updateReady(testId, status);
        return showTestList();
    }

    @RequestMapping(value = "/deleteQuestion", method = RequestMethod.POST)
    public ModelAndView deleteQuestion(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String testId = null, questionId = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            questionId = new String(request.getParameter("questionId").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        qDao.deleteById(questionId);
        List <Question> questions = qDao.findAllByTest(testId);
        model.addObject("testId",testId);
        model.addObject("index", qDao.findNextIndexByTest(testId));
        model.addObject("questions", questions);
        model.addObject("size", questions.size());
        model.setViewName("addQuestion");
        return model;
    }

    @RequestMapping(value = "/changeTest", method = RequestMethod.POST)
    public ModelAndView changeTest(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String testId = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        model.addObject("testId",testId);
        model.addObject("index", qDao.findNextIndexByTest(testId));
        model.addObject("questions", qDao.findAllByTest(testId));
        model.setViewName("addQuestion");
        return model;
    }

    @RequestMapping(value = "/deleteTest", method = RequestMethod.POST)
    public ModelAndView deleteTest(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String testId = null;
        try {
            testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        tDao.deleteById(testId);
        return showTestList();
    }

    @Transactional
    @RequestMapping(value = "/showQuestion", method = RequestMethod.POST)
    public ModelAndView showQuestion(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        try {
            String testId = new String(request.getParameter("testId").getBytes("ISO-8859-1"), "UTF-8");
            String index = new String(request.getParameter("index").getBytes("ISO-8859-1"), "UTF-8");
            String right = null;
            if (index.equals("-1")) {
                Result r = rDao.findByTestIdAndPersonId(Integer.parseInt(testId), getPersonId());
                index = String.valueOf((r.getQuestionNum() + 1));
                Question question = qDao.findAllByTestIdAndIndex(testId, index);
                if (question != null) {
                    model.addObject("question", question);
                    model.addObject("right", r.getResult().toString());
                    model.addObject("testId", testId);
                    model.addObject("index", index);
                    model.setViewName("showQuestion");
                    return model;
                }
            } else
                right = new String(request.getParameter("right").getBytes("ISO-8859-1"), "UTF-8");
            Question question = new Question();
            Integer indx = Integer.parseInt(index);
            index = rDao.maxResult(testId);
            Integer r = 0;
            if (indx != 0) {
                question = qDao.findAllByTestIdAndIndex(testId, indx.toString());
                r = Integer.parseInt(right);
                if (question.getType().equals("open")) {
                    String choose = new String(request.getParameter("choose").getBytes("ISO-8859-1"), "UTF-8");
                    if (question.getAnswers().get(0).getText().equals(choose)) {
                        r += question.getAnswers().get(0).getPoint();
                        rDao.addResult(new Result(Integer.parseInt(testId), getPersonId(), r.toString(), index, indx));
                        model.addObject("right", r.toString());
                    } else {
                        model.addObject("right", right);
                        rDao.addResult(new Result(Integer.parseInt(testId), getPersonId(), right, index, indx));
                    }
                } else {
                    String[] choose = request.getParameterValues("choose");
                    List<Answer> answers = question.getAnswers();
                    for (int i = 0; i < choose.length; i++) {
                        if (answers.get(Integer.parseInt(choose[i])).getCorrect()) {
                            r += answers.get(Integer.parseInt(choose[i])).getPoint();
                        }
                    }
                    rDao.addResult(new Result(Integer.parseInt(testId), getPersonId(), r.toString(), index, indx));
                    model.addObject("right", r.toString());
                }
            } else {
                rDao.addResult(new Result(Integer.parseInt(testId), getPersonId(), right, index, indx));
                model.addObject("right", right);
            }
            indx++;
            question = qDao.findAllByTestIdAndIndex(testId, indx.toString());
            if (question != null) {
                model.addObject("question", question);
                model.setViewName("showQuestion");
                return model;
            }
            rDao.addResult(new Result(Integer.parseInt(testId), getPersonId(), r.toString(), index, null));
            model.addObject("result", r + "/" + index);
            model.setViewName("testResult");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return model;
    }
}