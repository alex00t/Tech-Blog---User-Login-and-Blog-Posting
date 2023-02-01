package com.tech.blog.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.Entities.Message;
import com.tech.blog.Entities.User;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {

			String editName = request.getParameter("edit_name");
			String editEmail = request.getParameter("edit_email");
			String editPassword = request.getParameter("edit_password");
			Part part = request.getPart("edit_img");
			String editImg = part.getSubmittedFileName();
			String editAbout = request.getParameter("edit_about");
			HttpSession s = request.getSession();
			User user = (User) s.getAttribute("CurentUser");
			user.setName(editName);
			user.setEmail(editEmail);
			user.setPassword(editPassword);
			String oldFile=user.getProfile();
			user.setProfile(editImg);
			user.setAbout(editAbout);

			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			Boolean ans = userDao.UpdateUser(user);

			if (ans) {

				String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
//				DeleteProfilePicture
				String oldpath = request.getRealPath("/") + "pics" + File.separator + oldFile;
				if(!oldFile.equals("defult.png"))
				{
					Helper.deleteFile(oldpath);
					
				}
				
				
				

				if (Helper.saveFile(part.getInputStream(), path)) {
					Message msg = (Message) new Message("Update Profile Detailes..... !", "success", "Alert-success");
					s.setAttribute("msg", msg);

				}

				else {
					out.println("error......");
				}

			} else {
				Message msg = (Message) new Message("Something went Wrong..... !", "error", "Alert-danger");
				s.setAttribute("msg", msg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("ProfilePage.jsp");

	}

}
