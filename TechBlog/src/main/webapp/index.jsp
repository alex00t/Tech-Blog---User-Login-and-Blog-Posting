<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.Entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>techblog</title>
<%@include file="HelperPages/CssLink.jsp" %>
</head>
<body>
	<!-- NavBar -->
	<%@include file="HelperPages/navbar.jsp"%>

	<div class="ccntainer-fluid p-0 m-0">
		<div class="jumbotron primary-background banner-background" >
			<div class="container ">
				<h3 class="display-3 text-white">Welcome to Technology Blogs</h3>
				<p class="display-5 text-white">Wlcome to technical blog, world of technology Computer
					programming is the process of telling a computer to do certain
					things by giving it instructions. These instructions are called
					programs. A person who writes instructions is a computer
					programmer. The instructions come in different languages; they are
					called programming languages</p>
				<a href="regesterPage.jsp" class="btn btn-outline-light btn-lg">
					<span class="	fa fa-user-plus m-1"></span>Start ! its free
				</a>
				<a href="Login.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle fa-spin m-1"> </span>LogIn
				</a>
			</div>
		</div>
	</div>
	<!-- Cards -->
	<div class="container">
		<div class="row mb-2">
		<%
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		List<Post>list =dao.getAllPosts();
		for(Post p:list)
		{
			%>
			<div class="col-md-4 mt-2">
				<div class="card">
				<img src="BlogPics/<%=p.getpPic()%>" class="card-img-top"
				style="max-width: 50%" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=p.getpTitle() %></h5>
						<p class="card-text"><%=p.getpContent() %></p>
					</div>
					<div class="card-footer text-center primary-background">
				<a href="#!" class="btn btn-outline-light btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span>10</span></a> <a
					href="show_blog_page.jsp?post_id=<%=p.getpId()%>"
					class="btn btn-outline-light btn-sm">more...</a> <a href="#!"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"></i><span>20</span></a>
			</div>
				</div>


			</div>
						
			<%
		}
		
		%>
		</div>
		</div>
		
	<!-- 				<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>


			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>


			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>



			</div>
		</div>
	</div> -->




	<%@include file="HelperPages/javascript.jsp" %>
</body>
</html>