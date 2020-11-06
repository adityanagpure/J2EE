<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Live Cricket</title>

  <!--bootstrap link -->

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
      <a class="navbar-brand">
        <img>
      </a>
      <a class="nav-link text-light">
        <h3>&#127951; Live Cricket Score</h3><span class="sr-only">(current)</span>
      </a>
	
            <a href="logout" class="nav-link text-light ">
                <b>
                    <h3 style="margin-left: 800px;">Log-Out</h3>
                </b>
            </a>
  </header>

  <nav class="navbar navbar-expand-lg navbar-light bg-warning">

    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-item nav-link active font-weight-bold" href="main.html">Add Match Info</a><span
          class="sr-only">(current)</span>
        <a class="nav-item nav-link active font-weight-bold" href="addplayer.html">Add Player <span
            class="sr-only">(current)</span></a>
        <a class="nav-item nav-link active font-weight-bold" href="matchdetails.html">View Match Details</a><span
          class="sr-only">(current)</span>
        <a class="nav-item nav-link text-info font-weight-bold" href="start.html">Start Match <span
            class="sr-only">(current)</span></a>
      </div>
    </div>
  </nav>

<form action="matchStart" align="center" >
 <div class="row justify-content-center">

      <div class="form-group row col-2" style=margin-top:40px>
        <select class="form-control" value="team" name="team" id="sel1">
          <option>INDIA</option>
          <option>PAKISTAN</option>
          <option>MI</option>
          <option>CSK</option>
        </select>
      </div>
      <label class="col-4 col-form-label font-weight-bold " style="margin-top: 40px">Won the Toss .......... !!!!!!!!!!!
        And Elected to </label>
      <div class="form-group row col-2" style=margin-top:40px;>
        <select class="form-control" value="batball" name="batball" id="sel1">
          <option>BAT</option>
          <option>BALL</option>
        </select>
      </div>

      <div class="form-group row col-8" style=margin-top:20px>
        <button class="btn btn-primary" type="submit" style=margin-left:45%>Submit</button>
      </div>
    </div>
</form>

</body>
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


</html>