package com.travoapp.controller;

import java.io.IOException;
import java.util.List;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.TravellerDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("travellerDisplay")
public class TravellerDisplayServlet extends HttpServlet {
	TravellerDetailsDAO tDao=null;
	public TravellerDisplayServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<TravellerDetails> tList=tDao.getTravellerDetails();
		if(!tList.isEmpty()) {
			req.setAttribute("travellerlist", tList);
			req.getRequestDispatcher("travellerDetails.jsp")
			.forward(req, resp);
			
		}
		//super.doGet(req, resp);
	}

}
