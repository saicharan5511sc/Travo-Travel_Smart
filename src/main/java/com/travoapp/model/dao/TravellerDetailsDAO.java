package com.travoapp.model.dao;

import java.util.List;

import com.travoapp.model.dto.TravellerDetails;

public interface TravellerDetailsDAO {
boolean addTraveller(TravellerDetails traveller);
List<TravellerDetails> getTravellerDetails();
boolean deleteTraveller(int idnumber);
TravellerDetails findTravellerById(int idnumber);
boolean updateTraveller(TravellerDetails traveller);
}
