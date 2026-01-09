package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.AgencyDetailsDTO;
import com.travoapp.model.dto.ReviewDTO;


public class AgencyDetailsDAOImpl implements AgencyDetailsDAO {

    @Override
    public AgencyDetailsDTO getAgencyDetails(int agencyId) {
        AgencyDetailsDTO agency = null;

        String agencyQuery = "SELECT a.agency_id, a.agency_name, a.description, " +
                "c.city, c.phone, c.email, img_banner.image_url as banner_url, img_logo.image_url as logo_url, " +
                "r.avg_rating, r.total_reviews " +
                "FROM agencies a " +
                "LEFT JOIN agency_contacts c ON a.agency_id = c.agency_id " +
                "LEFT JOIN agency_images img_logo ON a.agency_id = img_logo.agency_id AND img_logo.image_role='LOGO' AND img_logo.is_primary=TRUE " +
                "LEFT JOIN agency_images img_banner ON a.agency_id = img_banner.agency_id AND img_banner.image_role='BANNER' " +
                "LEFT JOIN agency_rating_summary r ON a.agency_id = r.agency_id " +
                "WHERE a.agency_id=?";

        String reviewsQuery = "SELECT u.name,ar.user_id, ar.rating, ar.comment , ar.created_at " +
                "FROM agency_reviews ar " +
                "JOIN users u ON ar.user_id = u.user_id " +
                "WHERE ar.agency_id=?";
        
        String packagesQuery =
                "SELECT package_id, destination, trip_type, price, description, image_url " +
                "FROM packages WHERE agency_id=?";


        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement psAgency = conn.prepareStatement(agencyQuery);
             PreparedStatement psReviews = conn.prepareStatement(reviewsQuery);
        PreparedStatement psPackages = conn.prepareStatement(packagesQuery)){

            psAgency.setInt(1, agencyId);
            ResultSet rsAgency = psAgency.executeQuery();

            if (rsAgency.next()) {
                agency = new AgencyDetailsDTO();
                agency.setAgencyId(rsAgency.getInt("agency_id"));
                agency.setAgencyName(rsAgency.getString("agency_name"));
                agency.setDescription(rsAgency.getString("description"));
                agency.setCity(rsAgency.getString("city"));
                agency.setPhone(rsAgency.getString("phone"));
                agency.setEmail(rsAgency.getString("email"));
                agency.setLogoUrl(rsAgency.getString("logo_url"));
                agency.setBannerUrl(rsAgency.getString("banner_url"));
                agency.setAvgRating(rsAgency.getDouble("avg_rating"));
                agency.setTotalReviews(rsAgency.getInt("total_reviews"));
            }

       
            if (agency != null) {
                psReviews.setInt(1, agencyId);
                ResultSet rsReviews = psReviews.executeQuery();

                List<ReviewDTO> reviews = new ArrayList<>();
                while (rsReviews.next()) {
                    ReviewDTO review = new ReviewDTO();
                    review.setUserId(rsReviews.getInt("user_id")); 
                    review.setRating(rsReviews.getInt("rating"));
                    review.setComment(rsReviews.getString("comment"));
                    review.setCreatedAt(rsReviews.getTimestamp("created_at")); 
                    reviews.add(review);
                }

                agency.setReviews(reviews);
            }
            if (agency != null) {

                psPackages.setInt(1, agencyId);
                ResultSet rsPackages = psPackages.executeQuery();

                List<com.travoapp.model.dto.Package> packages = new ArrayList<>();

                while (rsPackages.next()) {
                    com.travoapp.model.dto.Package pkg =
                            new com.travoapp.model.dto.Package();

                    pkg.setPackageId(rsPackages.getInt("package_id"));
                    pkg.setDestination(rsPackages.getString("destination"));
                    pkg.setTripType(rsPackages.getString("trip_type"));
                    pkg.setPrice(rsPackages.getDouble("price"));
                    pkg.setDescription(rsPackages.getString("description"));
                    pkg.setImageUrl(rsPackages.getString("image_url"));

                    packages.add(pkg);
                }

                agency.setPackages(packages);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return agency;
    }
}
