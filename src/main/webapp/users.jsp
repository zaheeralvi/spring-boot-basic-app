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
						<th>Actions</th>
					</tr>
					<c:forEach items="${userlist}" var="user">
					    <tr class="row_${user.id}">      
					        <td class="name">${user.name}</td>
					        <td class="email">${user.email}</td>
					        <td class="country">${user.country}</td>
					        <td>
					        	<a href='javascript:void(0)' onclick='editAction(${user.id})' class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-edit">&nbsp;</span> Edit
								</a>
					        	<a href='javascript:void(0)' onclick='removeAction(${user.id})' class="btn btn-default btn-sm">
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
					if ($(this).hasClass('edit')) {
						editnow();
					}else{
						var name= $('.username').val();
						var country= $('.add_user .country').val();
						var email= $('.add_user .email').val();
						$.ajax({
							type: "POST",
					        url: "/add",
					        data: {'name':name,'email':email,'country':country},
					        success: function(result){
					        	result=parseInt(result);
					        	var row=`<tr class='row_`+result+`'><td>`+name+`</td><td>`+email+`</td><td>`+country+`</td><td><a href='javascript:void(0)' onclick='editAction(`+result+`)' class="btn btn-default btn-sm"><span class="glyphicon glyphicon-edit">&nbsp;</span> Edit
									</a>&nbsp;<a href='javascript:void(0)' onclick='removeAction(`+result+`)' class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove">&nbsp;</span> Remove
									</a></td></tr>`;
								$('#users_table').append( row );
								$('.add_user').find('input').val('');
						}});
					}
				});
			});

			function editAction(id){
				var row = $('.row_'+id)
				var name = row.find('td.name').html();
				var email = row.find('td.email').html();
				var country = row.find('td.country').html();
		
				$('.add_user').find('.username').val(name);
				$('.add_user').find('.email').val(email);
				$('.add_user').find('.country').val(country);
				$('.add_user').append(`<input type="hidden" name="edit_id" class="edit_id" value="`+id+`">`)
				$('.add_user').closest('.jumbotron').find('h2').text('Edit Form');
				$('.add_user').find('.submit').removeClass('submit').addClass('edit').text('Update');
			}

			function editnow(){
					var id= $('.edit_id').val();
					var name= $('.username').val();
					var country= $('.add_user .country').val();
					var email= $('.add_user .email').val();
					console.log(id + ' '+name +" "+ email+' '+country);
					$.ajax({
						type: "POST",
				        url: "/edit",
				        data: {'id':id,'name':name,'email':email,'country':country},
				        success: function(result){
							$('.add_user').find('input').val('');
							$('.add_user').closest('.jumbotron').find('h2').text('Add New user');
							$('.add_user').find('.edit').removeClass('edit').addClass('submit').text('Submit');
							$('.add_user').find('.edit_id').remove();
							$('#users_table tr.row_'+id).find('.name').text(name);
							$('#users_table tr.row_'+id).find('.email').text(email);
							$('#users_table tr.row_'+id).find('.country').text(country);
						}
					});
				}

			function removeAction(id){
				$.ajax({
					type: "POST",
			        url: "/remove",
			        data: {'id':id},
			        success: function(result){
			        	var row= 'row_'+id;
						$('#users_table tr.'+row).hide();
					}
				});
			}

		</script>
	</body>
</html>









