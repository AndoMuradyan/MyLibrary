<%@ page import="model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08.09.2022
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("authors");
%>
<table border="1px">
    <tr>

        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>password</th>
        <th>action</th>
    </tr>
    <%for (User user : users) {%>
    <tr>
        <td>

        </td>
        <td><%=user.getId()%>
        </td>
        <td><%=user.getName()%>
        </td>
        <td><%=user.getSurname()%>
        </td>
        <td><%=user.getEmail()%>
        </td>
        <td><%=user.getPassword()%>
        </td>
        <td>
            <a href="/users/add">Add</a>
<%--            <a href="/users/delete?authorId=<%=user.getId()%>">Delete</a> |--%>
<%--            <a href="/authors/edit?authorId=<%=user.getId()%>">Edit</a>--%>
        </td>
    </tr>


    <% }%>

</table>

</body>
</html>
