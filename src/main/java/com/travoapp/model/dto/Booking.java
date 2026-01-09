package com.travoapp.model.dto;

import java.sql.Date;

public class Booking {

    private int bookingId;
    private int userId;
    private int packageId;

    private String destination;
    private String tripType;

    private Date bookingDate;
    private Date travelDate;
    private String status;

    private double amount;

    private String imageUrl;

    public Booking() {}

    public Booking(int bookingId, int userId, int packageId, String destination, String tripType,
                   Date bookingDate, Date travelDate, String status, double amount, String imageUrl) {

        this.bookingId = bookingId;
        this.userId = userId;
        this.packageId = packageId;
        this.destination = destination;
        this.tripType = tripType;
        this.bookingDate = bookingDate;
        this.travelDate = travelDate;
        this.status = status;
        this.amount = amount;
        this.imageUrl = imageUrl;
    }


    public int getBookingId() {
        return bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public int getPackageId() {
        return packageId;
    }

    public String getDestination() {
        return destination;
    }

    public String getTripType() {
        return tripType;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public Date getTravelDate() {
        return travelDate;
    }

    public String getStatus() {
        return status;
    }

    public double getAmount() {
        return amount;
    }

    public String getImageUrl() {
        return imageUrl;
    }


    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setTripType(String tripType) {
        this.tripType = tripType;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
