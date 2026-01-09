package com.travoapp.model.dao;

import com.travoapp.model.dto.Payment;

public interface PaymentDAO {

    // Add a new payment record
    boolean addPayment(
        int bookingId,
        int userId,
        String paymentMethod,
        double amount,
        String paymentStatus,
        String transactionRef
    );

    // Fetch payment by its ID
    Payment getPaymentById(int paymentId);

    // Optional: fetch payment by booking ID
    Payment getPaymentByBookingId(int bookingId);
}
