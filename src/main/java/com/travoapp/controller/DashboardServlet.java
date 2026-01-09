package com.travoapp.controller;

import java.io.IOException;
import java.util.List;

import com.travoapp.model.dao.BookingDAO;
import com.travoapp.model.dao.BookingDAOImpl;
import com.travoapp.model.dao.PackageDAO;
import com.travoapp.model.dao.PackageDAOImpl;
import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Package;
import com.travoapp.model.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private BookingDAO bookingDAO;
    private PackageDAO packageDAO;
//    private UserDAO userDAO;

    public DashboardServlet() {
        bookingDAO = new BookingDAOImpl();
        packageDAO = new PackageDAOImpl();
//        userDAO=new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Users user = (Users) session.getAttribute("users");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();


        List<Booking> upcomingTrips = bookingDAO.findUpcomingTripsByUser(userId);
        List<Booking> recentBookings = bookingDAO.findRecentBookingsByUser(userId);

        int upcomingCount = bookingDAO.countUpcomingTrips(userId);
        int completedCount = bookingDAO.countCompletedTrips(userId);
        int totalBookingsCount = bookingDAO.countTotalBookings(userId);

        List<Package> popularDestinations = bookingDAO.getPopularDestinations();
        List<Booking> recommendedTrips = bookingDAO.getRecommendedTrips(userId);

        List<String> offers = bookingDAO.getOffers();


        List<Package> allPackages = packageDAO.findPackageList();



        request.setAttribute("upcomingTrips", upcomingTrips);
        request.setAttribute("recentBookings", recentBookings);

        request.setAttribute("statUpcoming", upcomingCount);
        request.setAttribute("statCompleted", completedCount);
        request.setAttribute("statTotal", totalBookingsCount);

        request.setAttribute("popularDestinations", popularDestinations);
        request.setAttribute("recommendedTrips", recommendedTrips);

        request.setAttribute("offers", offers);

        request.setAttribute("allPackages", allPackages);


        RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
