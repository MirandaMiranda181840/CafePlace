<%-- 
    Document   : registrarAdministrador
    Created on : 9/12/2019, 01:03:18 AM
    Author     : miran
--%>

<%@page import="objetoNegocio.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="page-section about-heading">
            <div class="container">
                <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="img/about.jpg" alt="">
                <div class="about-heading-content">
                    <div class="row">
                        <div class="col-xl-9 col-lg-10 mx-auto">
                            <div class="bg-faded rounded p-5">
                                <h2 class="section-heading mb-4">
                                    <span class="section-heading-upper">Registrar Administrador</span>
                                </h2>
                                 <form action="registrarUsuario.jsp" method="POST" >
                                    <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-user"></i> Nombre</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Nombre completo" name="txtnombre">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-directions"></i> Dirección</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Dirección a la que quieres tus pedidos" name="txtdireccion">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-envelope"></i> Email</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="email@ejemplo.com" name="txtemail" pattern="[a-zA-Z0-9_]+@+[a-zA-Z0-9_]+\W+[a-zA-Z0-9_]{3}">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-coffee"></i> Usuario</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Usuario que usarás al iniciar sesión" name="txtusuario">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-lock"></i> Contraseña</label>
                                        <input type="password" class="form-control" id="inputAddress" placeholder="Contraseña" name="txtcontrasena">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-address-card"></i> Edad</label>
                                        <input type="number" class="form-control" id="inputAddress" placeholder="+18" name="txtedad" min="18">
                                    </div>
                                     <div class="form-group col-md-5">
                                         <label><i class="fas fa-address-card"></i> Nivel</label>
                                        <input type="text" name="txtnivel" value="1" min="1" max="1">
                                    </div>
                                    <button type="submit" name="btnRegistrar" class="btn btn-danger btn-lg">Registrarse</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>
<%
     if (request.getParameter("btnRegistrar") != null) {
         UsuarioDAO usuarioDao = new UsuarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
    int id = 6;
    String nombre = request.getParameter("txtnombre");
    String direccion = request.getParameter("txtdireccion");
    String email = request.getParameter("txtemail");
    String usuario = request.getParameter("txtusuario");
    String contrasena = request.getParameter("txtcontrasena");
    int edad = Integer.parseInt(request.getParameter("txtedad"));
    int nivel = Integer.parseInt(request.getParameter("txtnivel"));
    usuarioDao.insertUsuario(new Usuario(id, nombre, direccion, email, usuario, contrasena, edad, 1));
     }
%>
