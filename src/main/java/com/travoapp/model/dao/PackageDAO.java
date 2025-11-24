package com.travoapp.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.travoapp.model.dto.Package;
public interface PackageDAO {
	List<Package> findPackageList();
}
