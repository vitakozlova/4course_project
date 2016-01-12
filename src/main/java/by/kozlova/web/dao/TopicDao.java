package by.kozlova.web.dao;

import by.kozlova.web.entity.Topic;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Oleg on 26.04.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class TopicDao {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void addTopic(Topic t) {
        getSession().save(t);
    }

    @Transactional(readOnly = true)
    public List<Topic> getAllTopic() {
        Query query = getSession().createQuery("from Topic");
        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return resultList;
    }
}
