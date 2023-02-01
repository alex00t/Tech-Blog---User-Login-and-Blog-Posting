<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SingUp !</title>
<%@include file="HelperPages/CssLink.jsp"%>
</head>
<body>
	<%@include file="HelperPages/navbar.jsp"%>
	<main class="primary-background  banner-background"
		style="padding-bottom: 70px">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x fa-spin"></span> <br> Register
						here
					</div>
					<div class="card-body">

						<form id="reg_form" action="RegesterUser" method="post">

							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name" type="text"
									class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="user_email">Email address</label> <input name="user_email"
									type="email" class="form-control" id="user_email"
									aria-describedby="emailHelp" placeholder="Enter email">
								</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="user_password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label for="user_gender">Select Gender</label> <br> <input
									type="radio" id="user_gender" name="gender" value="male">Male <input
									type="radio" id="user_gender" name="gender" value="female">Female
							</div>

							<div class="form-group">
								<textarea name="user_about" class="form-control" rows="4"
									placeholder="Enter about Somthing Your Self"></textarea>
							</div>

							<div class="form-check">
								<input name="user_chack" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<br>
							<div class="container text-center"id="loader" style="display: none;">
							<span class="fa fa-spinner fa-spin"></span>
							<br>
							<h4>Please wait...</h4>
							
							
							</div>

							<button id="submit_btn" type="submit" class="btn btn-outline-light primary-background">Submit</button>
						</form>
					</div>
				</div>

			</div>


		</div>






	</main>
	<!-- JavaScripts -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(document).ready(function(){
		console.log("Lodded......")
		
		$('#reg_form').on('submit',function(event){
			event.preventDefault();
			
			
			
			
			let form = new FormData(this);
			$('#submit_btn').hide();
			$('#loader').show();
			$.ajax({
				url: "RegesterUser",
				type:'POST',
				data: form,
				success: function(data,textStatus,jqXHR){
					console.log(data)
					$('#submit_btn').show();
					$('#loader').hide();
					
					if (data.trim()==='Done')
						{

						swal("Regestred Successfuly...")
						.then((value) => {
							window.location = "Login.jsp"
						});
						
						
						}
					else
						{
						swal(data);
						}
					
					
					
				},
				
			error: function(jqXHR,textStatus,errorThrown){
				
				$('#submit_btn').show();
				$('#loader').hide();
				swal("Something went wrong.....try agin");
			},
			
			processData:false,
			contentType:false
				
			});
			
			
		});
		
	});
	
	</script>

	
	
	
	
	
</body>
</html>