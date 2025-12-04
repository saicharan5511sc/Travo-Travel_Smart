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
		String add="insert into travellerdetails (traveller_name,age,gender,id_type,medical_condition,Id_number)values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=con.prepareStatement(add);
			pstmt.setString(1, traveller.getFullname());
			pstmt.setInt(2, traveller.getAge());
			pstmt.setString(3, traveller.getGender());
			pstmt.setString(4, traveller.getIdproof());
			pstmt.setString(5, traveller.getMedicalconditions());
			pstmt.setLong(6, traveller.getIdnumber());
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
	public List<TravellerDetails> getTravellerDetails() {
		String viewTraveller="select * from travellerdetails";
		con = ProvideConnection.getConnector();
		List<TravellerDetails> travellerDetails = new ArrayList<TravellerDetails>();
		TravellerDetails traveller=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(viewTraveller);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				traveller = new TravellerDetails();
				traveller.setFullname(rs.getString("traveller_name"));
				traveller.setAge(rs.getInt("age"));
				traveller.setGender(rs.getString("gender"));
//				traveller.setEmail(rs.getString(""));
//				traveller.setPhone(rs.getLong(""));
				traveller.setIdproof(rs.getString("id_type"));
				traveller.setIdnumber(rs.getLong("Id_number"));
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
	public boolean deleteTraveller(int idnumber) {
		String deleteTraveller= "delete from travellerdetails where Id_number=?";
		con = ProvideConnection.getConnector();
		try {
			PreparedStatement pstmt=con.prepareStatement(deleteTraveller);
			pstmt.setInt(1, idnumber);
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
	public TravellerDetails findTravellerById(int idnumber) {
		String travellerById="select * from travellerdetails where Id_number=?";
		con = ProvideConnection.getConnector();
		TravellerDetails traveller=null;
		try {
			PreparedStatement pstmt=con.prepareStatement(travellerById);
			pstmt.setInt(1, idnumber);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				traveller = new TravellerDetails();
				traveller.setFullname(rs.getString("traveller_name"));
				traveller.setAge(rs.getInt("age"));
				traveller.setGender(rs.getString("gender"));
//				traveller.setEmail(rs.getString(""));
//				traveller.setPhone(rs.getLong(""));
				traveller.setIdproof(rs.getString("id_type"));
				traveller.setIdnumber(rs.getLong("Id_number"));
				traveller.setMedicalconditions(rs.getString("medical_condition"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return traveller;
	}





	@Override
	public boolean updateTraveller(TravellerDetails traveller) {
		String updatetraveller="update from travellerdetails set traveller_name=?,age=?,gender=?,id_type=?,medical_condition=? where Id_number=?";
		con = ProvideConnection.getConnector();
		try {
			PreparedStatement pstmt=con.prepareStatement(updatetraveller);
			pstmt.setString(1, traveller.getFullname());
			pstmt.setInt(2, traveller.getAge());
			pstmt.setString(3, traveller.getGender());
			pstmt.setString(4, traveller.getIdproof());
			pstmt.setString(5, traveller.getMedicalconditions());
			pstmt.setLong(6, traveller.getIdnumber());
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
	
	

}
