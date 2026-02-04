package com.travoapp.model.dao;

import java.util.List;

import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Package;

public interface BookingDAO {
	 List<Booking> findUpcomingTripsByUser(int userId);
	    List<Booking> findRecentBookingsByUser(int userId);

	    int countUpcomingTrips(int userId);
	    int countCompletedTrips(int userId);
	    int countTotalBookings(int userId);


	    List<Package> getPopularDestinations();
	    List<Booking> getRecommendedTrips(int userId);

	    List<String> getOffers();
	    boolean createBooking(Booking booking);
	    int getTravellerCount(int userId, int packageId);
	    public void updateBookingStatus(int bookingId, String status);
	    public Booking getBookingById(int bookingId);
}
