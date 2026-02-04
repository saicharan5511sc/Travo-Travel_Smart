package com.travoapp.model.dto;

import java.sql.Timestamp;

public class Payment {

    private int paymentId;
    private int bookingId;
    private int userId;
    private String paymentMethod;
    private double amount;
    private String paymentStatus;
    private String transactionRef;
    private Timestamp paymentTime;

    // Default constructor
    public Payment() {}

    // Full constructor (for fetching from DB)
    public Payment(int paymentId, int bookingId, int userId, String paymentMethod, double amount,
                   String paymentStatus, String transactionRef, Timestamp paymentTime) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.userId = userId;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.transactionRef = transactionRef;
        this.paymentTime = paymentTime;
    }

    // Constructor without paymentId (for insertion)
    public Payment(int bookingId, int userId, String paymentMethod, double amount,
                   String paymentStatus, String transactionRef, Timestamp paymentTime) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.transactionRef = transactionRef;
        this.paymentTime = paymentTime;
    }

    // Getters and Setters
    public int getPaymentId() { return paymentId; }
    public void setPaymentId(int paymentId) { this.paymentId = paymentId; }

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getTransactionRef() { return transactionRef; }
    public void setTransactionRef(String transactionRef) { this.transactionRef = transactionRef; }

    public Timestamp getPaymentTime() { return paymentTime; }
    public void setPaymentTime(Timestamp paymentTime) { this.paymentTime = paymentTime; }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", bookingId=" + bookingId +
                ", userId=" + userId +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", amount=" + amount +
                ", paymentStatus='" + paymentStatus + '\'' +
                ", transactionRef='" + transactionRef + '\'' +
                ", paymentTime=" + paymentTime +
                '}';
    }
}
