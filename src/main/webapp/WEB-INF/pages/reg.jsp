<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 06.03.2015
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Регистрация</title>
    <link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="screen"/>
</head>
<body>
<div class="container" style="width: 300px;">
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <form:form class="form-signin" method="post" action="add">
        <h2 class="form-signin-heading">Введите данные для регистрации</h2>
        <input type="text" placeholder="Логин" class="form-control" name="username"/><br>
        <input type="text" placeholder="Имя" class="form-control" name="firstname"/><br>
        <input type="text" placeholder="Фамилия" class="form-control" name="lastname"/><br>
        <input type="text" placeholder="E-mail" class="form-control" name="email"/><br>
        <input type="radio" name="role" value="2"/>Студент<br/>
        <input type="radio" name="role" value="0"/>Преподаватель<br/><br>
        <input type="password" placeholder="Пароль" class="form-control" name="password"/><br>
        <input type="password" placeholder="Повторите пароль" class="form-control" name="check_password"/><br>
        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Готово"/>
    </form:form>
    <form:form method="get" action="login">
        <input name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
               value="Назад"/>
    </form:form>
    <div class="footer pull-right">
        <p>© KozlovaVO 2015</p>
    </div>
</div>
</body>
</html>
