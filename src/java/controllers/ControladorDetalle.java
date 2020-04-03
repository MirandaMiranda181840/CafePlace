/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import classes.Producto;
import models.ModeloProducto;

/**
 *
 * @author Cafeplace
 */
public class ControladorDetalle {
//    public String getProductos(){
//        ModeloProducto mp = new ModeloProducto();
//        String htmlcode = "";
//        for(Producto producto : mp.getAllProductos()) {
//            htmlcode += "<div class=\"card card-body\">\n"+
//                    "<span class=\"float-right font-weight-bold\">$"+producto.getPrecio()+"</span>"+
//                    "<h6 class=\"text-truncate\" name=\"producto\">" + producto.getNombreProducto()+"</h6><br>"+
//                    "<img src=\"img/menu/"+producto.getImagen()+"\" class=\"card-img-top\" height=\"300\" width=\"250\"/>" +
//                    "<div class=\"card-body\">" + 
//                    "<a href=\"product-details.jsp?id="+producto.getIdProducto()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\" style=\"color:darkorange;\"></i> Ver Detalles</a>\n"+
//                    "</a>"+
//                    "</div>"+
//                    "</div>";
//            
//        }
//        return htmlcode;        
//    }
//    
    
    public Producto getDetalle(int idCliente){
        return new ModeloProducto().getProducto(idCliente);
    }
}