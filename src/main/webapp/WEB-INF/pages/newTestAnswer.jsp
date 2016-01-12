<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 30.11.2014
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Новые ответы</title>
</head>
<body>

<div class="container">
    <jsp:include page="./header.jsp"></jsp:include>
    <table class="table">
        <tr>
            <td>
                <form action="newQuestion" class="form-horizontal" method="post">
                    <div class="form-group">
                        <pre>${questionText}</pre>
                    </div>

                    <c:choose>
                        <c:when test="${type == 'open'}">
                            <div class="form-group">
                                <div class="form-group col-sm-4">
                                    <label for="correct" class="col-sm-3 control-label">Ответ</label>
                                    <input type="text" required="" id="correct" name="correct"/>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label for="point1" class="control-label">Баллы</label>
                                    <input type="text" id="point1" name="point" required="" placeholder="0"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach begin="1" end="${numberOfAnswer}" varStatus="loop">
                                <div class="form-group col-sm-4">
                                    <label for="answer" class=" control-label">Ответ № ${loop.index}</label>
                                    <input type="text" required="" id="answer" name="answer_${loop.index}"/>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label class="control-label">Верно</label>
                                    <c:choose>
                                        <c:when test="${type == 'one'}">
                                            <input type="radio" name="correct" value="${loop.index}"/>
                                        </c:when>
                                        <c:when test="${type == 'many'}">
                                            <input type="checkbox" name="correct" value="${loop.index}"/>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label for="point" class="control-label">Баллы</label>
                                    <input type="text" id="point" name="point_${loop.index}" placeholder="0"/>
                                </div>
                                <br>
                                <br>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-7">
                            <input type="hidden" name="index" value="${index}"/>
                            <input type="hidden" name="testId" value="${testId}"/>
                            <input type="hidden" name="type" value="${type}"/>
                            <input type="hidden" name="numberOfAnswer" value="${numberOfAnswer}"/>
                            <input type="hidden" name="questionText" value="${questionText}"/>
                            <input type="submit" class="btn btn-primary" value="Готово"/>
                        </div>
                    </div>
                    <%--<table id="table_container">--%>
                    <%--<tr>--%>
                    <%--<td width="100px" colspan="2"><strong>Название</strong></td>--%>
                    <%--</tr>--%>
                    <%--</table>--%>
                    <%--<br/>--%>
                    <%--<input type="button" value="Добавить поле" id="add" onclick="return add_new_image();">--%>
                </form>
            </td>
        </tr>
    </table>
    <br>
    <footer>
        <p>&copy; Kozlova Vitaliya 2014</p>
    </footer>
</div>
</body>
</html>
