<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.09.2022
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
</head>
<body>
<%--<%--%>
<%--    List<Author> authors = (List<Author>) request.getAttribute("authors");--%>
<%--%>--%>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if (msg != null) {%>
<p style="color: red"><%=msg%>
</p>
<%}%>
Please input user's
<form action="/author/add" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="name"><br>
    <input type="text" name="surname" placeholder="surname"><br>
    <input type="text" name="email" placeholder="email"><br>
    <input type="number" name="age" placeholder="age"><br>
    Profile Picture:<br>
    <input type="file"name="profilePic"><br>

    <input type="submit" value="Add">
</form>
</body>
</html>
