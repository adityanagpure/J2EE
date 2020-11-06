<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>    
</head>

<body oncontextmenu="return false">
 <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
      <a class="navbar-brand">
        <img src="">
      </a>
      <a class="nav-link text-light">
        <h3>&#127951; Cricket ScoreBoard</h3>
      </a>
  </header>

  <div class="container-fluid d-flex p-4 bg-dark " id="bg">
    <div class="container col-8 col-md-4 rounded bg-light"
      style="  border: 1px solid #999; box-shadow: 1px 2px 5px 0 #000000; ">
      <div class="row">
        <div class="col-12  p-3 ">
          <div>
            <div>
              <h2>Login Here..!!</h2>
             <div style="color:red; font-weight: bold;" class="text-center" > <%= (request.getAttribute("msg")!=null)?request.getAttribute("msg"):"" %> </div> 
            </div>
            <spr:form action="loginProcess" method="post" commandName="admin">
              <div class="form-group">
                <label for="user" class="font-weight-bold mt-2"> Username : </label>
                <spr:input path="userName" cssClass="form-control"  />
                <span id="username" class="text-danger font-weight-bold"> </span>
              </div>
              <div class="form-group">
                <label class="font-weight-bold"> Password: </label>
                <spr:password path="userPass"  cssClass="form-control"  />
                <span id="passwords" class="text-danger font-weight-bold"> </span>
                <div style="font-size: 12px;"><span
                    style="color: rgb(108, 108, 240);cursor: pointer;font-weight: bold"></span></div>
              </div>
             <a href="forgotPassword"> <label class="font-weight-bold">Forgot Password ? </label> </a>
              <input type="submit" class="btn btn-info col-12" value="Login">
            </spr:form>
            <div class="col-12">
              <hr>
            </div>
            <button type="button" class="btn btn-danger col-12 mt-2" style="margin-bottom: 10px;">
              <a class="nav-link text-light" href="Home.jsp">Back to Home </a></button>
          </div>

        </div>

      </div>

    </div>



  </div>

  <footer class="full-footer bg-light fixed-bottom">
    <div class="container-fluid bottom-footer pt-2 bg-danger">
      <div class="row">
        <div class="col-12 text-center text-light font-weight-bold ">
          <p>Copyrights © 2020 - All rights reserved</p>
        </div>
      </div>
    </div>
    </div>
  </footer>



</body>
</html>