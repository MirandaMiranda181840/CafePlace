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
import classes.Producto;
import objetoNegocio.Usuario;

/**
 *
 * @author miran
 */
public class ProductoDAO {
    
     private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
     
    public ProductoDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
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
    
    public boolean insertProducto(Producto producto) throws SQLException {
        String sql = "INSERT INTO productos (nombreProducto, descripcion, precio, stock, imagen) VALUES (?, ?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        //statement.setInt(1, producto.getIdProducto());
        statement.setString(1, producto.getNombreProducto());
        statement.setString(2, producto.getDescripcion());
        statement.setFloat(3, producto.getPrecio());
        statement.setInt(4, producto.getStock());
        statement.setString(5, producto.getImagen());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    public Producto getProducto(int id) throws SQLException {
        Producto producto = null;
        String sql = "SELECT * FROM productos WHERE idProducto = ?";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {            
            String nombreProducto = resultSet.getString("nombreProducto");
            String descripcion = resultSet.getString("descripcion");
            Float precio = resultSet.getFloat("precio");
            int stock = resultSet.getInt("stock");
            String imagen = resultSet.getString("imagen");
             
            producto = new Producto(id, nombreProducto, descripcion, precio, stock, imagen);
        }
         
        resultSet.close();
        statement.close();
         
        return producto;
    }
    
     public List<Producto> listAllProducts() throws SQLException {
        List<Producto> listProducto = new ArrayList<>();
         
        String sql = "SELECT * FROM productos";
         
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int id = resultSet.getInt("idProducto");
            String nombre = resultSet.getString("nombreProducto");
            String descripcion = resultSet.getString("descripcion");
            float precio = resultSet.getFloat("precio");
            int stock = resultSet.getInt("stock");
            String imagen = resultSet.getString("imagen");
             
            Producto producto = new Producto(id, nombre, descripcion, precio, stock, imagen);
            listProducto.add(producto);
        }
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listProducto;
    }
    
}
