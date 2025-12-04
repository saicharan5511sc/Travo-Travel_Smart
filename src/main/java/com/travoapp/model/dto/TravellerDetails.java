package com.travoapp.model.dto;

public class TravellerDetails {
private String fullname;
private int age;
private String gender;
//private String email;
//private long phone;
private String idproof;
private long idnumber;
private String medicalconditions;
public TravellerDetails() {
	
}



public TravellerDetails(String fullname, int age, String gender, //String email, long phone, 
		String idproof,
		long idnumber, String medicalconditions) {
	super();
	this.fullname = fullname;
	this.age = age;
	this.gender = gender;
//	this.email = email;
//	this.phone = phone;
	this.idproof = idproof;
	this.idnumber = idnumber;
	this.medicalconditions = medicalconditions;
}



public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
//public String getEmail() {
//	return email;
//}
//public void setEmail(String email) {
//	this.email = email;
//}
//public long getPhone() {
//	return phone;
//}
//public void setPhone(long phone) {
//	this.phone = phone;
//}
public String getIdproof() {
	return idproof;
}
public void setIdproof(String idproof) {
	this.idproof = idproof;
}
public long getIdnumber() {
	return idnumber;
}
public void setIdnumber(long idnumber) {
	this.idnumber = idnumber;
}
public String getMedicalconditions() {
	return medicalconditions;
}
public void setMedicalconditions(String medicalconditions) {
	this.medicalconditions = medicalconditions;
}




}
