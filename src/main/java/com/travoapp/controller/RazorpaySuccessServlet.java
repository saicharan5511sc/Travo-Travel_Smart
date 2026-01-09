package com.travoapp.controller;

import java.io.IOException;

import com.travoapp.model.dao.BookingDAO;
import com.travoapp.model.dao.BookingDAOImpl;
import com.travoapp.model.dao.PaymentDAO;
import com.travoapp.model.dao.PaymentDAOImpl;
import com.travoapp.model.dto.Users;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RazorpaySuccessServlet")
public class RazorpaySuccessServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("users");

        if (user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int bookingId = Integer.parseInt(req.getParameter("bookingId"));
        String razorpayPaymentId = req.getParameter("razorpay_payment_id");

        double amount = (double) session.getAttribute("totalAmount");

        PaymentDAO paymentDAO = new PaymentDAOImpl();

        paymentDAO.addPayment(
            bookingId,
            user.getUserId(),
            "RAZORPAY",
            amount,
            "SUCCESS",
            razorpayPaymentId
        );

        BookingDAO bookingDAO = new BookingDAOImpl();
        bookingDAO.updateBookingStatus(bookingId, "CONFIRMED");

        resp.sendRedirect("BookingViewServlet?bookingId=" + bookingId);
    }
}
