package com.travoapp.model.dto;

import java.util.List;

public class Package {

    private int packageId;
    private String destination;
    private String tripType;
    private double price;
    private String description;
    private String imageUrl;


    private List<String> galleryImages;
    private String duration;
    private String locationsCovered;

    private List<String> highlights;
    private List<String> inclusions;
    private List<String> exclusions;
    private List<String> itinerary;
    private List<String> hotels;

    private double gstPercentage = 5.0;
    private double serviceFee = 299.0;

    public Package(int packageId, String destination, String tripType, double price,
                   String description, String imageUrl) {

        this.packageId = packageId;
        this.destination = destination;
        this.tripType = tripType;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
    }


    public Package() {

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


	public void setPrice(double price) {
		this.price = price;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public int getPackageId() { return packageId; }
    public String getDestination() { return destination; }
    public String getTripType() { return tripType; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }
    public String getImageUrl() { return imageUrl; }



    public List<String> getGalleryImages() {
        return galleryImages;
    }

    public void setGalleryImages(List<String> galleryImages) {
        this.galleryImages = galleryImages;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLocationsCovered() {
        return locationsCovered;
    }

    public void setLocationsCovered(String locationsCovered) {
        this.locationsCovered = locationsCovered;
    }

    public List<String> getHighlights() {
        return highlights;
    }

    public void setHighlights(List<String> highlights) {
        this.highlights = highlights;
    }

    public List<String> getInclusions() {
        return inclusions;
    }

    public void setInclusions(List<String> inclusions) {
        this.inclusions = inclusions;
    }

    public List<String> getExclusions() {
        return exclusions;
    }

    public void setExclusions(List<String> exclusions) {
        this.exclusions = exclusions;
    }

    public List<String> getItinerary() {
        return itinerary;
    }

    public void setItinerary(List<String> itinerary) {
        this.itinerary = itinerary;
    }

    public List<String> getHotels() {
        return hotels;
    }

    public void setHotels(List<String> hotels) {
        this.hotels = hotels;
    }

    public double getGstPercentage() {
        return gstPercentage;
    }

    public void setGstPercentage(double gstPercentage) {
        this.gstPercentage = gstPercentage;
    }

    public double getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(double serviceFee) {
        this.serviceFee = serviceFee;
    }
}
