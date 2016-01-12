package by.kozlova.web.dao;

import by.kozlova.web.entity.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.List;


/**
 * Created by Oleg on 06.03.2015.
 */
@Repository
@SuppressWarnings("unchecked")
public class PersonDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional(readOnly = true)
    public Person getPersonByLogin(String login) {
        Query query = getSession().createQuery("from Person user where user.username = :username");
        query.setParameter("username", login);

        @SuppressWarnings("rawtypes")
        List resultList = query.list();

        return (resultList.isEmpty()) ? null : (Person) resultList.get(0);
    }

    @Transactional
    public void addPerson(Person p) {
        getSession().save(p);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional(readOnly = true)
    public boolean checkUsername(String username) {
        Person p = getPersonByLogin(username);
        if(p!= null)
            return true;
        else
            return false;
    }

    @Transactional
    public Person getPersonById(Integer id) {
        Query query = getSession().createQuery("from Person user where user.id = :id");
        query.setParameter("id", id);

        @SuppressWarnings("rawtypes")
        List resultList = query.list();
        return (resultList.isEmpty()) ? null : (Person) resultList.get(0);
    }
}
