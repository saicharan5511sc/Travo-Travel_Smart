package com.travoapp.controller;


import java.io.IOException;
import java.io.PrintWriter;

import com.travoapp.model.dao.UserDAO;
import com.travoapp.model.dao.UserDAOImpl;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class UserLoginServlet extends HttpServlet{
	UserDAO udao=null;
	public UserLoginServlet() {
		udao=new UserDAOImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email= req.getParameter("email");
		String password =req.getParameter("password");
		Users users=udao.loginUser(email, password);
		HttpSession session=req.getSession();
		resp.setContentType("text/html");
		PrintWriter out= resp.getWriter();
            if(users!=null) {
			
			session.setAttribute("users", users);
			//out.print("Logged In Successfully");
			resp.sendRedirect("dashboard");
			
		          }
            
		            else {
			out.println("LOGIN FAILED");
			
		}
		//super.doPost(req, resp);
	}

}
