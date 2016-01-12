package by.kozlova.web.entity;
import javax.persistence.*;
/**
 * Created by Oleg on 06.03.2015.
 */
@Entity
@Table (name="users")
public class Person {
    @Id
    @Column (name = "USER_ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "username")
    private String username;

    @Column (name = "firstname")
    private String firstname;

    @Column (name = "lastname")
    private String lastname;

    @Column (name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column (name = "enabled")
    private boolean enabled;

    @Column (name = "role")
    private PersonRole role;

    public Person() {
    }

    public Person(String username, String firstname, String lastname, String email, String password, PersonRole role, boolean enabled) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.enabled = enabled;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public PersonRole getRole() {
        return role;
    }

    public void setRole(PersonRole role) {
        this.role = role;
    }
}