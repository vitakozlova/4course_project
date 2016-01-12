<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 09.11.2014
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Главная</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <%--<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="screen"/>--%>
</head>
<body>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation" class="active"><a href="welcome">Главная</a></li>
                <li role="presentation" ><a href="showtestlist">Список тестов</a></li>
                <li role="presentation">
                    <sec:authorize access="hasRole('ROLE_TEACHER')">
                        <a href="newTest">Создать тест</a>
                <li role="presentation">
                    <a href="showResult">Результаты</a>
                </li>
                    </sec:authorize>
                </li>
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
                    </script></li>
            </ul>
        </nav>
        <h3 class="text-muted">Тестирующая система</h3>
    </div>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h2>Добро пожаловать, <sec:authentication property="principal.username"/>!</h2>

    </div>
    <p>${requestScope.info}</p>
<hr>
    <footer>
        <p>&copy; Kozlova Vitaliya 2014</p>
    </footer>
</div>
</body>
</html>