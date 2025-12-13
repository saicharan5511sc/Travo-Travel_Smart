package com.travoapp.model.dao;

import java.util.List;

import com.travoapp.model.dto.TravellerDetails;

public interface TravellerDetailsDAO {
boolean addTraveller(TravellerDetails traveller);
List<TravellerDetails> getTravellerDetails(int user_id,int package_id);
boolean deleteTraveller(int traveller_id,int package_id);
TravellerDetails findTravellerById(int traveller_id, int user_id, int package_id);
boolean updateTraveller(TravellerDetails traveller);
}
