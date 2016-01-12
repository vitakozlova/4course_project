<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Авторизация</title>
    <link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="screen"/>
</head>
<body>
<div class="container" style="width: 300px;">
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>
    <form class="form-signin" role="form" method="post" action="<c:url value='/j_spring_security_check' />">
        <h2 class="form-signin-heading">Выполните вход</h2>
        <label for="inputEmail" class="sr-only">Логин</label>
        <input type="text" id="inputEmail" name="j_username" class="form-control" placeholder="Логин" required
               autofocus>
        <label for="inputPassword" class="sr-only">Пароль</label>
        <input type="password" id="inputPassword" name="j_password" class="form-control" placeholder="Пароль" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Вход</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    </form>
    <form:form method="post" action="reg">
        <input name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
               value="Регистрация"/>
    </form:form>
    <div class="footer pull-right">
        <p>© KozlovaVO 2015</p>
    </div>
</div>
</body>
</html>