<%-- 
    Document   : index
    Created on : 6/12/2019, 08:29:17 PM
    Author     : miran
--%>
<%@page import="objetoNegocio.Usuario"%>
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

         <!--Carrusel -->
        <div class="bd-example">
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  
                    <div class="carousel-item">
                        <img src="img/portada3.jpg" class="d-block w-100" alt="..." height="700">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Prueba nuestras exquisito menú</h1>
                            <p>Bebidas de toda clase y bocadillos </p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="img/products-01.jpg" class="d-block w-100" alt="..." height="700" >
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Toda clase de cafés a tu disposición</h1>
                            <p>Prueba nuestra amplia diversidad de bebidas </p>
                        </div>
                    </div>
                    <div class="carousel-item active">
                        <img src="img/carrusel3.jpg" class="d-block " alt="" height="700">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Diferentes tipos de postres a tu disposición</h1>
                            <p>Prueba todos nuestros postres</p>
                        </div>
                    </div>
                    
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div> 
        
        
        
        
  <section class="page-section clearfix">
    <div class="container">
      <div class="intro">
        <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="img/intro.jpg" alt="">
        <div class="intro-text left-0 text-center bg-faded p-5 rounded">
          <h2 class="section-heading mb-4">
            <span class="section-heading-upper">¿Quiénes Somos?</span>
            <span class="section-heading-lower"></span>
          </h2>
          <p class="mb-3">Somos un establecimiento donde servimos desayunos, almuerzos, café y algunas otras cosas divertidas
          </p>
          <div class="intro-button mx-auto">
            <a class="btn btn-primary btn-xl" href="sucursal.html">¡Visitanos hoy!</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="page-section cta">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <div class="cta-inner text-center rounded">
            <h2 class="section-heading mb-4">
              <span class="section-heading-upper">Nuestra promesa</span>
              <span class="section-heading-lower">para ti</span>
            </h2>
            <p class="mb-0">Donde nuestra principal temática es la "Terraza", un lugar donde los clientes pueden disfrutar de un rico café acompañado de alguna comida al aire libre 
                en nuestros cómodos sillones. </p>
          </div>
        </div>
      </div>
    </div>
  </section>
         
         <% 
              
             //HttpSession sesion2=request.getSession();
             //Usuario usuario2 = sesion2.getAttribute("usuario");
             //out.write(sesion2.getAttribute("idCliente").toString());
         
         %>