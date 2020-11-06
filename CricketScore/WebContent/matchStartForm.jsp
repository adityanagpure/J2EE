<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.cdac.dto.playerList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>&#127951; Live Cricket</title>

  <!--bootstrap link -->

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>

<body>
  <header>

    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
      <a class="navbar-brand">
        <img src="">
      </a>
      <a class="nav-link text-light">
        <h3>Live Cricket Score</h3><span class="sr-only">(current)</span>
      </a>
	
            <a href="logout" class="nav-link text-light ">
                <b>
                    <h3 style="margin-left: 800px;">Log-Out</h3>
                </b>
            </a>
  </header>
  <div class="container">

    <div class="row  ml-4">
      <div class="col-md-8" style="margin-top:20px">
        <h1 class="display-4"> Start Match ... !!!</h1>
      </div>
    </div>

    <!-- <div style="font-size:20px; font-family:bold">Select Batmans :</div> -->
    <form action="battingSummary" align="center">
      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Striker:</label>
        <div class="form-group row col-6">
          <select class="form-control" name="striker" id="sel1">
            <%  List<playerList> list1 =(List<playerList>)request.getAttribute("list1"); 
              for(playerList p : list1) { //
            %>
            <option> <%= p.getPlayerName() %> </option>
            <% } %>
          </select>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Non-Striker:</label>
        <div class="form-group row col-6">
          <select class="form-control" name="nonStriker" id="sel1">
            <%  List<playerList> list2 =(List<playerList>)request.getAttribute("list1"); 
              for(playerList p : list2) {
            %>
            <option> <%= p.getPlayerName() %> </option>
            <% } %>
          </select>
        </div>
      </div>


      <!-- <div style="font-size:20px; font-family:bold ; margin-top:30px">Select Bowler :</div> -->

      <div class="form-group row col-8" style=margin-top:30px>
        <label class="col-2 col-form-label">Select Bowler:</label>
        <div class="form-group row col-6">
          <select class="form-control" name="bowler" id="sel1">
            <%  List<playerList> ballerlist =(List<playerList>)request.getAttribute("ballerlist"); 
              for(playerList p : ballerlist) {
            %>
            <option> <%=p.getPlayerName() %> </option>
            <% } %>
          </select>
        </div>
      </div>

      <div class="form-group row col-8" style=margin-top:20px>
        <button class="btn btn-primary" type="submit" style=margin-left:17%>Start Match</button>
      </div>
    </form>

  </div>




  <div class="container-fluid bottom-footer pt-2 bg-danger fixed-bottom">
    <div class="row">
      <div class="col-12 text-center text-light font-weight-bold ">
        <p>Copyrights © 2020 - All rights reserved</p>
      </div>
    </div>
  </div>

</body>
</html>