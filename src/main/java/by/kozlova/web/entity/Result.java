package by.kozlova.web.entity;


import javax.persistence.*;

/**
* Created by Oleg on 05.12.2014.
*/
@Entity
@Table(name="results")
public class Result {

    @Id
    @Column(name = "RESULT_ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "TEST_ID")
    private Integer test_id;

    @Column(name = "PERSON_ID")
    private Integer person_id;

    @Column(name = "result")
    private String result;

    @Column(name = "max_result")
    private String maxResult;

    @Column(name = "question_num")
    private Integer questionNum;

    public Result(Integer test_id, Integer person_id, String result, String maxResult, Integer questionNum) {
        this.test_id = test_id;
        this.person_id = person_id;
        this.result = result;
        this.maxResult = maxResult;
        this.questionNum = questionNum;
    }

    public Result() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTest_id() {
        return test_id;
    }

    public void setTest_id(Integer test_id) {
        this.test_id = test_id;
    }

    public Integer getPerson_id() {
        return person_id;
    }

    public void setPerson_id(Integer person_id) {
        this.person_id = person_id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMaxResult() {
        return maxResult;
    }

    public void setMaxResult(String maxResult) {
        this.maxResult = maxResult;
    }


    public Integer getId() {
        return id;
    }

    public Integer getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(Integer questionNum) {
        this.questionNum = questionNum;
    }
}
