package com.travoapp.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.model.dao.PackageDAO;
import com.travoapp.model.dao.PackageDAOImpl;
import com.travoapp.model.dto.Package;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/packages")
public class PackageListServlet extends HttpServlet {
	PackageDAO dao;
public PackageListServlet() {
	dao=new PackageDAOImpl();
	
}
 
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	List<Package> packageList = dao.findPackageList();
    	request.setAttribute("packageList", packageList);


  
        RequestDispatcher dispatcher = request.getRequestDispatcher("PackageList.jsp");
        dispatcher.forward(request, response);
    
    }
}

