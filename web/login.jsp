<%-- 
    Document   : login
    Created on : 26-nov-2019, 9:35:20
    Author     : Citti
--%>

<%@page import="DAO.Operaciones"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="objetoNegocio.Usuario"%>
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
                            <span class="section-heading-upper">Iniciar Sesión</span>
                        </h2>
                        
                            <form action="login.jsp" method="POST">
                                <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-coffee"></i> Usuario</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Usuario con el que te registraste" name="txtUsuario">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fas fa-lock"></i> Contraseña</label>
                                        <input type="password" class="form-control" id="inputAddress" placeholder="Contraseña" name="txtContrasena">
                                    </div>
                                <input type="submit" name="btnIngresar" value="Iniciar Sesión" class="btn btn-danger btn-lg">
                            </form>
                        <br><br>
                        
                        <h2 class="section-heading mb-4"><span class="section-heading-upper">¿No tienes cuenta?  
                                <a href="registrarUsuario.jsp">   
                                    <i class="fas fa-arrow-right"></i> 
                                    Registrate aquí
                                    <i class="fas fa-arrow-left"></i>
                                </a>
                            </span>
                        </h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%
    Operaciones op = new Operaciones();
    UsuarioDAO usuarioDao = new UsuarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
    if (request.getParameter("btnIngresar") != null) {
        String nombre = request.getParameter("txtUsuario");
        String contra = request.getParameter("txtContrasena");
        HttpSession sesion = request.getSession();
        Usuario usuario = usuarioDao.getUser(nombre, contra);
        switch (op.loguear(nombre, contra)) {
            case 1:
                sesion.setAttribute("user", nombre);
                sesion.setAttribute("nivel", "1");
                sesion.setAttribute("idCliente", usuario.getId());
                response.sendRedirect("indexAdmin.jsp");
                break;

            case 2:
                sesion.setAttribute("user", nombre);
                sesion.setAttribute("nivel", "2");
                sesion.setAttribute("usuario", usuario);
                response.sendRedirect("index.jsp");
                break;
            default:
                out.write("Usuario o contraseña no valida");
                break;
        }
    }
%>
</body>
</html>
