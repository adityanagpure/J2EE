<%@page import="com.cdac.dao.matchDetailsDaoImple"%>
<%@page import="com.cdac.dao.matchDetailsDao"%>
<%@page import="com.cdac.dto.ScoreBoard"%>
<%@page import="com.cdac.service.matchDetailsServiceImple"%>
<%@page import="com.cdac.service.matchDetailsService"%>
<%@page import="com.cdac.dto.Runs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %>
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
  <%
ScoreBoard sb11 = (ScoreBoard) request.getAttribute("sb11");
ScoreBoard sb22 = (ScoreBoard) request.getAttribute("sb22");
Runs runs = new Runs();
%>
  <header>

    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
      <a class="navbar-brand">
        <img src="">
      </a>
      <a class="nav-link text-light">
        <h3>&#127951; Live Cricket Score</h3><span class="sr-only">(current)</span>
      </a>

  </header>
  <div class="container-fluid pt-3">
    <div class="row">
      <div class="col-3">
        <div class="sticky-top" style="top: 90px;background-color:LightGray">
          <ul class="list-group" style="cursor: pointer; ">
            <li class="list-group-item" style="background-color:rgb(48, 48, 48); font-size: 26px; color: whitesmoke;">
              ENTER RUN</li>


            <form action="updateRun2" method="post">
              <div class="form-group row col-12" style=margin-top:30px>
                <label class="col-5 col-form-label">On Strike:</label>
                <div class="form-group row col-7">
                  <select class="form-control" name="playerName" value="playerName" id="sel1">
                    <option> ${s1} </option>
                    <option> ${ns1} </option>
                  </select>
                </div>
              </div>


              <div class="form-group row col-12">
                <label class="col-5 col-form-label">Run:</label>
                <div class="form-group row col-7">
                  <select name="playerTotalRun" value="playerTotalRun" class="form-control" id="sel1">
                    <option value="0" label="0"> </option>
                    <option value="1" label="1"> </option>
                    <option value="2" label="2"> </option>
                    <option value="3" label="3"> </option>
                    <option value="4" label="4"> </option>
                    <option value="6" label="6"> </option>
                  </select>
                </div>
              </div>

              <div class="form-group row col-12">
                <label class="col-5 col-form-label">Run Type:</label>
                <div class="form-group row col-7">
                  <select class="form-control" name="runType" value="runType" id="sel1">
                    <option value="Batted" label="Batted"> </option>
                    <option value="Extra" label="Extra"> </option>
                    <option value="OUT" label="OUT"> </option>
                  </select>
                </div>
              </div>

              <div class="form-group row col-12">
                <label class="col-5 col-form-label">Extra Run:</label>
                <div class="form-group row col-7">
                  <select name="extraRun" value="extraRun" class="form-control" id="sel1">
                    <option value="select" label="select"> </option>
                    <option value="Wide" label="Wide"> </option>
                    <option value="No ball" label="No ball"></option>
                    <option value="Leg-By" label="Leg-By"></option>
                    <option value="Over Throw" label="Over Throw"> </option>
                  </select>
                </div>
              </div>

          </ul>
          <div class="form-group row col-8" style=margin-top:10px>
            <button class="btn btn-primary" type="submit" style=margin-left:65%;margin-bottom:20px>Submit</button>
          </div>
          </form>
        </div>


      </div>
      <div class="col-9">
        <label class="col-5 col-form-label" style="margin-left:35%">
          <h2> <%= session.getAttribute("team") %> SCORE BOARD</h2>
        </label>
        <div class="container">
          <div class="row">



            <div class="table-responsive">
              <table class="table table-stripped table-bordered">
                <tr class="thead-dark">
                  <th>BATSMAN</th>
                  <th> </th>
                  <th>RUN</th>
                  <th>BALLS</th>
                  <th>FOUR</th>
                  <th>SIX</th>

                </tr>

                <tr>
                  <td>${s1} </td>
                  <td>Not out* </td>
                  <td> <%=sb11.getPlayerTotalRun() %></td>
                  <td> <%=sb11.getPlayerBalls() %> </td>
                  <td> <%=sb11.getFourRun() %></td>
                  <td> <%=sb11.getSixRun() %></td>
                </tr>


                <tr>
                  <td> ${ns1} </td>
                  <td>Not out</td>
                  <td> <%=sb22.getPlayerTotalRun() %></td>
                  <td><%=sb22.getPlayerBalls() %> </td>
                  <td> <%=sb22.getFourRun() %></td>
                  <td><%=sb22.getSixRun() %></td>
                </tr>

                <tr>
                  <td> ${b1} </td>
                  <td> Bowling </td>
                  <td></td>
                  <td> </td>
                  <td> </td>
                  <td></td>
                </tr>

              </table>
            </div>
            <div>



              <div class="table-responsive" style="margin-top:30px">
                <table class="table table-stripped table-bordered">
                  <tr class="thead-dark">
                    <th>TOTAL BALLS</th>
                    <th>TOTAL SCORE</th>

                  </tr>

                  <tr>
                    <td><%= runs.getBalls2() %></td>
                    <td> <%= runs.getScore1() %>/ <%= session.getAttribute("w2") %> </td>

                  </tr>
                </table>

              </div>
            </div>
            <a class="" href="endMatch" style="margin-left: 300px; margin-top: 50px;"> End The Match
            </a>
          </div>
        </div>
      </div>

      <div class="container-fluid bottom-footer pt-2 bg-danger fixed-bottom">
        <div class="row">
          <div class="col-12 text-center text-light font-weight-bold ">
            <p>Copyrights � 2020 - All rights reserved</p>
          </div>
        </div>
      </div>
</body>
</html>
