<%@page import="controllers.ControladorProducto"%>
<%@page import="classes.Producto"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Producto producto = new ControladorProducto().getProducto(id);
%>


<section class="page-section about-heading">
    <div class="container">
        <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="img/about.jpg" alt="">
        <div class="about-heading-content">
            <div class="row">
                    <div class="bg-faded rounded p-5">

                        <section>
                            <div class="container">
                                <div class="row">
                                        <div class="product-details"><!--product-details-->
                                            
                                            <div class="form-row col-md-11">
                                                
                                                <div class="form-group col-md-6">
                                                    <div class="view-product">
                                                        <br><br> <img src="img/menu/<%= producto.getImagen()%>" alt="" width="300" />
                                                    </div>
                                                </div>
                                                    
                                                <div class="form-group col-md-5">
                                                    <div class="product-information"><!--/product-information-->
                                                    <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                                    <h2><%= producto.getNombreProducto()%></h2>
                                                    <p>Web ID: <%= producto.getIdProducto()%></p>
                                                    <p><b>Disponibilidad:</b> In Stock</p><br>
                                                    <p><b>¿Qúé es?</b><%= producto.getDescripcion()%></p>
                                                    <img src="images/product-details/rating.png" alt="" />
                                                    <form action="agregarproducto" method="post">
                                                        <span>
                                                            <span><b>MXN $<%= producto.getPrecio()%></b></span><br>
                                                            <label>Quantity:</label>
                                                            <input type="hidden" value="<%= producto.getIdProducto()%>" name="idproducto">
                                                            <input type="number" value="1" id="txt-cantidad" name="cantidad" size="5" min="1"/>
                                                            <button type="submit" class="btn btn-fefault cart">
                                                                <i class="fa fa-shopping-cart"></i>
                                                                Añadir al carrito
                                                            </button>
                                                        </span>
                                                    </form>

                                                </div>
                                                </div>
                                                
                                            </div>


                                        </div>
                                </div>
                            </div>
                        </section>


                    </div>
            </div>
        </div>
    </div>
</section>