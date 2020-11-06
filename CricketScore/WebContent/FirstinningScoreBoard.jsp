<%@page import="com.cdac.dto.Runs"%>
<%@page import="com.cdac.dto.ScoreBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Player List</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/0ff6456f25.js" crossorigin="anonymous">
    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTableBody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <style>
        body {

            background-repeat: no-repeat;
            background-size: cover;
        }

        .img {
            width: 50vh;
            height: 50vh;
            margin-left: 16%;
            margin-top: 40%;
        }

        #icn {
            font-size: 25px;
            margin: 19px;
            color: white;
            cursor: pointer;
        }

        .mobileShow {
            display: inline;
        }

        /* Smartphone Portrait and Landscape */
        @media only screen and (min-device-width: 320px) and (max-device-width: 580px) {
            .mobileShow {
                display: inline;
            }
        }

        .mobileHide {
            display: inline;
        }

        /* Smartphone Portrait and Landscape */
        @media only screen and (min-device-width: 320px) and (max-device-width: 580px) {
            .mobileHide {
                display: none;
            }
        }
    </style>
</head>

<body>
<% Runs runs = new Runs();

int a =runs.getBalls1();
double over = a/6; 
%>
    <header>

        <nav class="navbar navbar-expand-lg navbar-light bg-danger fixed-top">
            <a class="navbar-brand">
                <img src="">
            </a>
            <a class="nav-link text-light">
                <h3>&#127951; Cricket ScoreBoard</h3>
            </a>
    </header>
    <div style="height:25px;"></div>
    <div class="container-fluid">
        <div class="row content">
            <div class=" col-sm-12 main mt-5">
                <h3 class="text-center">
                    TAKE A BREAK..!!!!!
                </h3>
                <h6 class="text-center text-danger"> Next Inning will start shortly.!!</h6>
                <br>

                <!-- Search bar -->
                <div class="container">
                    <div class="row">
                        <div class="col-2 form-group col-sm-3 ml-0 pl-0 float-left">
                            <input class="form-control  float-center" id="myInput" type="text" placeholder="Search">

                        </div>
                        <div class="col-8 form-group col-sm-6 float-left" style="background-color: whitesmoke;">
                            <h6 class="text-center"><%= session.getAttribute("team") %> Score Board <span
                                    style="margin-left: 150px; background-color: whitesmoke; font-size: 17px;">
                                   <b> Total Score :</b> <%= runs.getScore()%> </span>
                                     <br>   <b style="margin-left: 230px;"> Overs :</b> <%= over %>
                            </h6>

                        </div>


                    </div>
                </div>

                <!-- <div class="table-responsive" id="myTable"></div> -->
                <table class="table  table-striped ">

                    <thead class="table-dark">
                        <tr>
                            <th class="align-middle">Player Id</th>
                            <th class="align-middle">Player Name</th>
                            <th class="align-middle">Runs </th>
                            <th class="align-middle"> Ball's</th>
                            <th class="align-middle">4's </th>
                            <th class="align-middle">6's</th>
                        </tr>
                    </thead>
                    <tbody id="myTableBody">
                        <%
                       
                        List<ScoreBoard> finalList = (List<ScoreBoard>)request.getAttribute("finalList");
                        //for(ScoreBoard s :finalList ) {
                        for(int i=0; i<3; i++){
                    %>
                        <tr style="">
                            <td> <%= finalList.get(i).getID() %> </td>
                            <td> <%= finalList.get(i).getPlayerName() %> </td>
                            <td> <%= finalList.get(i).getPlayerTotalRun()%> </td>
                            <td> <%= finalList.get(i).getPlayerBalls() %> </td>
                            <td> <%= finalList.get(i).getFourRun()%> </td>
                            <td> <%= finalList.get(i).getSixRun()%> </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>
            <a href="secondInning" class="" style="margin-left: 600px;">
                <button class="btn btn-primary btn-block"> Press if Second Inning started..!! </button>
            </a>
        </div>
    </div>



    <footer class="full-footer bg-light fixed-bottom">


        <div class="container-fluid bottom-footer pt-2 bg-danger">
            <div class="row">
                <div class="col-12 text-center text-light ">
                    <p>Copyrights © 2020 - All rights reserved</p>
                </div>
            </div>
        </div>
        </div>
    </footer>
</body>

</html>