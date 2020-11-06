<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Live Cricket</title>
 <link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
  <!--bootstrap link -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
  <header>

    <nav class="navbar navbar-expand-lg navbar-light bg-danger fixed-top">
      <a class="navbar-brand">
        <img src="">
      </a>
      <a class="nav-link text-light">
        <h3> 	&#127951;  Cricket ScoreBoard</h3>
      </a>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active " >
         <b>   <a class="nav-link text-light" href="login"> <i class="fa fa-sign-in" aria-hidden="true"></i> Admin Login </a></b>
          </li>
        </ul>
      </div>
    </nav>
    </div>
    </div>

  </header>
 <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src='<c:url value="/Resources/images/1.jpg" />' class="d-block w-100 height:50%">
        <div class="carousel-caption d-none d-md-block">

        </div>
      </div>
      <div class="carousel-item">
        <img src='<c:url value="/Resources/images/2.jpg" />' class="d-block w-100">
        <div class="carousel-caption d-none d-md-block">

        </div>
      </div>
      <div class="carousel-item">
        <img src='<c:url value="/Resources/images/3.jpg" />' class="d-block w-100">
        <div class="carousel-caption d-none d-md-block">

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

  <footer class="full-footer bg-light sticky-bottom">


    <div class="container-fluid bottom-footer pt-2 bg-danger">
      <div class="row">
        <div class="col-12 text-center text-light font-weight-bold ">
          <p>Copyrights © 2020 - All rights reserved</p>
        </div>
      </div>
    </div>
    </div>
  </footer>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>