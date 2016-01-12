package by.kozlova.web.service;

import by.kozlova.web.dao.PersonDao;
import by.kozlova.web.entity.Person;
import by.kozlova.web.entity.PersonRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by Oleg on 05.03.2015.
 */
@Service
public class PersonDetailsService implements UserDetailsService {
    @Autowired
    private PersonDao personDao;
//    @Autowired
//    private PasswordEncoder passwordEncoder;
    private static boolean superAdminSet = false;

    @Override
    public PersonDetails loadUserByUsername(String userLogin) throws UsernameNotFoundException {
//        if (!superAdminSet) {
//            addSuperAdmin();
//        }
        Person person = personDao.getPersonByLogin(userLogin);

        if (person == null) {

            throw new UsernameNotFoundException(userLogin);
        }

        return new PersonDetails(person, getAuthorities(person.getRole()));
    }

    public Collection<? extends GrantedAuthority> getAuthorities(PersonRole role) {
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        authList.add(new SimpleGrantedAuthority(role.toString()));
        return authList;
    }

//    private void addSuperAdmin() {
//        String login = "manager";
//        if (employeeDao.getEmployeeByLogin(login) == null) {
//            employeeDao.addEmployee(new Employee(login, passwordEncoder.encodePassword("manager", login), EmployeeRole.ROLE_MANAGER, "Вита", "Козлова"));
//        }
//        superAdminSet = true;
//    }
}
