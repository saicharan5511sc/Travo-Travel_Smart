package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Package;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public List<Booking> findUpcomingTripsByUser(int userId) {
        List<Booking> list = new ArrayList<>();

        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            WHERE b.user_id=? AND b.travel_date > NOW()
            ORDER BY b.travel_date ASC
        """;

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
				list.add(extractBooking(rs));
			}

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    @Override
    public List<Booking> findRecentBookingsByUser(int userId) {
        List<Booking> list = new ArrayList<>();

        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            WHERE b.user_id=?
            ORDER BY b.booking_id DESC LIMIT 5
        """;

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
				list.add(extractBooking(rs));
			}

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }


    @Override
    public int countUpcomingTrips(int userId) {
        return getCount("SELECT COUNT(*) FROM bookings WHERE user_id=? AND travel_date > NOW()", userId);
    }

    @Override
    public int countCompletedTrips(int userId) {
        return getCount("SELECT COUNT(*) FROM bookings WHERE user_id=? AND status='completed'", userId);
    }

    @Override
    public int countTotalBookings(int userId) {
        return getCount("SELECT COUNT(*) FROM bookings WHERE user_id=?", userId);
    }

    private int getCount(String sql, int userId) {
        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
				return rs.getInt(1);
			}

        } catch (Exception e) { e.printStackTrace(); }

        return 0;
    }


    @Override
    public List<Package> getPopularDestinations() {
        List<Package> list = new ArrayList<>();

        String sql = "SELECT package_id, destination, image_url FROM packages ORDER BY RAND() LIMIT 6";

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
               Package pkg = new Package();

                pkg.setPackageId(rs.getInt("package_id"));
                pkg.setDestination(rs.getString("destination"));
                pkg.setImageUrl(rs.getString("image_url"));

                list.add(pkg);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }



    @Override
    public List<Booking> getRecommendedTrips(int userId) {
        List<Booking> list = new ArrayList<>();

        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            ORDER BY RAND() LIMIT 3
        """;

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
				list.add(extractBooking(rs));
			}

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }


    @Override
    public List<String> getOffers() {
        return Arrays.asList(
                "🔥 Flat 30% OFF on Family Packages!",
                "✨ Solo Traveler Discount: Save 20%",
                "🏝 Maldives from ₹20,999 – Limited Time",
                "🚞 Kashmir Winter Trip: Buy 1 Get 1 FREE",
                "🌍 Adventure Trips – 15% OFF this week"
        );
    }


    private Booking extractBooking(ResultSet rs) throws Exception {
        return new Booking(
                rs.getInt("booking_id"),
                rs.getInt("user_id"),
                rs.getInt("package_id"),
                rs.getString("destination"),
                rs.getString("trip_type"),
                rs.getString("booking_date"),
                rs.getString("travel_date"),
                rs.getString("status"),
                rs.getDouble("price"),
                rs.getString("image_url")
        );
    }
}
