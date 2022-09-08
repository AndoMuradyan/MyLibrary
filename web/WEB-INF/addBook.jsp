<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.09.2022
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>
<%
//        List<Book> books = (List<Book>) request.getAttribute("books");
    List<Author> authors = (List<Author>) request.getAttribute("authors");
%>
Please input book's
<form action="/books/add" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="title"><br>
    <input type="text" name="description" placeholder="description"><br>
    <input type="text" name="price" placeholder="price"><br>
        Profile Picture:<br>
        <input type="file" name="profilePic"><br>
    <select name="authorId"><br>

        <% for (Author author : authors) { %>
        <option value="<%=author.getId()%>"><%=author.getName()%>
        </option>
        <% } %><br>
    </select>

    <input type="submit" value="Add">
</form>
</body>
</html>
