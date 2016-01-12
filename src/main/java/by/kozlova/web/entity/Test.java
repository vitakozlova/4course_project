package by.kozlova.web.entity;

import javax.persistence.*;

/**
 * Created by Oleg on 09.11.2014.
 */
@Entity
@Table(name = "tests")
public class Test {

    @Id
    @Column(name = "TEST_ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "ready")
    private String ready;

    @Column(name = "type")
    private String type;

    @Column(name = "TOPIC_ID")
    private Integer topicId;

    @Column(name = "USER_ID")
    private Integer userId;

    public Test() {
    }

    public Test(String name, String description, String type, Integer userId, Integer topicId) {
        this.name = name;
        this.description = description;
        this.type = type;
        this.topicId = topicId;
        this.userId = userId;
    }

    public String getReady() {
        return ready;
    }

    public void setReady(String ready) {
        this.ready = ready;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTopic() {
        return topicId;
    }

    public void setTopic(Integer topic) {
        this.topicId = topic;
    }
}
