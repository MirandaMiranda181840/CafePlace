<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
            HttpSession sesion1=request.getSession();
            String usuario1;
            String nivel1;
            if (sesion1.getAttribute("user")!=null && sesion1.getAttribute("nivel")!=null) {
                usuario1=sesion1.getAttribute("user").toString();
                nivel1=sesion1.getAttribute("nivel").toString();
            } else {
                out.print("<script>location.replace('login.jsp');</script>");
            }
        %>
        <section class="page-section cta">
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <div class="cta-inner text-center rounded">
              <h2 class="section-heading mb-5">
                <span class="section-heading-upper">Ven con nosotros</span>
                <span class="section-heading-lower">Eres bienvenido</span>
              </h2>
              
              <div class="container">
            <div class="row">
                <div class="col-lg-12" >
                    <br><h3>Calle:</h3>
                    <p>Allende 423-B entre Puebla y Veracruz.</p>
                </div>
                
                <div class="col-lg-12" >
                    <h3>Código Postal:</h3>
                    <p>85000.</p>
                </div>
                
                <div class="col-lg-12" >
                    <h3>Localidad:</h3>
                    <p>Ciudad Obregón, Sonora, México.</p>
                </div>
                
                <div class="col-lg-12" >
                    <h3>Ubicación:</h3>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3539.0748969067886!2d-109.93843538494244!3d27.49804608287898!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c815ed0b4fe905%3A0xbbbbe846fe0d5608!2sCafe%20Place!5e0!3m2!1ses!2smx!4v1571965087538!5m2!1ses!2smx" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
            </div>
          </div>
        </div>
      </div>
    </section>