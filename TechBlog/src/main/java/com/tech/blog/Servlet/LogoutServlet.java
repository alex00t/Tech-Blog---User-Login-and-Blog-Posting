package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.Entities.Message;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		out.println("Hello");
		try {
			HttpSession s=request.getSession();
			s.removeAttribute("CurentUser");
			Message msg= new Message("Successfully Logout !", "success", "Alert-danger");
			s.setAttribute("msg", msg);
			
			response.sendRedirect("Login.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
