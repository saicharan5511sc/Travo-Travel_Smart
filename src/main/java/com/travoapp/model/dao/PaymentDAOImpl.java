package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.Payment;

public class PaymentDAOImpl implements PaymentDAO {

    @Override
    public boolean addPayment(int bookingId, int userId,
                              String paymentMethod, double amount,
                              String paymentStatus, String transactionRef) {

        String sql = """
            INSERT INTO payments
            (booking_id, user_id, payment_method, amount,
             payment_status, transaction_ref, payment_time)
            VALUES (?, ?, ?, ?, ?, ?, NOW())
        """;

        try (Connection con = ProvideConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            ps.setInt(2, userId);
            ps.setString(3, paymentMethod);
            ps.setDouble(4, amount);
            ps.setString(5, paymentStatus);
            ps.setString(6, transactionRef);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Payment getPaymentById(int paymentId) {
        String sql = "SELECT * FROM payments WHERE payment_id=?";
        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, paymentId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Payment(
                        rs.getInt("payment_id"),
                        rs.getInt("booking_id"),
                        rs.getInt("user_id"),
                        rs.getString("payment_method"),
                        rs.getDouble("amount"),
                        rs.getString("payment_status"),
                        rs.getString("transaction_ref"),
                        rs.getTimestamp("payment_time")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Optional: fetch payment by bookingId
    public Payment getPaymentByBookingId(int bookingId) {
        String sql = "SELECT * FROM payments WHERE booking_id=?";
        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Payment(
                        rs.getInt("payment_id"),
                        rs.getInt("booking_id"),
                        rs.getInt("user_id"),
                        rs.getString("payment_method"),
                        rs.getDouble("amount"),
                        rs.getString("payment_status"),
                        rs.getString("transaction_ref"),
                        rs.getTimestamp("payment_time")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
