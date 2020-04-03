<%-- 
    Document   : cerrarSesion
    Created on : 9/12/2019, 02:09:52 PM
    Author     : miran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    HttpSession sesion=request.getSession();
            String usuario;
            String nivel;
            if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                usuario=sesion.getAttribute("user").toString();
                nivel=sesion.getAttribute("nivel").toString();
                out.print("<a href='login.jsp?cerrar=true'><h5>Cerrar Sesión "+usuario+"</h5></a>");
                response.sendRedirect("login.jsp");
            }else{
                out.print("<script>location.replace('login.jsp');</script>");
            }
            
%>