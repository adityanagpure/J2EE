<%@page import="com.cdac.dto.playerList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-danger fixed-top">
            <a class="navbar-brand">
                <img src="" width="" height="">
            </a>
            <a class="nav-link text-light">
                <h3>&#127951; Cricket ScoreBoard</h3>
            </a>
            
            <a href="logout" class="nav-link text-light ">
                <b>
                    <h3 style="margin-left: 800px;">Log-Out</h3>
                </b>
            </a>
    </header>
    <div style="height:25px;"></div>
    <div class="container-fluid jumbotron">
        <div class="row content">
            <div class=" col-sm-12 main mt-3">
                <h3 class="text-center">
                    <b>Player List</b>
                </h3>
                <!-- Search bar -->
                <div class="container">
                    <div class="row">
                        <div class="col-2 form-group col-sm-3 ml-0 pl-0 float-left">
                            <input class="form-control  float-center" id="myInput" type="text" placeholder="Search">
                        </div>
                        <div class="col-8 form-group col-sm-6 float-left">
                        </div>
                    </div>
                </div>

                <!-- <div class="table-responsive" id="myTable"></div> -->
                <table class="table  table-striped ">
                    <thead class="table-dark">
                        <tr>
                            <th class="align-middle">Player Id</th>
                            <th class="align-middle">Player Name</th>
                            <th class="align-middle">Player Team Name </th>
                            <th class="align-middle"> Update Player</th>
                            <th class="align-middle">Delete Player </th>
                        </tr>
                    </thead>
                    <tbody id="myTableBody">
                        <%
	List<playerList> list =(List<playerList>) request.getAttribute("listofplayer");
	for(playerList p : list){
%>
                        <tr style="">
                            <td class="align-middle"> <%=p.getPlayerId() %> </td>
                            <td class="align-middle"> <%=p.getPlayerName() %> </td>
                            <td class="align-middle"><%=p.getPlayerTeam() %> </td>
                            <td class="align-middle">
                                <a href="updatePlayer?pid=<%=p.getPlayerId()%>">
                                    <button type="button" class="btn btn-outline-dark  btn-block" id="btn0"
                                        data-toggle="modal" data-target="#myModal">Update</button></a>
                            </td>
                            <td class="align-middle">
                                <a href="deletePlayer?pid=<%=p.getPlayerId()%>">
                                    <button type="button" class="btn btn-outline-danger btn-block" id="btn0"
                                        data-toggle="modal" data-target="#myModal">Delete</button></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <a href="tossForm" class="" style="margin-left: 600px;">
                <button class="btn btn-primary btn-block"> Confirm </button>
            </a>
            
    <button class=" ml-2 btn btn-dark " onclick="window.print()" style="margin-left: 650px">
               Print Or Save  </button>
            
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