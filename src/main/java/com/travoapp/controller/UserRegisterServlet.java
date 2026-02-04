package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.UserDAO;
import com.travoapp.model.dao.UserDAOImpl;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	UserDAO uDao=null;
	public UserRegisterServlet() {
		uDao=new UserDAOImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String name=req.getParameter("name");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	long phone=Long.parseLong(req.getParameter("phone"));
	String city=req.getParameter("city");
	Users u=new Users(name,email,password,phone,city);
	boolean isRegistered=uDao.registeruser(u);
	if(isRegistered) {
		req.getRequestDispatcher("Login.jsp").forward(req, resp);
	}else {
		req.getRequestDispatcher("Register.jsp").forward(req, resp);
	}




		//super.doPost(req, resp);
	}
}
