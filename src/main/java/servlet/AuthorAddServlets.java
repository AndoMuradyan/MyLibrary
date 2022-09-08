package servlet;

import manager.AuthorManager;
import manager.UserManager;
import model.Author;
import model.User;

import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = "/author/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AuthorAddServlets extends HttpServlet {
    AuthorManager authorManager = new AuthorManager();
    UserManager userManager = new UserManager();

    private static final String IMAGE_PATH = "C:\\Users\\user\\IdeaProjects\\myLibrary1\\myLibraryImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/addAuthor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int age = Integer.parseInt(req.getParameter("age"));

        Part profilePicPart = req.getPart("profilePic");


        String fileName = null;
        if (profilePicPart != null) {
            long nanoTime = System.nanoTime();
            fileName = nanoTime + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(IMAGE_PATH + fileName);
        }

        Author author = Author.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .age(age)
                .profilePic(fileName)
                .build();
        authorManager.add(author);
        resp.sendRedirect("/authors");
    }

}
//}
