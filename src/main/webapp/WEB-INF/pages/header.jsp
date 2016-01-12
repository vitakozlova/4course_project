<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 05.04.2015
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title></title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
</head>
<body>
<div class="header clearfix">
    <nav>
        <ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="welcome">Главная</a></li>
            <li role="presentation"><a href="showtestlist">Список тестов</a></li>
            <sec:authorize access="hasRole('ROLE_TEACHER')">
                <li role="presentation">
                    <a href="newTest">Создать тест</a>
                </li>
                <li role="presentation">
                    <a href="showResult">Результаты</a>
                </li>
            </sec:authorize>
            <li role="presentation">
                <a href="javascript:formSubmit()"
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
</body>
</html>
