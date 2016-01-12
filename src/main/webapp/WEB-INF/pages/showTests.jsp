<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 09.11.2014
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <fmt:setBundle basename="ui.properties.messages"/>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <title>Список тестов</title>
</head>
<body>
<c:set var="ready" value="true"/>
<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation"><a href="welcome">Главная</a></li>
                <li role="presentation" class="active"><a href="showtestlist">Список тестов</a></li>
                <sec:authorize access="hasRole('ROLE_TEACHER')">
                    <li role="presentation">
                        <a href="newTest">Создать тест</a>
                    </li>
                    <li role="presentation">
                        <a href="showResult">Результаты</a>
                    </li>
                </sec:authorize>
                <li role="presentation">
                    <a href="javascript:formSubmit()" role="button">Выход</a>
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
        <c:forEach var="test" items="${tests}" varStatus="status">
            <div class="col-lg-6">
                <h1> ${topics[status.index].name} </h1>
                <c:choose>
                    <c:when test="${empty test}">
                        <div class="label-info">
                            <i> Тестов нет!</i>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th align="center">Название</th>
                                <th align="center">Статус</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="testsInfo" items="${test}" varStatus="st">
                                <sec:authorize access="hasRole('ROLE_STUDENT')">
                                    <c:if test="${testsInfo.ready eq ready}">
                                        <tbody>
                                        <tr>
                                            <td>${testsInfo.name}</td>
                                            <c:choose>
                                                <c:when test="${results[status.index+st.index].result eq null}">
                                                    <td>Тест не пройден!</td>
                                                    <td>
                                                        <form method="post" action="showTestDescription">
                                                            <input type="hidden" name="testId" value="${testsInfo.id}"/>
                                                            <input type="hidden" name="index" value='0'/>
                                                            <input type="hidden" name="right" value='0'>
                                                            <input type="submit" class="btn btn-info" value="Открыть"/>
                                                        </form>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${testsInfo.type eq 'learn' and (results[status.index+st.index].questionNum > -1)}">
                                                            <td>
                                                                Тест не закончен!
                                                                Результат: ${results[status.index+st.index].result}
                                                                из ${results[status.index+st.index].maxResult}
                                                            </td>
                                                            <td>
                                                                <form method="post" action="showTestDescription">
                                                                    <input type="hidden" name="testId"
                                                                           value="${testsInfo.id}"/>
                                                                    <input type="hidden" name="index" value='-1'/>
                                                                    <input type="submit" class="btn btn-info"
                                                                           value="Открыть"/>
                                                                </form>
                                                            </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>
                                                                Тест пройден!
                                                                Результат: ${results[status.index+st.index].result}
                                                                из ${results[status.index+st.index].maxResult}
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td></td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                        </tbody>
                                    </c:if>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_TEACHER')">
                                    <c:if test="${testsInfo.userId eq userId }">
                                        <tr>
                                            <td>${testsInfo.name}</td>
                                            <c:choose>
                                                <c:when test="${testsInfo.ready eq ready}">
                                                    <td>Открыт для прохождения
                                                        <form method="post" action="changeReady">
                                                            <input type="hidden" name="testId" value="${testsInfo.id}"/>
                                                            <input type="hidden" name="status" value="notready">
                                                            <input type="submit" class="btn btn-info" value="Изменить"/>
                                                        </form>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Закрыт для прохождения
                                                        <form method="post" action="changeReady">
                                                            <input type="hidden" name="testId" value="${testsInfo.id}"/>
                                                            <input type="hidden" name="status" value="ready">
                                                            <input type="submit" class="btn btn-info" value="Изменить"/>
                                                        </form>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>
                                                <form method="post" action="changeTest">
                                                    <input type="hidden" name="testId" value="${testsInfo.id}"/>
                                                    <input type="submit" class="btn btn-info" value="Изменить"/>
                                                </form>
                                            </td>
                                            <td>
                                                <form method="post" action="deleteTest">
                                                    <input type="hidden" name="testId" value="${testsInfo.id}"/>
                                                    <input type="submit" class="btn btn-info" value="Удалить"/>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:if>
                                </sec:authorize>

                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>
    <hr>
    <div class="col-lg-12">
        <footer>
            <p>&copy; Kozlova Vitaliya 2014</p>
        </footer>
    </div>
</div>
</body>
</html>
