/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import objetoNegocio.Comentario;
import objetoNegocio.Usuario;
/**
 *
 * @author miran
 */
public class ComentarioDAO {
    
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public ComentarioDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
         this.jdbcURL = "jdbc:mysql://localhost:3306/cafeplace";
        this.jdbcUsername = "root";
        this.jdbcPassword = "";
    }
    
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
                
            }
            jdbcConnection = DriverManager.getConnection(
                                        jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
     
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
    
    public boolean insertComentario(Comentario comentario) throws SQLException {
        String sql = "INSERT INTO comentarios (nombre, correo, telefono, comentario) VALUES (?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, comentario.getNombre());
        statement.setString(2, comentario.getCorreo());
        statement.setString(3, comentario.getTelefono());
        statement.setString(4, comentario.getComentario());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
     
    public List<Comentario> listAllUsers() throws SQLException {
        List<Comentario> listComment = new ArrayList<>();
         
        String sql = "SELECT * FROM comentarios";
         
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            String email = resultSet.getString("correo");
            String telefono = resultSet.getString("telefono");
            String comentario = resultSet.getString("comentario");
             
            Comentario comentarioo = new Comentario(nombre, email, telefono, comentario);
            listComment.add(comentarioo);
        }
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listComment;
    }
//        
//    public boolean updateBook(Usuario book) throws SQLException {
//        String sql = "UPDATE book SET title = ?, author = ?, price = ?";
//        sql += " WHERE book_id = ?";
//        connect();
//         
//        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//        statement.setString(1, book.getTitle());
//        statement.setString(2, book.getAuthor());
//        statement.setFloat(3, book.getPrice());
//        statement.setInt(4, book.getId());
//         
//        boolean rowUpdated = statement.executeUpdate() > 0;
//        statement.close();
//        disconnect();
//        return rowUpdated;     
//    }
     
//    public Usuario getUser(int id) throws SQLException {
//        Usuario usuario = null;
//        String sql = "SELECT * FROM usuarios WHERE idCliente = ?";
//         
//        connect();
//         
//        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//        statement.setInt(1, id);
//         
//        ResultSet resultSet = statement.executeQuery();
//         
//        if (resultSet.next()) {            
//            String nombre = resultSet.getString("nombre");
//            String direccion = resultSet.getString("direccion");
//            String email = resultSet.getString("correo");
//            String usuarioCliente = resultSet.getString("usuario");
//            String contrasena = resultSet.getString("contrasena");
//            int edad = resultSet.getInt("edad");
//            int nivel = resultSet.getInt("nivel");
//             
//            usuario = new Usuario(id, nombre, direccion, email, usuarioCliente, contrasena, edad, nivel);
//        }
//         
//        resultSet.close();
//        statement.close();
//         
//        return usuario;
//    }
    
    
}
