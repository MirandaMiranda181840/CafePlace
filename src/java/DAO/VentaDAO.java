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
import java.util.ArrayList;
import java.util.List;
import objetoNegocio.Comentario;
import objetoNegocio.Usuario;
import objetoNegocio.Venta;

/**
 *
 * @author miran
 */
public class VentaDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
    private List<Usuario> listaUsuarios;

    public VentaDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
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
    
    public boolean insertVenta(Venta venta) throws SQLException {
        String sql = "INSERT INTO ventas (idCliente, idProducto, cantidad, precioTotal, direccionEntrega) VALUES (?, ?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        
        //statement.setInt(1, venta.getIdVenta());
        statement.setInt(1, venta.getIdCliente());
        statement.setInt(2, venta.getIdProducto());
        statement.setInt(3, venta.getCantidad());
        statement.setFloat(4, venta.getPrecioTotal());
        statement.setString(5, venta.getDireccion());
        
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
     public Venta getVenta(int id) throws SQLException {
        Venta venta = null;
        String sql = "SELECT * FROM ventas WHERE idVenta = ?";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {            
            int idCliente = resultSet.getInt("idCliente");
            int idProducto = resultSet.getInt("idProducto");
            int cantidad = resultSet.getInt("cantidad");
            float precioTotal = resultSet.getFloat("precioTotal");
            String direccion = resultSet.getString("direccionEntrega");
            
            venta = new Venta(id, idCliente, idProducto, cantidad, precioTotal,direccion);
        }
         
        resultSet.close();
        statement.close();
         
        return venta;
    }

}
