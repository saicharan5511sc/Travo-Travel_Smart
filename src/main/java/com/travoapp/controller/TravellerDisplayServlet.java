package com.travoapp.controller;

import java.io.IOException;
import java.util.List;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.TravellerDetails;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/travellerDisplay")
public class TravellerDisplayServlet extends HttpServlet {
	TravellerDetailsDAO tDao=null;
	public TravellerDisplayServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	int packageId=Integer.parseInt(req.getParameter("packageId"));
	Users user = (Users) req.getSession().getAttribute("users");
	int userId = user.getUserId();
	List<TravellerDetails> tList=tDao.getTravellerDetails(userId,packageId);
		if(!tList.isEmpty()) {
			req.setAttribute("travellerlist", tList);
			req.setAttribute("packageId", packageId);
			req.getRequestDispatcher("travellerDetails.jsp").forward(req, resp);

		}

	}

}
