<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.Entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.Entities.Message"%>
<%@page import="com.tech.blog.Entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("CurentUser");
if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
<%@include file="HelperPages/CssLink.jsp"%>
<style type="text/css">
body {
	background: url("img/bg-post.jpg");
	background-size: cover;
	background-attachment: fixed;
}
</style>

</head>
<body>
	<!-- NavBar  -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp">TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Programming Language </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java Language</a> <a
							class="dropdown-item" href="#">Python Languege</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#Add-post-modal"><span
						class="fa fa-asterisk fa-spin"></span>Add Post</a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item active"><a href="!#" class="nav-link"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle fa-spin m-1"> </span><%=user.getName()%></a></li>
				<li class="nav-item active"><a href="LogoutServlet"
					class="nav-link"><span class="fa fa-user-circle fa-spin m-1">
					</span>Logout</a></li>
			</ul>

		</div>
	</nav>
	<!--NavBar End  -->
	
	
	
	<!-- message -->

	<%
	Message message = (Message) session.getAttribute("msg");
	if (message != null) {
	%>
	<div class="alert alert-danger text-center" role="alert">
		<%=message.getContent()%></div>

	<%
	session.removeAttribute("msg");

	}
	%>
	<!--Main Post Category Section  -->
	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-4">
					<!--Category  -->
					<div class="list-group ">
						<a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
							All Post Category </a>
						<%
						PostDao p = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = p.getAllCategories();
						for (Category cc : list1) {
						%>
						<a href="#"onclick="getPost(<%=cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action active"><%=cc.getcName()%></a>
						<%
						}
						%>
					</div>

				</div>
				<div class="col-md-8" >
					<!--Post  -->
					<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-3x fa-spin"></i>
					<h3 class="mt-2">Refresh...</h3>
					</div>
					
					<div class="container-fluid" id="post-container">
					
					</div>
					
				</div>
			</div>
		</div>

	</main>


	<!--End Main Post Category Section  -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%> " class="img-fluid"
							style="border-radius: 50%; max-width: 50px;"> <br>
						<h5 class="modal-title id="modal-label"><%=user.getName()%></h5>
						<br>
						<!-- Detailes -->
						<div id="edit-detaile">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered On :</th>
										<td><%=user.getTimedate().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- Modal End -->

						<!-- profile edit -->
						<div id="edit-profile" style="display: none;">
							<h4 class="mt-2">Please Edit Your Details</h4>
							<div class="container">
								<form action="EditServlet" method="post"
									enctype="multipart/form-data">
									<table class="table">
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>

										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" name="edit_name"
												value="<%=user.getName()%>"></td>

										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><input type="email" name="edit_email"
												value="<%=user.getEmail()%>"></td>

										</tr>

										<tr>
											<th scope="row">Password change :</th>
											<td><input type="password" name="edit_password"
												value="<%=user.getPassword()%>"></td>

										</tr>
										<tr>
											<th scope="row">Gender :</th>
											<td><%=user.getGender().toUpperCase()%></td>

										</tr>
										<tr>
											<th scope="row">Status :</th>
											<td><textarea class="form-control" name="edit_about"
													rows="2"><%=user.getAbout()%>
										</textarea></td>
										</tr>
										<tr>
											<th scope="row">Profile img :</th>
											<td><input type="file" name="edit_img"
												class="form-control"></td>

										</tr>

									</table>
									<div class="cantainer">
										<button type="submit"
											class="btn primary-background text-white">Save</button>
									</div>


								</form>

							</div>

						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn primary-background text-white"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn primary-background text-white">EDIT</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End ProfileEdit -->

	<!-- PostModal -->


	<!-- Modal -->
	<div class="modal fade" id="Add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter Post
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addpost" action="AddPostservlet" method="post">
						<div class="form-group">

							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">---Select
									Category---</option>
								<%
								PostDao pd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = pd.getAllCategories();
								for (Category c : list) {
								%>

								<option  value="<%=c.getCid()%>"><%=c.getcName()%></option>

								<%
								}
								%>

							</select>


						</div>
						<div class="form-group">
							<input type="text" name="pTitle"
								placeholder="Please Enter Post title" class="form-control" />
						</div>
						<div class="form-group">
							<textarea class="form-control" name="pContent"
								placeholder="Enter You Content" style="height: 200px;"></textarea>

						</div>
						<div class="form-group">
							<textarea class="form-control" name="pCode"
								placeholder="Enter You Program(if any)" style="height: 200px;"></textarea>
						</div>

						<div class="form-group">
							<input type="text" name="pLink"
								placeholder="Please Enter Your Link (Option)"
								class="form-control" />
						</div>

						<div class="form-group">
							<label>Select Your Pic :</label> <br> <input type="file"
								name="pImg">

						</div>
						<div class="container text-center">
							<button type="submit" class="btn primary-background text-white">Save
								changes</button>


						</div>

					</form>

				</div>

			</div>
		</div>
	</div>


	<!-- End PostMoal -->



	<%@include file="HelperPages/javascript.jsp"%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$("#edit-profile-button").click(function() {
				if (editStatus == false) {
					$("#edit-detaile").hide()
					$("#edit-profile").show()

					editStatus = true;
					$(this).text("Back")

				} else {

					$("#edit-detaile").show()
					$("#edit-profile").hide()

					editStatus = false;
				}
			})
		});
	</script>



	<script>
		$(document).ready(function() {

			$("#addpost").on("submit", function() {

				event.preventDefault();

				let form = new FormData(this);
				$.ajax({
					url : "AddPostservlet",
					type : "post",
					data : form,
					success : function(data, textStatus, jqXHR) {

						if (data.trim() == 'Done') {
							swal("Good job!", "Successfull Saved!", "success");
						} else {
							swal("Error!", "Something went Wrong!", "error");
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {

						swal("Error!", "Something went Wrong!", "error");

					},

					processData : false,
					contentType : false
				});

			});

		});
	</script>
	<script type="text/javascript">
	function getPost(fid,temp) {
		$("#loader").show();
		$("#post-container").hide()
		$(".c-link").removeClass('active')
		
		
		
		$.ajax({
			url : "Loader.jsp",
			data: {ccid:fid},	
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$('#post-container').html(data)
				$(temp).addClass('active')
			}
				
				
		});
		
		
	}
	
	$(document).ready(function(e){
		let allPostRef=$('.c-link')[0]
		getPost(0,allPostRef);
		
	});

	</script>
	

</body>
</html>