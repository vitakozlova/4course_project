package by.kozlova.web.entity;

import javax.persistence.*;

/**
* Created by Oleg on 10.11.2014.
*/
@Entity
@Table(name="answers")
public class Answer {

    @Id
    @Column(name = "ANSWER_ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "answertext")
    private String text;

    @Column(name = "correct")
    private Boolean correct;

    @Column(name = "point")
    private Integer point;

    @ManyToOne
    @JoinColumn(name="question_id")
    private Question question;

    public Answer() {
    }

    public Answer(String text, Boolean correct, Integer point) {
        this.text = text;
        this.correct = correct;
        this.point = point;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getCorrect() {
        return correct;
    }

    public void setCorrect(Boolean correct) {
        this.correct = correct;
    }

    public Integer getId() {
        return id;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }
}
