<%@page import="com.cdac.dto.playerList"%>
<%@page import="java.util.List"%>
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

      </a>
      <a class="nav-link text-light">
        <h3>&#127951; Live Cricket Score</h3><span class="sr-only">(current)</span>
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


  <form action="battingSummary">
    <div class="container">

      <div class="row">
        <div class="col-md-8" style="margin-top:20px">
          <h1>Select Next Player </h1>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Striker:</label>
        <div class="form-group row col-6">
          <select class="form-control" name="striker" value="striker" id="sel1">
            <%  List<playerList> list1 =(List<playerList>)request.getAttribute("lis"); 
		for(playerList p : list1) { //
	%>
	<option> <%= p.getPlayerName() %> </option>
	<% } %>
          </select>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Non-Striker :</label>
        <div class="form-group row col-6">
          <select name="nonStriker" class="form-control" id="sel1">
          	<%  List<playerList> list2 =(List<playerList>)request.getAttribute("lis"); 
		for(playerList p : list2) {
	%>
	<option> <%= p.getPlayerName() %> </option>
	<% } %>
          </select>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Bowler : </label>
        <div class="form-group row col-6">
          <select name="bowler" class="form-control" id="sel1">
           	<%  List<playerList> lis1 =(List<playerList>)request.getAttribute("lis1"); 
		for(playerList p : lis1) {
	%>
	<option> <%=p.getPlayerName() %> </option>
	<% } %>
          </select>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:20px>
        <button class="btn btn-primary" type="submit" style=margin-left:17%>Submit</button>
      </div>
    </div>

  </form>


  <div class="container-fluid bottom-footer pt-2 bg-danger">
    <div class="row">
      <div class="col-12 text-center text-light font-weight-bold ">
        <p>Copyrights © 2020 - All rights reserved</p>
      </div>
    </div>
  </div>
</body>
</html>