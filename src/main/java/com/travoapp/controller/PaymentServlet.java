package com.travoapp.controller;

import java.io.IOException;
import java.util.UUID;

import com.travoapp.model.dao.BookingDAO;
import com.travoapp.model.dao.BookingDAOImpl;
import com.travoapp.model.dao.PaymentDAO;
import com.travoapp.model.dao.PaymentDAOImpl;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Users user = (Users) req.getSession().getAttribute("users");
        if (user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int bookingId = Integer.parseInt(req.getParameter("bookingId"));
        String paymentMethod = req.getParameter("paymentMethod");
        double amount = (double) req.getSession().getAttribute("totalAmount");

    	HttpSession session=req.getSession();
        int userId = user.getUserId();

        // Dummy Razorpay Transaction Reference
        String transactionRef = "RAZORPAY_" + UUID.randomUUID().toString();

        // Dummy success
        String paymentStatus = "SUCCESS";

        /* 1️⃣ Save payment */
        PaymentDAO paymentDAO = new PaymentDAOImpl();
        paymentDAO.addPayment(
                bookingId,
                userId,
                paymentMethod,
                amount,
                paymentStatus,
                transactionRef
        );

        /* 2️⃣ Update booking status */
        BookingDAO bookingDAO = new BookingDAOImpl();
        bookingDAO.updateBookingStatus(bookingId, "CONFIRMED");

        session.setAttribute("bookingId", bookingId); 
        resp.sendRedirect("BookingViewServlet?bookingId=" + bookingId);
    }
}
