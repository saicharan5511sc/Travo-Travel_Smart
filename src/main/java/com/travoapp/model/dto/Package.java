package com.travoapp.model.dto;

public class Package {
    private int packageId;
    private String destination;
    private String tripType;
    private double price;
    private String description;
    private String imageUrl;

    // Constructor
    public Package(int packageId, String destination, String tripType, double price, String description, String imageUrl) {
        this.packageId = packageId;
        this.destination = destination;
        this.tripType = tripType;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    // Getters
    public int getPackageId() { return packageId; }
    public String getDestination() { return destination; }
    public String getTripType() { return tripType; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }
    public String getImageUrl() { return imageUrl; }
}

