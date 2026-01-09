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

@WebServlet("/TravellerUpdateServlet")
public class TravellerUpdateServlet extends HttpServlet {

    private TravellerDetailsDAO tDao;

    public TravellerUpdateServlet() {
        tDao = new TravellerDetailsDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️⃣ Session validation (same as Add)
        Users user = (Users) req.getSession().getAttribute("users");
        if (user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        String travellerIdStr = req.getParameter("traveller_id");
        String packageIdStr   = req.getParameter("package_id");

        if (travellerIdStr == null || packageIdStr == null) {
            resp.sendRedirect("error.jsp");
            return;
        }

        int traveller_id = Integer.parseInt(travellerIdStr);
        int package_id   = Integer.parseInt(packageIdStr);
        int user_id      = user.getUserId();

       
        String fullname = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String gender = req.getParameter("gender");
        String idproof = req.getParameter("id_type");
        long idnumber = Long.parseLong(req.getParameter("id_no"));
        String medicalconditions = req.getParameter("notes");

       
        TravellerDetails traveller = new TravellerDetails();
        traveller.setTravellerId(traveller_id);
        traveller.setFullname(fullname);
        traveller.setAge(age);
        traveller.setGender(gender);
        traveller.setIdproof(idproof);
        traveller.setIdnumber(idnumber);
        traveller.setMedicalconditions(medicalconditions);
        traveller.setUserid(user_id);
        traveller.setPackageid(package_id);

        
        boolean isUpdated = tDao.updateTraveller(traveller);

        
        if (isUpdated) {
            resp.sendRedirect("travellerDisplay?packageId=" + package_id);
        } else {
            resp.sendRedirect("TravellerEditFormServlet?traveller_id="
                    + traveller_id + "&packageId=" + package_id);
        }
    }
}
