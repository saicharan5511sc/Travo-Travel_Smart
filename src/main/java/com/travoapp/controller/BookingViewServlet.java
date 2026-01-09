package com.travoapp.controller;

import java.io.IOException;
import java.util.List;

import com.travoapp.model.dao.BookingDAO;
import com.travoapp.model.dao.BookingDAOImpl;
import com.travoapp.model.dao.PaymentDAO;
import com.travoapp.model.dao.PaymentDAOImpl;
import com.travoapp.model.dao.TravellerDetailsDAO;
import com.travoapp.model.dao.TravellerDetailsDAOImpl;
import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Payment;
import com.travoapp.model.dto.TravellerDetails;
import com.travoapp.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookingViewServlet")
public class BookingViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bookingId = Integer.parseInt(req.getParameter("bookingId"));
        Users user = (Users) req.getSession().getAttribute("users");
        
        if(user == null || bookingId == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        // Fetch booking details
        BookingDAO bookingDAO = new BookingDAOImpl();
        Booking booking = bookingDAO.getBookingById(bookingId);

        // Fetch traveller details
        TravellerDetailsDAO tDao = new TravellerDetailsDAOImpl();
        List<TravellerDetails> travellers = tDao.getTravellerDetails(user.getUserId(), booking.getPackageId());

        // Fetch payment details
        PaymentDAO paymentDAO = new PaymentDAOImpl();
       Payment payment = paymentDAO.getPaymentByBookingId(bookingId);

        req.setAttribute("booking", booking);
        req.setAttribute("travellers", travellers);
        req.setAttribute("payment", payment);

        req.getRequestDispatcher("booking.jsp").forward(req, resp);
    }
}
