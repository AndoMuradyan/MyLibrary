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
        <th>image</th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>age</th>
        <th>action</th>
    </tr>
    <%for (Author author : authors) {%>
    <tr>
        <td>
            <% if(author.getProfilePic() == null || author.getProfilePic().length() == 0) {%>
            <img src="/image/defaultProfileImg.png" width="100"/>
            <%} else {%>
            <img src="/getImage?profilePic=<%=author.getProfilePic()%>" width="100"/>
            <% } %>
        </td>
        <td><%=author.getId()%>
        </td>
        <td><%=author.getName()%>
        </td>
        <td><%=author.getSurname()%>
        </td>
        <td><%=author.getEmail()%>
        </td>
        <td><%=author.getAge()%>
        </td>
        <td>
            <a href="/authors/delete?authorId=<%=author.getId()%>">Delete</a> |
            <a href="/authors/edit?authorId=<%=author.getId()%>">Edit</a>
        </td>
    </tr>


    <% }%>

</table>
</body>
</html>
