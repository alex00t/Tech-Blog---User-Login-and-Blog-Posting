package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.webresources.Cache;

import com.tech.blog.Entities.User;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegesterUser")
@MultipartConfig
public class RegesterUser extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		String chack=request.getParameter("user_chack");
		if (chack==null) {
			out.println("Plz chack the box");
			
		}
		else {
			String name= request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("user_about");
			User user=new User(name,email,password,gender,about);
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if (dao.SaveUser(user)) {
				out.println("Done");
				
			}
			else {
				out.println("Error....");
			}
			
		}
		
	}

}
