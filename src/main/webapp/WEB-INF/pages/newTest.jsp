<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 30.11.2014
  Time: 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Новый тест</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"><a href="welcome">Главная</a></li>
                <li role="presentation"><a href="showtestlist">Список тестов</a></li>
                <sec:authorize access="hasRole('ROLE_TEACHER')">
                    <li role="presentation" class="active">
                        <a href="newTest">Создать тест</a>
                    </li>
                    <li role="presentation">
                        <a href="showResult">Результаты</a>
                    </li>
                </sec:authorize>

                <li role="presentation"><a href="javascript:formSubmit()"
                                           role="button">Выход</a>
                    <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>
                </li>
            </ul>
        </nav>
        <h3 class="text-muted">Тестирующая система</h3>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <script>
                function showForm() {
                    document.getElementById('addTopic').style.display = "block";
                    document.getElementById('s').style.display = "none";

                }
            </script>
            <input type="submit" id="s" class="btn btn-danger btn-lg" value="Создать тему" onclick="showForm()"/>

            <form action="createTopic" method="post" id="addTopic" style="display:none;" class="form-inline">
                <div class="form-group">
                    <label class="control-label">Создаем новую тему</label>
                    <br>
                    <input type="text" placeholder="Введите название темы" required="" class="form-control"
                           name="topicName"/>

                    <input type="submit" value="Создать" class="btn btn-primary"/>
                </div>
            </form>
        </div>
        <div class="col-lg-8">
            <h2>Для создания нового теста необходимо заполнить все поля</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-4">
            <form action="newTest" class="form-horizontal" method="post">
                <div class="form-group">


                    <div class="col-sm-6">
                        <label class="control-label">Тема теста</label>
                        <select class="form-control" id="testTopic" required="" name="testTopic"
                                placeholder="Выберите тему теста">
                            <option disabled selected>Выберите тему или создайте новую</option>
                            <c:forEach var="topic" items="${topics}" varStatus="st">
                                <option value="${topic.id}">${topic.name}</option>
                            </c:forEach>
                        </select>

                    </div>
                </div>
                <div class="form-group">


                    <div class="col-sm-6">
                        <label class="control-label">Название теста</label>
                        <input type="text" class="form-control" id="testName" required="" name="testName"
                               placeholder="Название">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-sm-6">

                        <label class="control-label">Описание теста</label>
                        <textarea required="" class="form-control" rows="10" id="testD" name="testDescription"
                                  placeholder="Описание..."></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">Тип теста</label>
                    <br>
                    <input type="radio" required="" id="type" name="testType" value="control"/>Контрольный
                    <input type="radio" name="testType" value="learn"/>Подготовительный
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Далее"/>
                </div>
            </form>
        </div>
    </div>
    <br>
    <footer>
        <p>&copy; Kozlova Vitaliya 2014</p>
    </footer>
</div>
</body>
</html>
