package by.kozlova.web.service;

import by.kozlova.web.entity.Person;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * Created by Oleg on 05.03.2015.
 */
public class PersonDetails extends User{
    private Person person;

    public PersonDetails(Person person, Collection<? extends GrantedAuthority> authorities) {
        super(person.getUsername(), person.getPassword(), true, true, true, true, authorities);
        this.person = person;
    }

    public Person getPerson() {
        return person;
    }
}
