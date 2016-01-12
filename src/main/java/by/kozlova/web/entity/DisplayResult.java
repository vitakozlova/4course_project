package by.kozlova.web.entity;

/**
 * Created by Oleg on 03.05.2015.
 */
public class DisplayResult {
    private String name;

    private String result;

    private String maxResult;

    public DisplayResult(String name, String result, String maxResult) {
        this.name = name;
        this.result = result;
        this.maxResult = maxResult;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}
