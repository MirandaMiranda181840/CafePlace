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
import objetoNegocio.Detalle;
import objetoNegocio.Usuario;

/**
 *
 * @author miran
 */
public class DetalleDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
    
    public DetalleDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
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
    
    public boolean insertDetalle(Detalle detalle) throws SQLException {
        String sql = "INSERT INTO detalle (folio, idProducto, cant) VALUES (?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, detalle.getFolio());
        statement.setInt(2, detalle.getIdProducto());
        statement.setInt(3, detalle.getCant());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    public List<Detalle> listAllDetalle() throws SQLException {
        List<Detalle> listDetalle = new ArrayList<>();
         
        String sql = "SELECT * FROM detalle";
         
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int folio = resultSet.getInt("folio");
            int idProducto = resultSet.getInt("idProducto");
            int cant = resultSet.getInt("cant");
            int idCliente = resultSet.getInt("idCliente");
             
            Detalle detalle = new Detalle(folio, idProducto, cant, idCliente);
            listDetalle.add(detalle);
        }
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listDetalle;
    }
    
    public boolean deleteDetalle(int folio) throws SQLException {
        String sql = "DELETE FROM detalle WHERE folio = ?";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, folio);
         
        boolean rowRemoved = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowRemoved;
    }
    
    
}
