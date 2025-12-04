package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TravellerDeleteServlet extends HttpServlet {
	TravellerDetailsDAO tDao=null;
	public TravellerDeleteServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int travellerIdnumber=Integer.parseInt(req.getParameter("lead_id_no"));
		boolean isdeleted=tDao.deleteTraveller(travellerIdnumber);
		if(isdeleted) {
			resp.sendRedirect("");
		}
		//super.doGet(req, resp);
	}
}
