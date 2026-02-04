package com.travoapp.model.dao;

import com.travoapp.model.dto.AgencyDetailsDTO;

public interface AgencyDetailsDAO {
    AgencyDetailsDTO getAgencyDetails(int agencyId);
}
