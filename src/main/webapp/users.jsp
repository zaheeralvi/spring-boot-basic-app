<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core">

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
				<h1>Home Page</h1> 
			</div>
			<div class="panel panel-default">
				<table id='users_table' class="table table-striped table-hover table-bordered panel-body">
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th></th>
					</tr>
					<c:forEach items="${userlist}" var="user">
					    <tr>      
					        <td>${user.name}</td>
					        <td>${user.email}</td>
					        <td>${user.country}</td>
					        <td>
					        	<a href='javascript:void(0)' class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-edit">&nbsp;</span> Edit
								</a>
					        	<a href='javascript:void(0)' class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-remove">&nbsp;</span> Remove
								</a>
					        </td>
					    </tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-6 jumbotron">
				<h2>Add New user</h2>
				<hr>
				<div class='add_user' class="form">
				    <div class="form-group">
				        <label for="name">Name:</label> 
				        <input type="text" name="name" class="username form-control" placeholder="Please Enter your name">
				    </div>
				    <div class="form-group">
				        <label for="country">Country:</label> 
				        <input type="text" name="country" class="country form-control" placeholder="Please Enter your Country name">
				    </div>
				    <div class="form-group">
				        <label for="email">Email:</label> 
				        <input type="email" name="email" class="email form-control" placeholder="Please Enter your Email">
				    </div>
				    <button type="submit" class="submit btn btn-primary">Submit</button>
				</div>				
			</div>
		</div>
		<script>
			$(document).ready(function(){
				$(".submit").click(function(){
					var name= $('.username').val();
					var country= $('.country').val();
					var email= $('.email').val();
					$.ajax({
						type: "POST",
				        url: "/add",
				        data: {'name':name,'email':email,'country':country},
				        success: function(result){
				        	var row=`<tr><td>`+name+`</td><td>`+email+`</td><td>`+country+`</td></tr>`;
							$('#users_table').append( row );
							$('.add_user').find('input').val('');
					}});
				});
			});
		</script>
	</body>
</html>









