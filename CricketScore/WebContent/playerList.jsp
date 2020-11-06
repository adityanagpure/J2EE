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
            
            </a>
            <a class="nav-link text-light">
                <h3>&#127951; Cricket Score</h3><span class="sr-only">(current)</span>
            </a>

    </header>

    <nav class="navbar navbar-expand-lg navbar-light bg-warning">

        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link text-info font-weight-bold" href="main.html">Add Match Info</a><span
                    class="sr-only">(current)</span>
                <a class="nav-item nav-link active font-weight-bold" href="addplayer.html">Add Player <span
                        class="sr-only">(current)</span></a>
                <a class="nav-item nav-link active font-weight-bold" href="matchdetails.html">View Match
                    Details</a><span class="sr-only">(current)</span>
                <a class="nav-item nav-link active font-weight-bold" href="start.html">Start Match <span
                        class="sr-only">(current)</span></a>
            </div>
        </div>
    </nav>
    <br>
    <h2 class="text-center display-4"> <u> Add Player Details </u></h2>
    <div class="container">
        <form action="addPlayer" method="post">
            <h4 class="text-center display1-4"> </h4>
            <div class="row justify-content-center">
                <div class="form-group row col-8" style=margin-top:40px>
                    <label class="col-3 col-form-label font-weight-bold">player Name:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="playerName" placeholder="Enter Player Name..!!">
                    </div>
                </div>

                <div class="form-group row col-8" style=margin-top:20px>
                    <label class="col-3 col-form-label font-weight-bold"> Team Name :</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="playerTeam" placeholder="Enter Team Name..!!">
                    </div>
                </div>


                <div class="form-group row col-8" style=margin-top:20px>
                    <button class="btn btn-outline-dark" type="submit" style=margin-left:200px>ADD Player</button>
                </div>
            </div>
        </form>
        <a href="showList"> <button class="btn btn-outline-dark" type="submit" style=margin-left:390px>Show
                List</button> </a>
    </div>
    <footer class="full-footer bg-light sticky-bottom fixed-bottom">
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

