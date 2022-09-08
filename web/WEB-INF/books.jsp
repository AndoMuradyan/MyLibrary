<%@ page import="model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.09.2022
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<body>
<%

    List<Book> books = (List<Book>) request.getAttribute("books");

%>
<table border="1px">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author</th>
        <th>action</th>
    </tr>>

            <% for (Book book : books) {%>
    <tr>
        <td>
            <% if (book.getProfilePic() == null || book.getProfilePic().length() == 0) { %>
            <img src="/image/defaultBook.png" width="100"/>
            <%} else { %>
            <img src="/getImage?profilePic=<%=book.getProfilePic()%>" width="100"/>
            <% }%>
        </td>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription()%>
        </td>
        <td><%=book.getPrice()%>
        </td>

        <td>
            <% if (book.getAuthor() != null) { %>
            <%=book.getAuthor().getName()%>
            <%=book.getAuthor().getSurname()%>
            <%=book.getAuthor().getEmail()%>
            <%} else {%>
            <span style="color: red">there is no author</span>

            <%}%>
        </td>
        <td>
            <a href="/books/delete?bookId=<%=book.getId()%>">Delete</a>

        </td>
    </tr>
    <%
        }
    %>

</table>
</body>
</html>
