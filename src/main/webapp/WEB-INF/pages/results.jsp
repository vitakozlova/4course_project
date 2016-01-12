<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 03.05.2015
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Результаты</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js" />"></script>
</head>
<body>
<div class="container">
    <div class="header clearfix">
    <nav>
        <ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="welcome">Главная</a></li>
            <li role="presentation"><a href="showtestlist">Список тестов</a></li>
            <sec:authorize access="hasRole('ROLE_TEACHER')">
                <li role="presentation" >
                    <a href="newTest">Создать тест</a>
                </li>
                <li role="presentation" class="active">
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
        <div class="col-lg-8 col-lg-offset-2">
            <script>
                $(function () {
                    $("#accordion").accordion();
                });
            </script>
            <div id="accordion">
            <c:forEach var="result" items="${results}" varStatus="status">
                <c:if test="${not empty result}">
                        <h1> ${tests[status.index].name} </h1>
                        <div>
                            <p>
                            <table class="table table-striped">
                                <thead>
                                <th> №</th>
                                <th> ФИО</th>
                                <th> Результат</th>
                                <th>Макс.Результат</th>
                                </thead>
                                <tbody>
                                <c:forEach var="resInfo" items="${result}" varStatus="st">
                                    <tr>
                                        <td>${st.index+1}</td>
                                        <td>${resInfo.name}</td>
                                        <td> ${resInfo.result}</td>
                                        <td> ${resInfo.maxResult}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            </p>
                        </div>
                    <br>
                    <hr>
                </c:if>
            </c:forEach>
            </div>
            <c:if test="${empty results}">
                <h1>Ваши тесты еще никто не проходил!</h1>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
