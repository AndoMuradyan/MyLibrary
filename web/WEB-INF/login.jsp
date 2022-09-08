<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08.09.2022
  Time: 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if (msg != null) {%>
<p style="color: red"><%=msg%>
</p>
<%}%>
<form action="/login" method="post">
    <input type="email" name="email" placeholder="email"><br>
    <input type="password" name="password" placeholder="password"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
