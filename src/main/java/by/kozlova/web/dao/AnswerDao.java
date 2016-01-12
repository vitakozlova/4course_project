package by.kozlova.web.dao;

import by.kozlova.web.entity.Answer;
import by.kozlova.web.entity.Question;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Oleg on 05.04.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class AnswerDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void addAnswer(Answer a) {
        getSession().save(a);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void deleteByQuestionId(Question q) {
        Query query = getSession().createQuery("delete from Answer where question =:q");
        query.setParameter("q", q);
        query.executeUpdate();
    }
}
