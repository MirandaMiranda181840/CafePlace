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

/**
 *
 * @author Citti
 */
public class Operaciones {
    private String jdbcURL="jdbc:mysql://localhost:3306/cafeplace";
    private String jdbcUsername="root";
    private String jdbcPassword="";
    
    public Operaciones(){
        
    }
    
    public int loguear(String usu,String pass){
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int cont=0;
        int nivel=0;
        String sql="select nivel from usuarios where usuario='"+usu+"' and contrasena='"+pass+"'";
        try{
             Class.forName("com.mysql.jdbc.Driver");
             conn=DriverManager.getConnection(this.jdbcURL,this.jdbcUsername,this.jdbcPassword);
             pst=conn.prepareStatement(sql);
             rs=pst.executeQuery();
             while(rs.next()){
                 nivel=rs.getInt(1);
             }
             conn.close();
             System.out.print("Nivel es: "+nivel);
        }catch(ClassNotFoundException | SQLException e){
            
        }return nivel;
    }
}
