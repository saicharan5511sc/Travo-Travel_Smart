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
            String image=request.getParameter("packageimg");
            System.out.println(idParam);
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("error.jsp");
                return;
            }

            int packageId = Integer.parseInt(idParam);

            Package pkg = packageDAO.getPackageById(packageId);
            request.setAttribute("errorMessage", "Package not found.");
            if (pkg == null) {
                response.sendRedirect("error.jsp");
                return;
            }


            request.setAttribute("package", pkg);
            request.setAttribute("packageImg", image);


            request.getRequestDispatcher("bookPackage.jsp?id="+packageId).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
