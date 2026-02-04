package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.PackageDAO;
import com.travoapp.model.dao.PackageDAOImpl;
import com.travoapp.model.dto.Package;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/packageDetails")
public class PackageDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PackageDAO packageDAO;

    @Override
    public void init() {
        packageDAO = new PackageDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idParam = request.getParameter("packageId");
            HttpSession session=request.getSession();

            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("error.jsp");
                return;
            }

            int packageId = Integer.parseInt(idParam);

            Package pkg = packageDAO.getPackageById(packageId);
            

            if (pkg == null) {
                request.setAttribute("errorMessage", "Package not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

         
            request.setAttribute("package", pkg);
            session.setAttribute("packageId", packageId);


            request.getRequestDispatcher("bookPackage.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
