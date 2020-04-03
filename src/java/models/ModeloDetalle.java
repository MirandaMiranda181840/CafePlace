/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import classes.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import objetoNegocio.Detalle;

/**
 *
 * @author cafeplace
 */
public class ModeloDetalle extends Conexion{
     
    public ArrayList<Detalle> getAllDetalles(){
        ArrayList<Detalle> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call selectDetalles()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                productos.add(new Detalle(rs.getInt("folio"), rs.getInt("idProducto"), rs.getInt("cant"), rs.getInt("idCliente")));
                
            }
        } catch (Exception e) {
            
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(getConnection() != null) getConnection().close();
            } catch (Exception e) {
            }
        }       
        return productos;        
    }
    
    public Detalle getDetalle(int idCliente){
        Detalle producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "call selectDetalle(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idCliente);
            rs = pst.executeQuery();
            while(rs.next()){
                producto = new Detalle(rs.getInt("folio"), rs.getInt("idProducto"), rs.getInt("cant"), rs.getInt("idCliente"));
                
            }
        } catch (Exception e) {
            
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(getConnection() != null) getConnection().close();
            } catch (Exception e) {
            }
        }       
        return producto;
        
    }    
    
   
}
