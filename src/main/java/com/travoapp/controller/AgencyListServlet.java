package com.travoapp.controller;

import java.io.IOException;
import java.util.List;

import com.travoapp.model.dao.AgencyDAO;
import com.travoapp.model.dao.AgencyDAOImpl;
import com.travoapp.model.dto.Agencies;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agencies")
public class AgencyListServlet extends HttpServlet {

    private AgencyDAO agencyDAO = new AgencyDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Agencies> agencyList = agencyDAO.getAllAgencies();

        request.setAttribute("agencies", agencyList);
        request.getRequestDispatcher("agencies.jsp").forward(request, response);
    }
}
