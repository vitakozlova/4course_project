<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 30.11.2014
  Time: 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить вопрос</title>
</head>
<body>
<div class="container">
    <jsp:include page="./header.jsp"></jsp:include>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-2">
            <form action="addQuestion" class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="text" class="col-sm-2 control-label">Формулировка вопроса</label>

                    <div class="col-sm-10">
                        <textarea type="text" required="" rows="15" class="form-control" id="text"
                                  name="questionText"
                                  placeholder="Вопрос"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numb" class="col-sm-2 control-label">Количество ответов</label>

                    <div class="col-sm-10">
                        <input type="text" value="1" class="form-control" id="numb" name="numberOfAnswer"
                               placeholder="Количесво"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">Тип вопроса</label>
                    <input type="radio" required="" id="type" name="type" value="one"/>Один правильный ответ
                    <input type="radio" name="type" value="many"/>Много правильных ответов
                    <input type="radio" name="type" value="open"/>Открытый вопрос
                </div>
                <input type="hidden" name="testId" value="${testId}"/>
                <input type="hidden" name="index" value="${index}"/>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-primary btn-block" value="Далее"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-2">

            <c:forEach var="question" items="${requestScope.questions}" varStatus="st">
                <div class="panel-info">
                    <div class="panel-heading">
                        <p style="white-space: pre-wrap;">
                                ${question.text}
                        </p>

                        <form action="deleteQuestion" class="form-horizontal" method="post">
                            <input type="hidden" name="questionId" value="${question.id}"/>
                            <input type="hidden" name="testId" value="${testId}"/>
                            <input type="submit" class="btn btn-danger" value="Удалить">
                        </form>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="answer" items="${question.answers}" varStatus="st">
                                <li>${answer.text}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <c:if test="${size > 0}">
        <form action="testIsReady" class="form-horizontal" method="post">
            <div class="form-group">
                <input type="hidden" name="testId" value="${testId}"/>

                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary btn-block" value="Готово"/>
                </div>
            </div>
        </form>
    </c:if>

    <br>
    <footer>
        <p>&copy; Kozlova Vitaliya 2014</p>
    </footer>
</div>
</body>
</html>