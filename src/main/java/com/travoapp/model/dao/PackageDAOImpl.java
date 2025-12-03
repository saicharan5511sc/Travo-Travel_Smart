package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.model.dto.Package;

import com.travoapp.dbutils.ProvideConnection;
public class PackageDAOImpl implements PackageDAO {

    @Override
    public List<Package> findPackageList() {
        List<Package> packageList = new ArrayList<>();

        String sql = "SELECT * FROM packages";
        Connection conn = ProvideConnection.getConnector();

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Package pkg = new Package(
                        rs.getInt("package_id"),
                        rs.getString("destination"),
                        rs.getString("trip_type"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url")
                );

                packageList.add(pkg);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return packageList;
    }
    @Override
    public List<Package> findPopularPackages() {
        List<Package> list = new ArrayList<>();
        String sql = "SELECT * FROM packages ORDER BY price DESC LIMIT 6";

        try (Connection con = ProvideConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Package(
                    rs.getInt("package_id"),
                    rs.getString("destination"),
                    rs.getString("trip_type"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getString("image_url")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Package getPackageById(int id) {
        Package pkg = null;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = ProvideConnection.getConnector();


            String query = "SELECT * FROM packages WHERE package_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                pkg = new Package();

                pkg.setPackageId(rs.getInt("package_id"));
                pkg.setDestination(rs.getString("destination"));
                pkg.setTripType(rs.getString("trip_type"));
                pkg.setPrice(rs.getDouble("price"));
                pkg.setDescription(rs.getString("description"));
                pkg.setImageUrl(rs.getString("image_url"));
   
            }

            if (pkg != null) {
         
                pkg.setGalleryImages(fetchList(con, "SELECT image_url FROM package_images WHERE package_id=?", id));
                pkg.setHighlights(fetchList(con, "SELECT highlight_text FROM package_highlights WHERE package_id=?", id));
                pkg.setInclusions(fetchList(con, "SELECT inclusion_text FROM package_inclusions WHERE package_id=?", id));
                pkg.setExclusions(fetchList(con, "SELECT exclusion_text FROM package_exclusions WHERE package_id=?", id));
                pkg.setItinerary(fetchItinerary(con, "SELECT day_number,description FROM package_itinerary WHERE package_id=?", id));
                pkg.setHotels(fetchHotelList(con, "SELECT hotel_name,star_rating FROM package_hotels WHERE package_id=?", id));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pkg;
    }
    private List<String> fetchList(Connection con, String query, int id) throws SQLException {
        List<String> list = new ArrayList<>();

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString(1));
            }
        }

        return list;
    }
    private List<String> fetchHotelList(Connection con, String query, int id) throws SQLException {
        List<String> list = new ArrayList<>();

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String hotel = rs.getString("hotel_name") + " - " + rs.getInt("star_rating") + " Star";
            list.add(hotel);
        }

        return list;
    }
    private List<String> fetchItinerary(Connection con,String query, int id) throws SQLException {
        List<String> list = new ArrayList<>();

  
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int day = rs.getInt("day_number");
            String desc = rs.getString("description");

            list.add("Day " + day + ": " + desc);
        }

        return list;
    }

}

