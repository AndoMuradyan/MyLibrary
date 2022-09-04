package manager;

import db.DBConnectionProvider;
import model.Author;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorManager {
    private Connection connection = DBConnectionProvider.getINSTANCE().getConnection();
//    private  AuthorManager = new AuthorManager();

    public void add(Author author) {
        String sql = "insert into author(name,surname,email,age) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, author.getName());
            ps.setString(2, author.getSurname());
            ps.setString(3, author.getEmail());
            ps.setInt(4, author.getAge());

            ps.executeUpdate();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                author.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Author> getAll() {
        String sql = "select * from author";
        List<Author> authors = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                authors.add(getAuthorFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authors;
    }

    public Author getById(int id) {
        String sql = "select * from author where id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getAuthorFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //TODO
    // 1- jnjel booky delete * from book where id=id
    // 2- jnjel authory delete * from author where id=id        bayc
    // 3- poxel girqy  1-bdi getById enes girqy kam authory stugum dnenk ,
    // ete tvyal idov mard chka bazayi mej tox qce kam bookNotFoundException authorNotFoundException
    //
    public void deleteAuthorById(int id) {
        String sql = "delete from author where id =" + id;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Author getAuthorFromResultSet(ResultSet resultSet) throws SQLException {
        Author author = new Author();
        author.setId(resultSet.getInt("id"));
        author.setName(resultSet.getString("name"));
        author.setSurname(resultSet.getString("surname"));
        author.setEmail(resultSet.getString("email"));
        author.setAge(resultSet.getInt("age"));
//        int eventId = resultSet.getInt("event_id");
//        Event event = eventManager.getById(eventId);
//        author.setEvent(event);

        return author;
    }
}
