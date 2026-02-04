package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletetraveller")
public class TravellerDeleteServlet extends HttpServlet {
	TravellerDetailsDAO tDao=null;
	public TravellerDeleteServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int traveller_id=Integer.parseInt(req.getParameter("traveller_id"));
		int package_id=Integer.parseInt(req.getParameter("package_id"));
		Users user = (Users) req.getSession().getAttribute("users");
		boolean isdeleted=tDao.deleteTraveller(traveller_id,package_id);
		int userId = user.getUserId();
		req.setAttribute("packageId", package_id);
		if(isdeleted) {
			 resp.sendRedirect("travellerDisplay?packageId=" + package_id);
		}
		//super.doGet(req, resp);
	}
}
