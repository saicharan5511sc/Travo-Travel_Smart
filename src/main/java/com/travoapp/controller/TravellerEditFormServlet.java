package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.TravellerDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TravellerEditFormServlet extends HttpServlet{
	TravellerDetailsDAO tDao=null;
	public TravellerEditFormServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int travellerIdnumber=Integer.parseInt(req.getParameter("lead_id_no"));
		TravellerDetails traveller=tDao.findTravellerById(travellerIdnumber);
		if(traveller!=null) {
			req.setAttribute("traveller", traveller);
			req.getRequestDispatcher("TravellerEditForm.jsp").forward(req, resp);
		}
		//super.doGet(req, resp);
	}
	
	

}
