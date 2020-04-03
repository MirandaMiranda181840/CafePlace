<%@page import="controllers.ControladorDetalle"%>
<%@page import="classes.Producto"%>
<%@page import="DAO.DetalleDAO"%>
<%@page import="DAO.VentaDAO"%>
<%@page import="objetoNegocio.Detalle"%>
<%@page import="objetoNegocio.Venta"%>
<%@page import="controllers.ControladorProducto"%>
<%@page import="classes.Articulo"%>
<%@page import="java.util.ArrayList"%>
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

<%
     HttpSession sesion = request.getSession(true);
     ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>

<br><div class="card shopping-cart">
    <div class="card-header text-dark  text-center">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        Carrito de compras
    </div>
    <div class="card-body">                   

        <%
                                                            ControladorProducto cp = new ControladorProducto();
                                                            ControladorDetalle cd = new ControladorDetalle();
                                                            double total = 0;
                                                            if(articulos != null){
                                                            for(Articulo a: articulos){
                                                       
                                                                Producto producto = cp.getProducto(a.getIdProducto());
                                                                total += a.getCantidad() * producto.getPrecio();
                                                        
                                                                                                            
        %>

        <!-- PRODUCT -->
        <div class="row">
            <div class="col-12 col-sm-12 col-md-2 text-center">
                <img class="img-responsive" src="img/menu/<%= producto.getImagen()%>" alt="prewiew" width="120" height="80">
            </div>
            <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                <h4 class="product-name"><strong><%= producto.getNombreProducto()%></strong></h4>
                <h4>
                    <small><%= producto.getDescripcion()%></small>
                </h4> 
            </div>
            <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                    <h6><strong>$<%= producto.getPrecio()%> <span class="text-muted">x</span></strong></h6>
                </div>
                <div class="col-4 col-sm-4 col-md-4">
                    <div class="quantity">
                        <input type="number" step="1" max="99" min="1" value="<%= a.getCantidad()%>" title="Qty" class="qty" size="4">
                    </div>
                </div>
                <div class="col-2 col-sm-2 col-md-2 text-right">
                    <button type="button" class="btn btn-outline-danger btn-xs" id="deleteitem">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </div>
        <hr>
        <!-- END PRODUCT -->

        <hr>
        <%}}%>


        <% if (articulos == null){%>
        <h4>No hay Articulos en el carro</h4>
        <%}%>

        <!-- END PRODUCT -->
        <div class="pull-left">
            <a href="shop.jsp" class="btn btn-outline-secondary pull-right">
                Seguir comprando
            </a>
        </div>
    </div>
    <div class="card-footer  text-right">
        <div class="pull-right" style="margin: 10px">
            <div class="pull-right" style="margin: 5px">
                Precio Total: <b>$<%= Math.round(total*100.0)/100.0%></b>
            </div>
            <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modalComprar" data-whatever="@mdo">Comprar</button>
        </div>
    </div>
</div><br>

<!-- MODAL CONFIRMAR COMPRA -->
<div class="modal fade" id="modalComprar" tabindex="-1" role="dialog" aria-labelledby="modalComprar" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalComprar">Confirmación de compra</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Productos:</label>
                        <%
                                                                ControladorProducto cp2 = new ControladorProducto();
                                                                ControladorDetalle cd2 = new ControladorDetalle();
                                                                double total2 = 0;
                                                                int folio = 3;
                                                                DetalleDAO detalleDao = new DetalleDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
                                                                if(articulos != null){
                                                                for(Articulo a: articulos){
                                                                    Producto producto2 = cp2.getProducto(a.getIdProducto());
                                                                    //Detalle detalle = new Detalle(folio, producto2.getIdProducto(), a.getCantidad(), 2);
                                                                    //total2 += a.getCantidad() * producto2.getPrecio();
                                                                    //detalleDao.insertDetalle(detalle);
                                                                    folio += 1;
                                                                                                            
                        %>

                        <h5>
                            <b><%= producto2.getNombreProducto()%></b> <br>
                            <%= producto2.getPrecio()%> x <%= a.getCantidad()%>
                        </h5>
                        <%}}%>


                    </div>
                    <div class="form-group">
                        TOTAL: <b>$<%= Math.round(total*100.0)/100.0%></b>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Dirección de envío:</label>
                        <textarea class="form-control" id="message-text" name="txtDireccion">Calles, número de casa, colonia.</textarea>
                        <%String direccionEntrega = request.getParameter("txtDireccion"); %>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Método de pago disponible:</label><br>
                        <i class="fas fa-money-bill-wave"></i>  En efectivo                        
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Volver al carrito</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalComprar2" name="btnComprar">Comprar</button>
            </div>
        </div>
    </div>
</div>
                    
                    
<!-- MODAL COMPRAR -->
<div class="modal fade" id="modalComprar2" tabindex="-1" role="dialog" aria-labelledby="modalComprar2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalComprar2">Confirmar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="cart.jsp" method="POST">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">¿Seguro de su compra?</label><br>
                        <input type="submit" name="btnComprar" value="Comprar" class="btn btn-primary">
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%
                                    if(request.getParameter("btnComprar") != null){
                                        String direccion = request.getParameter("txtDireccion");
                                     VentaDAO ventaDao = new VentaDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
                                        ControladorProducto cp3 = new ControladorProducto();
                                        ControladorDetalle cd3 = new ControladorDetalle();
                                        double total3 = 0;
                                        int folio3 = 3;
                                        DetalleDAO detalleDao3 = new DetalleDAO("jdbc:mysql://localhost:3306/cafeplace", "root", "");
                                        if(articulos != null){
                                            int idVenta = 5;
                                            for(Articulo a: articulos){
                                                Producto producto3 = cp3.getProducto(a.getIdProducto());
                                                                        //Detalle detalle = new Detalle(folio, producto2.getIdProducto(), a.getCantidad(), 2);
                                                                        //total2 += a.getCantidad() * producto2.getPrecio();
                                                                        //detalleDao.insertDetalle(detalle);
                                                  float precioCant = a.getCantidad() * producto3.getPrecio();
                                                  Venta venta = new Venta(idVenta, 2, producto3.getIdProducto(), a.getCantidad(), precioCant, "Calles, número de casa, colonia.");
                                                  ventaDao.insertVenta(venta);
                                                  folio += 1;
                                                  idVenta += 1;
                                             }
                                        }
                                        response.sendRedirect("index.jsp");
                                    }
                                        
                                       
                                                                                                            
                        %>