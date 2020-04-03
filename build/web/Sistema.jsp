<%-- 
    Document   : Sistema
    Created on : 26-nov-2019, 9:33:23
    Author     : Citti
--%>
<%@page import="classes.Producto"%>
<%@page import="DAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Sistema de administración</title>

        <section class="page-section about-heading">
            <div class="container">
                <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="img/about.jpg" alt="">
                <div class="about-heading-content">
                    <div class="row">
                        <div class="col-xl-9 col-lg-10 mx-auto">
                            <div class="bg-faded rounded p-5">
                                <h2 class="section-heading mb-4">
                                    <span class="section-heading-upper">Agrega nuevos productos</span>
                                    <span class="section-heading-lower">REGISTRO PRODUCTOS</span>
                                </h2>
                                 <form action="Sistema.jsp" method="POST" >
                                    <div class="form-group col-md-5">
                                        <label for="idProd"><i class="fas fa-user"></i> idProducto</label>
                                        <input type="text" class="form-control" id="idProd" placeholder="id" name="txtid">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="nombreProd"><i class="fas fa-signature"></i> Nombre del producto</label>
                                        <input type="text" class="form-control" id="nombreProd" placeholder="Nombre del producto" name="txtnombre">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="descrip"><i class="fas fa-info-circle"></i> Descripción</label>
                                        <input type="text" class="form-control" id="descrip" placeholder="Descripcion del producto" name="txtdescripcion">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="preci"><i class="fas fa-dollar-sign"></i> Precio</label>
                                        <input type="text" class="form-control" id="preci" placeholder="Precio unitario del producto" name="txtprecio">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="sto"><i class="fas fa-coffee"></i> Stock</label>
                                        <input type="number" class="form-control" id="sto" placeholder="Cantidad de productos" name="txtstock">
                                    </div>
                                     <div class="form-group col-md-5">
                                        <label for="img"><i class="fas fa-images"></i> Imagen</label>
                                        <input type="file" class="form-control" id="img" placeholder="Solo archivos jpg, png" name="txtimagen" min="18">
                                    </div>
                                    <button type="submit" name="btnRegistrar" class="btn btn-danger btn-lg">Registrar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>
        
        
        <%
             if (request.getParameter("btnRegistrar") != null) {
                 ProductoDAO productoDao = new ProductoDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
             int id = Integer.parseInt(request.getParameter("txtid"));
            String nombre = request.getParameter("txtnombre");
            String descripcion = request.getParameter("txtdescripcion");
            float precio = Float.parseFloat(request.getParameter("txtprecio"));
            int stock = Integer.parseInt(request.getParameter("txtstock"));
            String imagen = request.getParameter("txtimagen");
            Producto producto = new Producto(id, nombre, descripcion, precio, stock, imagen);
            productoDao.insertProducto(producto);
            out.println("Data is successfully inserted!");
            id += 1;
            }
            
        %>
