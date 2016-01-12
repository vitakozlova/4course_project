<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 26.04.2015
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Описание теста</title>
</head>
<body>
<div class="container">
<jsp:include page="./header.jsp"></jsp:include>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel-default">
                <div class="panel-heading">
                    <h1><b>${test.name}</b>
                        <c:if test="${test.type eq 'control'}">
                            <font style="float: right"><i>Контрольный</i></font>
                        </c:if>
                        <c:if test="${test.type eq 'learn'}">
                            <font style="float: right"><i>Тренировочный</i></font>
                        </c:if>
                    </h1>
                </div>
                <div class="panel-body">
                    <p style="white-space: pre-wrap;">${test.description}</p>
                        <form method="post" action="showQuestion">
                            <input type="hidden" name="testId"
                                   value="${test.id}"/>
                            <input type="hidden" name="index" value="${index}"/>
                            <input type="hidden" name="right" value='0'>
                            <input type="submit" class="btn btn-info"
                                   value="Начать"/>
                        </form>
                </div>
            </div>
        </div>
        </div>

<hr>
<footer>
    <p>&copy; Kozlova Vitaliya 2014</p>
</footer>
</div>
</body>
</html>
