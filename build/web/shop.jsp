<%@page import="controllers.ControladorProducto"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
            HttpSession sesion=request.getSession();
            String usuario;
            String nivel;
            if (sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null) {
                usuario=sesion.getAttribute("user").toString();
                nivel=sesion.getAttribute("nivel").toString();
            } else {
                out.print("<script>location.replace('login.jsp');</script>");
            }
        %>
<%
    ControladorProducto cp = new ControladorProducto();
%>

                                                
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="card-columns">
                
                <%= cp.getProductos()%>
                
                <div class="card card-body">
                    <span class="float-right font-weight-bold">$10 EXTRA</span>
                    <h6>Leche deslactosada o <br> de almendra.</h6>
                </div>

                <div class="card card-body">
                    <span class="float-right font-weight-bold">$8 EXTRA</span>
                    <h6 class="text-truncate">Escencia de rompope,<br>caramelo, crema irlandesa,<br>amareto, almendra, chocolate,<br>vainilla o cajeta.</h6>
                </div>
                
                
                
                
            </div>
        </div>
    </div>
</section>