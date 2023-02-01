<%@page import="com.tech.blog.Entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
	<%
	Thread.sleep(1000);
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	int ccid = Integer.parseInt(request.getParameter("ccid"));
	List<Post> post = null;
	if (ccid == 0) {
		post = d.getAllPosts();

	} else {
		post = d.getpostBycidList(ccid);
	}
	if (post.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No Post in this Category</h3>");
		return;
	}

	for (Post p : post) {
	%>
	<%--  <div class="col-md-6 mt-2">

		<div class="card">
		   <img src="BlogPics/<%=p.getpPic() %>" class="card-img-top" style="max-width: 50%" alt="...">
		
			<div class="card-body">
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
			</div>
		</div>
	</div> --%>

	<%-- <div class="col-md-6 mt-2">
 <div class="card" style="width: 18rem;"> 
  <div class="card-header">
    <h6 class="card-subtitle mb-2 text-muted"><%=p.getpTitle() %></h6>
    
    
  </div>
  <div class="card-body">
  <p class="card-text"></p>
    
  </div>
  
</div>
</div>  --%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img src="BlogPics/<%=p.getpPic()%>" class="card-img-top"
				style="max-width: 50%" alt="...">

			<div class="card-body">
				<h5 class="card-title"><%=p.getpTitle()%></h5>
				<p class="card-text"><%=p.getpContent()%></p>

			</div>
			<div class="card-footer text-center primary-background">
				<a href="#!" class="btn btn-outline-light btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span>10</span></a> <a
					href="show_blog_page.jsp?post_id=<%=p.getpId()%>"
					class="btn btn-outline-light btn-sm">more...</a> <a href="#!"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"></i><span>10</span></a>
			</div>
		</div>


	</div>

	<%
	}
	%>


</div>