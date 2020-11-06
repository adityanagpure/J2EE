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
        <a class="nav-item nav-link text-info font-weight-bold" href="main.html">Add Match Info</a><span
          class="sr-only">(current)</span>
        <a class="nav-item nav-link active font-weight-bold" href="addplayer.html">Add Player <span
            class="sr-only">(current)</span></a>
        <a class="nav-item nav-link active font-weight-bold" href="matchdetails.html">View Match Details</a><span
          class="sr-only">(current)</span>
        <a class="nav-item nav-link active font-weight-bold" href="start.html">Start Match <span
            class="sr-only">(current)</span></a>
      </div>
    </div>
  </nav>

  <div class="container">
    <form action="addmatchDetails" method="get">
      <div class="row justify-content-center">


        <div class="form-group row col-8" style=margin-top:40px>
          <label class="col-3 col-form-label font-weight-bold">TEAM 1 Name:</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" name="team1Name" required>
          </div>
        </div>

        <div class="form-group row col-8" style=margin-top:20px>
          <label class="col-3 col-form-label font-weight-bold">TEAM 2 Name:</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" name="team2Name" required>
          </div>
        </div>

        <div class="form-group row col-8" style=margin-top:20px>
          <label class="col-3 col-form-label font-weight-bold">Coach Name:</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" name="cotchName" required>
          </div>
        </div>

        <div class="form-group row col-8" style=margin-top:20px>
          <label class="col-3 col-form-label font-weight-bold">Match Venue:</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="inputVenue" name="matchVenue" required>
          </div>
        </div>

        <div class="form-group row col-8" style=margin-top:20px>
          <label class="col-3 col-form-label font-weight-bold">Date and Time:</label>
          <div class="col-sm-9">
            <input type="datetime-local" class="form-control" id="inputDateTime" name="matchDate" required>
          </div>
        </div>

        <div class="form-group row col-8" style=margin-top:20px>
          <button class="btn btn-primary" type="submit" style=margin-left:200px>Submit</button>
        </div>


      </div>
    </form>
  </div>

  <div class="container-fluid bottom-footer pt-2 bg-danger fixed-bottom1">
    <div class="row">
      <div class="col-12 text-center text-light font-weight-bold ">
        <p>Copyrights © 2020 - All rights reserved</p>
      </div>
    </div>
  </div>
</body>
</html>