<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Spring boot Demo App</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">Spring boot</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/">Home</a></li>
                    <li><a href="/about">About</a></li>
                    <li><a href="/contact">Contact</a></li>
                    <li><a href="/all">All users</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h1>Contact us</h1> 
            </div>
            <form role="form" method="post" action="/comment">
                <div class="form-group">
                    <label for="name">Name:</label> 
                    <input type="text" name="name" class="form-control" placeholder="Please Enter your name">
                </div>
                <div class="form-group">
                    <label for="country">Email:</label> 
                     <input type="email" name="email" class="form-control" placeholder="Please Enter your Email">
                </div>
                <div class="form-group">
                    <label for="email">Comment:</label> 
                    <textarea name="comment" class="form-control" placeholder="Please Enter your Comment"></textarea>
                </div>
                <button type="submit" class="btn btn-info">Submit</button>
            </form>
        </div>
    </body>
</html>