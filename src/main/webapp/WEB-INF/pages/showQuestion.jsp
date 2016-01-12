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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <fmt:setBundle basename="/resources/messages"/>
    <title>Тестовый вопрос</title>
</head>
<body>
<div class="container">
    <jsp:include page="./header.jsp"></jsp:include>
    <table class="table">
        <c:if test="${question!=null}">
            <tr>
                <td>
                    <form method="post" class="form-horizontal" action="showQuestion">
                        <div class="form-group">
                            <pre> ${question.text}</pre>
                        </div>
                        <c:choose>
                            <c:when test="${question.type == 'open'}">
                                <input type="text" name="choose"/>
                            </c:when>
                            <c:otherwise>
                                <ul style="list-style-type: none;">
                                <c:forEach var="answer" items="${question.answers}" varStatus="st">
                                    <c:choose>
                                        <c:when test="${question.type == 'one'}">
                                            <div class="form-group">
                                                <label class="radio-inline">
                                                   <li class="list-group-item-info"><input type="radio" name="choose" value="${st.index}"/>${answer.text}</li>
                                                </label>
                                            </div>
                                        </c:when>
                                        <c:when test="${question.type == 'many'}">
                                            <div class="form-group">
                                                <label class="radio-inline">
                                                    <li role="presentation" class="list-group-item-info"><input type="checkbox" name="choose" value="${st.index}"/>${answer.text}</li>
                                                </label>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                </ul>
                                    </c:otherwise>
                        </c:choose>
                        <div class="form-group">
                            <input type="hidden" name="testId" value="${question.testId}"/>
                            <input type="hidden" name="index" value="${question.index}">
                            <input type="hidden" name="right" value="${right}">
                            <br>
                            <input type="submit" class="btn btn-info" value="Ответить"/>
                        </div>
                    </form>
                </td>
            </tr>
        </c:if>
    </table>
    <hr>
    <footer>
        <p>&copy; Kozlova Vitaliya 2014</p>
    </footer>
</div>
</body>
</html>

