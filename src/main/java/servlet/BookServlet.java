package servlet;

import manager.AuthorManager;
import manager.BookManager;

import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/books")
public class BookServlet extends HttpServlet {
    private  BookManager bookManager = new BookManager();
    private  AuthorManager authorManager= new AuthorManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> authorList = bookManager.getAllBooks();
        req.setAttribute("books",authorList);
        req.getRequestDispatcher("/WEB-INF/books.jsp").forward(req,resp);
    }
}
