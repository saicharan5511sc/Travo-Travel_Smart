package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.TravellerDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TravellerUpdateServlet extends HttpServlet {
	TravellerDetailsDAO tDao=null;
	public TravellerUpdateServlet() {
		tDao=new TravellerDetailsDAOImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullname=req.getParameter("lead_name");
		int age=Integer.parseInt(req.getParameter("lead_age"));
		String gender=req.getParameter("lead_gender");
		String idproof=req.getParameter("lead_id_type");
		long idnumber= Long.parseLong(req.getParameter("lead_id_no"));
		String medicalconditions=req.getParameter("lead_notes");
		TravellerDetails traveller=new TravellerDetails(fullname,age,gender,idproof,idnumber,medicalconditions);
		boolean isupdated=tDao.updateTraveller(traveller);
		if(isupdated) {
			resp.sendRedirect("");
	
	}
		//super.doPost(req, resp);
	}
	
	
	
}
