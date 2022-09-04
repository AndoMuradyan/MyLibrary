<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.09.2022
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>
<%
  List<Author> authors = (List<Author>) request.getAttribute("authors");
%>
<table border="1px">
  <tr>
    <th>id</th>
    <th>name</th>
    <th>surname</th>
    <th>email</th>
    <th>age</th>
    <th>action</th>

  <% for (Author author : authors) {%>

  <tr>

    <td><%=author.getId()%>
    <td><%=author.getName()%>
    <td><%=author.getSurname()%>
    <td><%=author.getEmail()%>
    <td><%=author.getAge()%>
    <td>
    <a href="/authors/delete?authorId=<%=author.getId()%>">Delete</a> |
  <a href="/authors/edit?authorId=<%=author.getId()%>">Edit</a>
  </td>

  </tr>
  <%}
  %>
</tr>
</table>
</body>
</html>
