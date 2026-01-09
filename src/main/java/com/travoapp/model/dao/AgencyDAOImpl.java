package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.model.dto.Agencies;

import com.travoapp.dbutils.*;

public class AgencyDAOImpl implements AgencyDAO {

    private static final String GET_ALL_AGENCIES = 
        "SELECT a.agency_id, a.agency_name, a.description, " +
        "c.city, img.image_url, r.avg_rating, r.total_reviews " +
        "FROM agencies a " +
        "LEFT JOIN agency_contacts c ON a.agency_id = c.agency_id " +
        "LEFT JOIN agency_images img ON a.agency_id = img.agency_id " +
        "AND img.image_role = 'LOGO' AND img.is_primary = TRUE " +
        "LEFT JOIN agency_rating_summary r ON a.agency_id = r.agency_id " +
        "WHERE a.status = 'ACTIVE'";

    @Override
    public List<Agencies> getAllAgencies() {

        List<Agencies> agencies = new ArrayList<>();

        try (Connection conn = ProvideConnection.getConnector();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_AGENCIES);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Agencies agency = new Agencies();

                agency.setAgencyId(rs.getInt("agency_id"));
                agency.setAgencyName(rs.getString("agency_name"));
                agency.setDescription(rs.getString("description"));
                agency.setCity(rs.getString("city"));
                agency.setLogoUrl(rs.getString("image_url"));
                agency.setAvgRating(rs.getDouble("avg_rating"));
                agency.setTotalReviews(rs.getInt("total_reviews"));

                agencies.add(agency);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return agencies;
    }
}
