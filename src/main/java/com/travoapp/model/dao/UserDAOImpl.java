package com.travoapp.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.travoapp.dbutils.ProvideConnection;
import com.travoapp.model.dto.Users;

public class UserDAOImpl implements UserDAO{
Connection con=null;
@Override
	public boolean registeruser(Users u) {
		con=ProvideConnection.getConnector();
		String register= "insert into users (name, email, password, phone, city) values (?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt=con.prepareStatement(register);
			
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setLong(4, u.getPhone());
			pstmt.setString(5, u.getCity());
			
			
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
public Users loginUser(String email, String password) {
	String login = "select * from users where email=? and password=? ";
	con = ProvideConnection.getConnector();
	Users u=null;
	try {
		PreparedStatement pstmt=con.prepareStatement(login);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs=pstmt.executeQuery();
		if (rs.next()) {
			u=new Users();
			u.setUserId(rs.getInt("user_id"));
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			u.setPhone(rs.getLong("phone"));
			u.setCity(rs.getString("city"));
			
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return u;
}
@Override
public Users findUserById(int id) {
	
	return null;
}





}
