<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>        
        <title>Carrito de Compras</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>FerreW </i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=Nuevo"><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-plus-circle"></i> Ofertas del Dia</a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=carrito"><i class="fas fa-cart-plus">(<label style="color: darkorange">${cont}</label>)</i> Carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=NuevoProducto">Productos</a>
                    </li> 
                </ul>
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <!--<form class="form-inline my-2 my-lg-0">-->
                    <input style="width:400px" class="form-control mr-sm-2" id="txtBuscar">
                    <button class="btn btn-outline-info my-2 my-sm-0" id="btnBuscar"><i class="fas fa-search"></i> Buscar</button>
                    <!-- </form>       -->                 
                </ul>                                
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${user}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>

         <!-- Slider -->
        <div class="container-fluid p-5 bg-dark text-white text-center">
  <h1>Ferreterias W</h1>
  <p>Lo mejor en herramientas para la construccion y el hogar!</p>
</div>

<div class="container mt-5">
  <div class="row">
    <div class="col-sm-4">
      <h3>Importancia</h3>
      <p> sabemos que lo más importante es tu tienda, por eso desarrollamos</p>
      <p>herramientas comerciales para ayudarte a gestionar tu negocio de una manera rentable</p>
    </div>
    <div class="col-sm-4">
      <h3>Garantia </h3>
      <p>Herramientas, para las mejores personas, Compra, todo lo que quieras</p>
      <p>La calidad esta disponible Haz tu vida más fácil</p>
    </div>
    <div class="col-sm-4">
      <h3>Eficacia</h3>
      <p>Mejor calidad a precio económico, Primera esencia para tu hogar (KRB)Hazlo mejor (Ferreterías)</p>
      <p>Te ayudamos en todos los asuntos Más opciones, más para amar (Ferreterías W)</p>
    </div>
  </div>
</div>
         <!-- end -->
        <div class="container mt-4">
            <div class="row">
                <c:forEach var="p" items="${productos}">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <label class="col-sm-12">${p.getNombres()}</label>                                    
                                </div>
                                <div class="card-body text-center d-flex">
                                    <label><i class="fas fa-dollar-sign">${p.getPrecio()}</i></label>
                                    <img src="${p.getFoto()}" width="200" height="170">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>${p.getDescripcion()}</label>                                   
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Cristian Perdomo">
                                        </div>
                                        <div class="form-group">
                                            <label>Cedula</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="3125620825">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Neiva Huila">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <!-- traducir-->
<div id="google_translate_element" class="google btn btn-danger"></div>

<script type="text/javascript">
function googleTranslateElementInit() {
	new google.translate.TranslateElement({pageLanguage: 'es', includedLanguages: 'es,ca,eu,gl,en,fr,it,pt,de', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, gaTrack: true}, 'google_translate_element');
        }
</script>
<script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <!-- Footer-->
        <footer class="bg-light text-center text-white">
  <!-- Grid container -->
  <div class="container p-4 pb-0">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #3b5998;"
        href="#!"
        role="button"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #55acee;"
        href="#!"
        role="button"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #dd4b39;"
        href="#!"
        role="button"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #ac2bac;"
        href="#!"
        role="button"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #0082ca;"
        href="#!"
        role="button"
        ><i class="fab fa-linkedin-in"></i
      ></a>
      <!-- Github -->
      <a
        class="btn btn-primary btn-floating m-1"
        style="background-color: #333333;"
        href="#!"
        role="button"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">DVcriXus.com</a>
  </div>
  <!-- Copyright -->
</footer>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/index.js" type="text/javascript"></script>
    </body>
</html>
