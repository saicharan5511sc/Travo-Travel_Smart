package com.travoapp.controller;

import com.travoapp.model.dao.AgencyDetailsDAO;
import com.travoapp.model.dao.AgencyDetailsDAOImpl;
import com.travoapp.model.dao.PackageDAO;
import com.travoapp.model.dao.PackageDAOImpl;
import com.travoapp.model.dto.AgencyDetailsDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/agencyDetails")
public class AgencyDetailsServlet extends HttpServlet {

    private AgencyDetailsDAO agencyDetailsDAO = new AgencyDetailsDAOImpl();
    private PackageDAO packageDAO= new PackageDAOImpl();
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int agencyId = Integer.parseInt(request.getParameter("agencyId"));

        AgencyDetailsDTO agency = agencyDetailsDAO.getAgencyDetails(agencyId);
        List<com.travoapp.model.dto.Package> packages = packageDAO.getPackagesByAgencyId(agencyId);

        request.setAttribute("agency", agency);
        request.setAttribute("packages", packages);
        request.getRequestDispatcher("agency-details.jsp").forward(request, response);
    }
}
