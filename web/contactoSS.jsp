<%@page import="objetoNegocio.Comentario"%>
<%@page import="DAO.ComentarioDAO"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
        <section class="page-section about-heading">
            <div class="container">
                <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="img/about.jpg" alt=""/>
                <div class="about-heading-content">
                    <div class="row">
                        <div class="col-xl-9 col-lg-10 mx-auto">
                            <div class="bg-faded rounded p-5">
                                <h2 class="section-heading mb-4">
                                    <span class="section-heading-upper">Nos interesa tu opinión</span>
                                    <span class="section-heading-lower">Contactános</span>
                                </h2>
                                <form action="contacto.jsp" method="POST">
                                    <div class="form-row col-md-10">
                                        <div class="form-group col-md-5">
                                            <label for="inputEmail4"><i class="fa fa-user "></i> Nombre(s)</label>
                                            <input type="text" class="form-control" id="inputEmail4" placeholder="Nombre" name="txtnombre">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="inputAddress"><i class="fa fa-envelope"></i> Correo</label>
                                        <input type="email" class="form-control" id="inputAddress" placeholder="ejemplo@ejemplo.ejemplo" name="txtcorreo" pattern="[a-zA-Z0-9_]+@+[a-zA-Z0-9_]+\W+[a-zA-Z0-9_]{3}">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="inputAddress2"><i class="fa fa-phone"></i> Teléfono</label>
                                        <input type="text" class="form-control" id="inputAddress2" placeholder="6441784596" name="txtnumero">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="comentario"><i class="fa fa-comments"></i> Comentarios y/o Sugerencias</label>
                                        <textarea class="form-control" id="message" name="txtcomentario" placeholder="Comenta aquí cualquier sugerencia que tengas." rows="7" ></textarea>
                                    </div>
                                    <button type="submit" name="btnEnviar" class="btn btn-danger btn-lg">Enviar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<%
    ComentarioDAO comentarioDao = new ComentarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
    if (request.getParameter("btnEnviar") != null) {
        String nombre = request.getParameter("txtnombre");
        String correo = request.getParameter("txtcorreo");
        String telefono = request.getParameter("txtnumero");
        String comentario = request.getParameter("txtcomentario");
        
        ComentarioDAO ComentarioDao = new ComentarioDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
        ComentarioDao.insertComentario(new Comentario(nombre, correo, telefono, comentario));
        out.println("Data is successfully inserted!");
    }
%>