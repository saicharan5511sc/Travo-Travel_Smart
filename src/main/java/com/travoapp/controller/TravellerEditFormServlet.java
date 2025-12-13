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

@WebServlet("/TravellerEditForm")
public class TravellerEditFormServlet extends HttpServlet {

    private TravellerDetailsDAO tDao;

    public TravellerEditFormServlet() {
        tDao = new TravellerDetailsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️⃣ Read request parameters safely
        String travellerIdStr = req.getParameter("traveller_id");
        String packageIdStr   = req.getParameter("package_id");

        Users user = (Users) req.getSession().getAttribute("users");

        if (travellerIdStr == null || packageIdStr == null || user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int travellerId = Integer.parseInt(travellerIdStr);
        int packageId   = Integer.parseInt(packageIdStr);
        int userId     = user.getUserId();

        TravellerDetails traveller =
                tDao.findTravellerById(travellerId, userId, packageId);

        if (traveller != null) {
            req.setAttribute("traveller", traveller);
            req.setAttribute("packageId", packageId);
            req.getRequestDispatcher("TravellerEditForm.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("travellerDisplay?packageId=" + packageId);
        }
    }
}
