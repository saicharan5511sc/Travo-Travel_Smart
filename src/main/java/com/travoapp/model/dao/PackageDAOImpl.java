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
}

