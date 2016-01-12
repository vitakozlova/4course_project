<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 10.11.2014
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 10.11.2014
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 09.11.2014
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <fmt:setBundle basename="ui.properties.messages" />
    <title>Результаты теста</title>
</head>
<body>
<div class="container">
    <jsp:include page="./header.jsp"></jsp:include>
<table class="table">
    <tr>
        <td>
            Тест пройден!
        </td>
    </tr>
    <tr>
        <td>
            Результат ${result}
        </td>
    </tr>
    <%--<tr>--%>
        <%--<td>--%>
            <%--<form method="post" action="showtestlist" class="form-horizontal">--%>
                <%--<div class="form-group">--%>
                    <%--<input type="submit" class="btn btn-primary btn-block" value="Вернуться к списку тестов"/>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</td>--%>
    <%--</tr>--%>
</table>
    <hr>
<footer>
    <p>&copy; Kozlova Vitaliya 2014</p>
</footer>
</div>
</body>
</html>

