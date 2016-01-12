package by.kozlova.web.dao;

import by.kozlova.web.entity.Question;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Oleg on 05.04.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class QuestionDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    AnswerDao aDao = new AnswerDao();

    @Transactional
    public void addQuestion(Question q) {
        getSession().save(q);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public List<Question> findAllByTest(String testId) {
        Query query = getSession().createQuery("from Question question where question.testId = :testId");
        query.setParameter("testId", Integer.parseInt(testId));
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return resultList;
    }

    @Transactional
    public Integer findNextIndexByTest(String testId) {
        Query query = getSession().createQuery("from Question question where question.testId = :testId");
        query.setParameter("testId", Integer.parseInt(testId));
        @SuppressWarnings("rawtypes")
        List<Question> resultList = query.list();
        return resultList.isEmpty() ? null : resultList.get(resultList.size()-1).getIndex()+1;
    }

    @Transactional
    public void deleteByTestId(String testId) {
        List<Question> qList= findAllByTest(testId);
        for(int i = 0; i<qList.size();i++)
            aDao.deleteByQuestionId(qList.get(i));
        Query query = getSession().createQuery("delete from Question where testId =:testId");
        query.setParameter("testId", Integer.parseInt(testId));
        query.executeUpdate();
    }

    @Transactional
    public void deleteById(String qId) {
        Question q= findById(qId);
        aDao.deleteByQuestionId(q);
        Query query = getSession().createQuery("delete from Question where id =:qId");
        query.setParameter("qId", Integer.parseInt(qId));
        query.executeUpdate();
        List<Question> qList = findAllByTest(q.getTestId().toString());
        for(Question q1: qList) {
            if(q1.getIndex() > q.getIndex()) {
                q1.setIndex(q1.getIndex() - 1);
                getSession().saveOrUpdate(q1);
            }
        }
    }

    @Transactional
    public Question findAllByTestIdAndIndex(String testId, String index) {
        Query query = getSession().createQuery("from Question question where question.testId = :testId and question.index=:index");
        query.setParameter("testId", Integer.parseInt(testId));
        query.setParameter("index", Integer.parseInt(index));
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return (resultList.isEmpty()) ? null :(Question)resultList.get(0);
    }

    @Transactional
    public Question findById(String qId) {
        Query query = getSession().createQuery("from Question question where question.id=:id");
        query.setParameter("id", Integer.parseInt(qId));
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return (resultList.isEmpty()) ? null :(Question)resultList.get(0);
    }

}
