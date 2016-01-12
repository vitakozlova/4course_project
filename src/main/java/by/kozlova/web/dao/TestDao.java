package by.kozlova.web.dao;

import by.kozlova.web.entity.Test;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Oleg on 05.04.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class TestDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    QuestionDao qDao = new QuestionDao();

    @Autowired
    ResultDao rDao = new ResultDao();

    @Transactional
    public void addTest(Test t) {
        getSession().save(t);
    }

    @Transactional(readOnly = true)
    public List<Test> getAllTests() {
        Query query = getSession().createQuery("from Test");
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return resultList;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public Test getTestById(String testId) {
        Query query = getSession().createQuery("from Test test where test.id = :testId");
        query.setParameter("testId", Integer.parseInt(testId));
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return (Test)resultList.get(0);
    }

    @Transactional
    public void updateReady(String testId, String status) {
        Test t = getTestById(testId);
        if(status.equals("ready"))
            t.setReady("true");
        else
            t.setReady("false");
        getSession().saveOrUpdate(t);
    }

    @Transactional
    public void deleteById(String testId) {
        qDao.deleteByTestId(testId);
        rDao.deleteByTestId(testId);
        Query query = getSession().createQuery("delete from Test where id =:testId");
        query.setParameter("testId", Integer.parseInt(testId));
        query.executeUpdate();
    }

    @Transactional
    public List<Test> getAllByTopic(Integer id) {
        Query query = getSession().createQuery("from Test test where test.topicId = :id");
        query.setParameter("id",id);
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return resultList.isEmpty() ? null :resultList;
    }

    @Transactional
    public List<Test> getTestByTeacherId(Integer personId) {
        Query query = getSession().createQuery("from Test test where test.userId = :id");
        query.setParameter("id", personId);
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return resultList.isEmpty() ? null :resultList;
    }
}
