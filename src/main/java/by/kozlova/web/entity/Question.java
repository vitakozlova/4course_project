package by.kozlova.web.entity;


import javax.persistence.*;
import java.util.List;

/**
 * Created by Oleg on 10.11.2014.
 */
@Entity
@Table(name="questions")
public class Question {

    @Id
    @Column(name = "QUESTION_ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "TEST_ID")
    private Integer testId;

    @Column(name = "questiontext")
    private String text;

    @Column(name = "number")
    private Integer index;

    @Column(name = "type")
    private String type;

    @OneToMany(mappedBy="question", fetch = FetchType.EAGER)
    private List<Answer> answers;

    public Question() {
    }
    public Question(Integer testId, String text, Integer index, String type) {
        this.testId = testId;
        this.text = text;
        this.index = index;
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answer) {
        this.answers = answer;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
