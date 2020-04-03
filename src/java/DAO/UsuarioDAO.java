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
import objetoNegocio.Usuario;
/**
 *
 * @author Miran
 */
public class UsuarioDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
     
    public UsuarioDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
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
     
    public boolean insertUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (nombre, direccion, correo, usuario, contrasena, edad, nivel) VALUES (?, ?, ?, ?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, usuario.getNombre());
        statement.setString(2, usuario.getDireccion());
        statement.setString(3, usuario.getEmail());
        statement.setString(4, usuario.getUsuario());
        statement.setString(5, usuario.getContrasena());
        statement.setInt(6, usuario.getEdad());
        statement.setInt(7, usuario.getNivel());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
     
    public List<Usuario> listAllUsers() throws SQLException {
        List<Usuario> listUser = new ArrayList<>();
         
        String sql = "SELECT * FROM usuarios";
         
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int id = resultSet.getInt("idCliente");
            String nombre = resultSet.getString("nombre");
            String direccion = resultSet.getString("direccion");
            String email = resultSet.getString("correo");
            String usuarioCliente = resultSet.getString("usuario");
            String contrasena = resultSet.getString("contrasena");
            int edad = resultSet.getInt("edad");
            int nivel = resultSet.getInt("nivel");
             
            Usuario usuario = new Usuario(id, nombre, direccion, email, usuarioCliente, contrasena, edad, nivel);
            listUser.add(usuario);
        }
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listUser;
    }
        
    public boolean updateUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE book SET nombre = ?, direccion = ?, correo = ?, usuario = ?, contrasena = ?, edad = ?, nivel =?";
        sql += " WHERE idCliente = ?";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, usuario.getNombre());
        statement.setString(2, usuario.getDireccion());
        statement.setString(3, usuario.getEmail());
        statement.setString(4, usuario.getUsuario());
        statement.setString(5, usuario.getContrasena());
        statement.setInt(6, usuario.getEdad());
        statement.setInt(7, usuario.getNivel());
         
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;     
    }
     
    public Usuario getUser(int id) throws SQLException {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE idCliente = ?";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {            
            String nombre = resultSet.getString("nombre");
            String direccion = resultSet.getString("direccion");
            String email = resultSet.getString("correo");
            String usuarioCliente = resultSet.getString("usuario");
            String contrasena = resultSet.getString("contrasena");
            int edad = resultSet.getInt("edad");
            int nivel = resultSet.getInt("nivel");
             
            usuario = new Usuario(id, nombre, direccion, email, usuarioCliente, contrasena, edad, nivel);
        }
         
        resultSet.close();
        statement.close();
         
        return usuario;
    }
    
    public Usuario getUser(String usuarioN, String contrasena) throws SQLException {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, usuarioN);
        statement.setString(2, contrasena);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {            
            int id = resultSet.getInt("idCliente");
            String nombre = resultSet.getString("nombre");
            String direccion = resultSet.getString("direccion");
            String email = resultSet.getString("correo");
            int edad = resultSet.getInt("edad");
            int nivel = resultSet.getInt("nivel");
             
            usuario = new Usuario(id, nombre, direccion, email, usuarioN, contrasena, edad, nivel);
        }
         
        resultSet.close();
        statement.close();
         
        return usuario;
    }
}
