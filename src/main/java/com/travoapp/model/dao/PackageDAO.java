package com.travoapp.model.dao;


import java.util.List;

import com.travoapp.model.dto.Package;
public interface PackageDAO {
	List<Package> findPackageList();
	 List<Package> findPopularPackages();
	 Package getPackageById(int id);
}
