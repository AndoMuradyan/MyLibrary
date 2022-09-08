<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.09.2022
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<%
    User user = (User) session.getAttribute("user");
%>
<body>
<div>
    Hello <br>
    <a href="/books">Show All Books</a>
    <% if (user != null) {%>
    <a href="/authors">Show All Authors</a> |
    <a href="/author/add">Add Author</a> |
    <a href="/books/add">Add Book</a> |
    <a href="/logout">Logout</a>

    <%} else {%>
    <a href="/login">Login</a>
    <a href="/users/add">Register</a>
    <%}%>
</div>


</body>
</html>
