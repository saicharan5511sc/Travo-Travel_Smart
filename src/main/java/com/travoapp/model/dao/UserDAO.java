package com.travoapp.model.dao;



import com.travoapp.model.dto.Users;

public interface UserDAO {
boolean registeruser(Users u);
Users loginUser(String email,String password);
Users findUserById(int id);
}
