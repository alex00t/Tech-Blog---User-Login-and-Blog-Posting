package com.tech.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.Entities.Message;
import com.tech.blog.Entities.User;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");

			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User u = dao.getUserByEmailandPassword(userEmail, userPassword);
			if (u == null) {
				Message msg = (Message) new Message("Invalid Details !", "error", "Alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);

				response.sendRedirect("Login.jsp");
				out.println("Invilid Info......");

			} else {

				HttpSession hs = request.getSession();
				hs.setAttribute("CurentUser", u);
				response.sendRedirect("ProfilePage.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
