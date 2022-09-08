<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08.09.2022
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if (msg != null) {%>
<p style="color: red"><%=msg%>
</p>
<%}%>
Please input user's
<form action="/users/add" method="post">
    <input type="text" name="name" placeholder="name"><br>
    <input type="text" name="surname" placeholder="surname"><br>
    <input type="text" name="email" placeholder="email"><br>
    <input type="password" name="password" placeholder="password">


    <input type="submit" value="Add">
</form>
</body>
</html>
