package by.kozlova.web.dao;

import by.kozlova.web.entity.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Created by Oleg on 05.04.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class ResultDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    QuestionDao qDao = new QuestionDao();

    @Autowired
    AnswerDao aDao = new AnswerDao();

    @Autowired
    PersonDao pDao = new PersonDao();

    @Transactional
    public void addResult(Result r) {
        Result rr = findByTestIdAndPersonId(r.getTest_id(),r.getPerson_id());
        if(rr == null) {
            rr = r;
            getSession().save(rr);
        }
        else {
            rr.setResult(r.getResult());
            rr.setQuestionNum(r.getQuestionNum());
            getSession().update(rr);
        }
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public Result findByTestIdAndPersonId(Integer testId, Integer personId) {
        Query query = getSession().createQuery("from Result r where r.test_id = :testId and r.person_id=:personId");
        query.setParameter("testId", testId);
        query.setParameter("personId", personId);
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return (resultList.isEmpty()) ? null :(Result)resultList.get(0);
    }

    public String maxResult(String testId) {
        Integer maxResult = 0;
        List<Question> questions = qDao.findAllByTest(testId);
        for(Question q:questions) {
            List<Answer> answers = q.getAnswers();
            for(Answer a: answers) {
                maxResult += a.getPoint();
            }
        }
        return maxResult.toString();
    }

    @Transactional
    public void deleteByTestId(String testId) {
        Query query = getSession().createQuery("delete from Result where test_id =:testId");
        query.setParameter("testId", Integer.parseInt(testId));
        query.executeUpdate();
    }

    @Transactional
    public List<DisplayResult> getResultByTestId(Integer id) {
        Query query = getSession().createQuery("from Result r where r.test_id = :testId ORDER BY r.result desc");
        query.setParameter("testId", id);
        @SuppressWarnings("rawtypes")
        List<Result> resultList = query.list();
        List<DisplayResult> displayResults = new ArrayList<DisplayResult>();
        for(Result r:resultList) {
            Person p = pDao.getPersonById(r.getPerson_id());
            displayResults.add(new DisplayResult(p.getLastname()+" "+p.getFirstname(), r.getResult(), r.getMaxResult()));
        }
        return displayResults.isEmpty() ? null :displayResults;
    }
}
