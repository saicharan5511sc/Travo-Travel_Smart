package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.TravellerDetails;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/addtraveller")
public class TravellerAddServlet extends HttpServlet{
	TravellerDetailsDAO tDao=null;
	public TravellerAddServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		String gender=req.getParameter("gender");
		String idproof=req.getParameter("id_type");
		long idnumber= Long.parseLong(req.getParameter("id_no"));
		String medicalconditions=req.getParameter("notes");
		Users user = (Users) req.getSession().getAttribute("users");

		if (user == null) {
		    resp.sendRedirect("Login.jsp");
		    return;
		}

		int userId = user.getUserId();
		int package_id=Integer.parseInt(req.getParameter("package_id"));
		TravellerDetails traveller=new TravellerDetails(fullname,age,gender,idproof,idnumber,medicalconditions,userId,package_id);
		boolean isAdded=tDao.addTraveller(traveller);

		req.setAttribute("packageId", package_id);
		if(isAdded) {
			resp.sendRedirect("travellerDisplay?packageId=" + package_id);

		}else {

		}

	}


}
