package com.travoapp.controller;

import java.io.IOException;
import java.sql.Date;

import com.travoapp.model.dao.BookingDAO;
import com.travoapp.model.dao.BookingDAOImpl;
import com.travoapp.model.dao.PackageDAO;
import com.travoapp.model.dao.PackageDAOImpl;
import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Package;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private BookingDAO bookingDAO;
    private PackageDAO packageDAO;

    @Override
    public void init() {
        bookingDAO = new BookingDAOImpl();
        packageDAO = new PackageDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Users user = (Users) session.getAttribute("users");
        if (user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int userId = user.getUserId();
        int packageId = Integer.parseInt(req.getParameter("packageId"));
        String travelDateStr = req.getParameter("travelDate");

        if (travelDateStr == null || travelDateStr.isEmpty()) {
            resp.sendRedirect("error.jsp");
            return;
        }

        Date travelDate = Date.valueOf(travelDateStr);

        // Fetch package
        Package pkg = packageDAO.getPackageById(packageId);
        if (pkg == null) {
            resp.sendRedirect("error.jsp");
            return;
        }

        // Total price = price * number of travellers
        int travellerCount = bookingDAO.getTravellerCount(userId, packageId);
        double totalPrice = pkg.getPrice() * travellerCount;

        Booking booking = new Booking();
        booking.setUserId(userId);
        booking.setPackageId(packageId);
        booking.setTripType(pkg.getTripType());
        booking.setStatus("pending");
        booking.setDestination(pkg.getDestination());
        booking.setBookingDate(new Date(System.currentTimeMillis()));
        booking.setTravelDate(travelDate);
        booking.setAmount(totalPrice);
        booking.setImageUrl(pkg.getImageUrl());

        boolean isBooked = bookingDAO.createBooking(booking);

        if (isBooked) {
            // Save booking info for payment step
            session.setAttribute("bookingId", booking.getBookingId());
            session.setAttribute("totalAmount", totalPrice);

            resp.sendRedirect("payment.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }
    }
}
