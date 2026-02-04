package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.TravellerDetails;

public class TravellerDetailsDAOImpl implements TravellerDetailsDAO {
	Connection con=null;
	@Override
	public boolean addTraveller(TravellerDetails traveller) {
		con = ProvideConnection.getConnector();
		String add="insert into travellerdetails (user_id ,package_id,traveller_name,age,gender,id_type,Id_number,medical_condition)values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=con.prepareStatement(add);
			pstmt.setInt(1, traveller.getUserid());
			pstmt.setInt(2, traveller.getPackageid());
			pstmt.setString(3, traveller.getFullname());
			pstmt.setInt(4, traveller.getAge());
			pstmt.setString(5, traveller.getGender());
			pstmt.setString(6, traveller.getIdproof());
			pstmt.setLong(7	, traveller.getIdnumber());
			pstmt.setString(8, traveller.getMedicalconditions());
			int count=pstmt.executeUpdate();
			if(count>0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}





	@Override
	public List<TravellerDetails> getTravellerDetails(int user_id,int package_id) {
		String viewTraveller="select * from travellerdetails where user_id=? AND package_id=?";
		con = ProvideConnection.getConnector();
		List<TravellerDetails> travellerDetails = new ArrayList<>();
		TravellerDetails traveller=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(viewTraveller);
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, package_id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				traveller = new TravellerDetails();
				traveller.setTravellerId(rs.getInt("traveller_id"));
				traveller.setFullname(rs.getString("traveller_name"));
				traveller.setAge(rs.getInt("age"));
				traveller.setGender(rs.getString("gender"));
				traveller.setIdproof(rs.getString("id_type"));
				traveller.setIdnumber(rs.getLong("id_number"));
				traveller.setMedicalconditions(rs.getString("medical_condition"));
				travellerDetails.add(traveller);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return travellerDetails;
	}
	@Override
	public boolean deleteTraveller(int travellerId, int package_id) {
		String deleteTraveller= "delete from travellerdetails where traveller_id=? And package_id=?";
		con = ProvideConnection.getConnector();
		try {
			PreparedStatement pstmt=con.prepareStatement(deleteTraveller);
			pstmt.setInt(1, travellerId);
			pstmt.setInt(2, package_id);
			int count=pstmt.executeUpdate();
			if(count>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}




	@Override
	public TravellerDetails findTravellerById(int traveller_id, int user_id, int package_id) {

	    String sql = "SELECT * FROM travellerdetails WHERE traveller_id=? AND user_id=? AND package_id=?";
	    con = ProvideConnection.getConnector();

	    TravellerDetails traveller = null;

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, traveller_id);
	        pstmt.setInt(2, user_id);
	        pstmt.setInt(3, package_id);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            traveller = new TravellerDetails();
	            traveller.setTravellerId(rs.getInt("traveller_id"));
	            traveller.setFullname(rs.getString("traveller_name"));
	            traveller.setAge(rs.getInt("age"));
	            traveller.setGender(rs.getString("gender"));
	            traveller.setIdproof(rs.getString("id_type"));
	            traveller.setIdnumber(rs.getLong("id_number"));
	            traveller.setMedicalconditions(rs.getString("medical_condition"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return traveller;
	}





	@Override
	public boolean updateTraveller(TravellerDetails traveller) {
	    String sql = "UPDATE travellerdetails SET traveller_name=?, age=?, gender=?, id_type=?, id_number=?, medical_condition=? "
	               + "WHERE traveller_id=? AND user_id=? AND package_id=?";

	    con = ProvideConnection.getConnector();

	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {

	        pstmt.setString(1, traveller.getFullname());
	        pstmt.setInt(2, traveller.getAge());
	        pstmt.setString(3, traveller.getGender());
	        pstmt.setString(4, traveller.getIdproof());
	        pstmt.setLong(5, traveller.getIdnumber());
	        pstmt.setString(6, traveller.getMedicalconditions());

	        pstmt.setInt(7, traveller.getTravellerId());   // PK
	        pstmt.setInt(8, traveller.getUserid());        // session user
	        pstmt.setInt(9, traveller.getPackageid());     // package context

	        int count = pstmt.executeUpdate();
	        return count > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}


}
