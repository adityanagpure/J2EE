<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %>    
 
<!DOCTYPE html>
<html>
<head>
    <title>Update Form</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/0ff6456f25.js" crossorigin="anonymous"></script>
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
                <img src="">
            </a>
            <a class="nav-link text-light">
                <h3>&#127951;Cricket ScoreBoard</h3>
            </a>
    </header>
    <div class="container mt-5">
        <br>
        <br>
        <h6 class="display-4 text-center"> <u> Update Players Details.</u> </h6>
        <spr:form action="updatePlayerDetails" method="post" commandName="plist">
            <h4 class="text-center display1-4"> </h4>
            <div class="row justify-content-center">
                <!--Hiddeen Feild-->
                <div class="form-group row col-8" style=margin-top:40px>
                    <spr:hidden path="playerId" />
                </div>
                <div class="form-group row col-8" style=margin-top:40px>
                    <label class="col-3 col-form-label font-weight-bold">player Name:</label>
                    <div class="col-sm-8">
                        <spr:input path="playerName" cssClass="form-control" />
                    </div>
                </div>

                <div class="form-group row col-8" style=margin-top:20px>
                    <label class="col-3 col-form-label font-weight-bold"> Team Name :</label>
                    <div class="col-sm-8">
                        <!-- <input type="text" class="form-control" name="playerTeam" placeholder="Enter Team Name..!!"> -->
                        <spr:input path="playerTeam" cssClass="form-control" />
                    </div>
                </div>


                <div class="form-group row col-8" style=margin-top:20px>
                    <button class="btn btn-outline-dark" type="submit" style=margin-left:200px>Update</button>
                </div>
            </div>
        </spr:form>

        <a h ref="listofplayer.jsp" style=margin-left:390px>Back
        </a>
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