package com.tech.blog.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.Entities.Post;
import com.tech.blog.Entities.User;
import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
/**
 * Servlet implementation class AddPostservlet
 */
@WebServlet("/AddPostservlet")
@MultipartConfig
public class AddPostservlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		try {
			PrintWriter out= response.getWriter();
			int cid=Integer.parseInt(request.getParameter("cid"));
			String pTitle=request.getParameter("pTitle");
			String pContent=request.getParameter("pContent");
			String pCode=request.getParameter("pCode");
			String pLink=request.getParameter("pLink");
			Part part=request.getPart("pImg");
			String pimg = part.getSubmittedFileName();
			//out.println("Title name is "+pTitle);
			//out.println("path name is "+pimg);
			//out.println("path name is "+cid);
			HttpSession session=request.getSession();
			User user= (User)session.getAttribute("CurentUser");
			Post p=new Post(pTitle, pContent, pimg, null, cid, user.getId(),pLink,pCode);
			PostDao dao=new PostDao(ConnectionProvider.getConnection());
			if (dao.savePost(p)) {
				
				
				String path = request.getRealPath("/") + "BlogPics" + File.separator + p.getpPic();
				Helper.saveFile(part.getInputStream(), path);
				out.println("Done");
				
			}
			else {
				out.println("error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
