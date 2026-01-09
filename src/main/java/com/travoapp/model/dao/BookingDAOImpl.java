package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.Booking;
import com.travoapp.model.dto.Package;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public List<Booking> findUpcomingTripsByUser(int userId) {
        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            WHERE b.user_id=? AND b.travel_date > NOW()
            ORDER BY b.travel_date ASC
        """;
        return fetchBookings(userId, sql);
    }

    @Override
    public List<Booking> findRecentBookingsByUser(int userId) {
        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            WHERE b.user_id=?
            ORDER BY b.booking_id DESC LIMIT 5
        """;
        return fetchBookings(userId, sql);
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
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
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
        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            ORDER BY RAND() LIMIT 3
        """;
        return fetchBookings(0, sql); // userId not used in query, pass 0
    }

    @Override
    public List<String> getOffers() {
        List<String> offers = new ArrayList<>();
        offers.add("🔥 Flat 30% OFF on Family Packages!");
        offers.add("✨ Solo Traveler Discount: Save 20%");
        offers.add("🏝 Maldives from ₹20,999 – Limited Time");
        offers.add("🚞 Kashmir Winter Trip: Buy 1 Get 1 FREE");
        offers.add("🌍 Adventure Trips – 15% OFF this week");
        return offers;
    }

    @Override
    public boolean createBooking(Booking booking) {
        String sql = """
            INSERT INTO bookings
            (user_id, package_id, trip_type, status, destination,
             booking_date, travel_date, price, image_url)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection con = ProvideConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getPackageId());
            ps.setString(3, booking.getTripType());
            ps.setString(4, booking.getStatus());
            ps.setString(5, booking.getDestination());
            ps.setDate(6, booking.getBookingDate());
            ps.setDate(7, booking.getTravelDate());
            ps.setDouble(8, booking.getAmount());
            ps.setString(9, booking.getImageUrl());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) booking.setBookingId(rs.getInt(1));
                }
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int getTravellerCount(int userId, int packageId) {
        String sql = "SELECT COUNT(*) FROM travellerdetails WHERE user_id=? AND package_id=?";
        try (Connection con = ProvideConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, packageId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status=? WHERE booking_id=?";
        try (Connection con = ProvideConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, bookingId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ----------------- HELPER -----------------
    private List<Booking> fetchBookings(int userId, String sql) {
        List<Booking> list = new ArrayList<>();
        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (userId > 0) ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractBooking(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private Booking extractBooking(ResultSet rs) throws Exception {
        return new Booking(
                rs.getInt("booking_id"),
                rs.getInt("user_id"),
                rs.getInt("package_id"),
                rs.getString("destination"),
                rs.getString("trip_type"),
                rs.getDate("booking_date"),
                rs.getDate("travel_date"),
                rs.getString("status"),
                rs.getDouble("price"),
                rs.getString("image_url")
        );
    }
    @Override
    public Booking getBookingById(int bookingId) {
        String sql = """
            SELECT b.*, p.destination, p.trip_type, p.image_url, p.price
            FROM bookings b
            JOIN packages p ON b.package_id = p.package_id
            WHERE b.booking_id=?
        """;

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractBooking(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}
