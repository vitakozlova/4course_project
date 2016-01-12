package by.kozlova.web.entity;

import javax.persistence.*;

/**
 * Created by Oleg on 26.04.2015.
 */
@Entity
@Table(name = "topic")
public class Topic {

    @Id
    @Column(name = "id")
    @GeneratedValue
    private Integer id;

    @Column(name = "name")
    private String name;

    public Topic(String name) {
        this.name = name;
    }

    public Topic() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
