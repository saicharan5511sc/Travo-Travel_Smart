package com.travoapp.model.dto;

public class TravellerDetails {

private int travellerId;
public int getTravellerId() {
	return travellerId;
}



public void setTravellerId(int travellerId) {
	this.travellerId = travellerId;
}
private String fullname;
private int age;
private String gender;
//private String email;
//private long phone;
private String idproof;
private long idnumber;
private String medicalconditions;
private int userid;
private int packageid;
public TravellerDetails() {

}



public TravellerDetails(String fullname, int age, String gender, //String email, long phone,
		String idproof,
		long idnumber, String medicalconditions,int userid,int packageid) {
	super();
	this.fullname = fullname;
	this.age = age;
	this.gender = gender;
//	this.email = email;
//	this.phone = phone;
	this.idproof = idproof;
	this.idnumber = idnumber;
	this.medicalconditions = medicalconditions;
	this.userid=userid;
	this.packageid=packageid;
}



public int getUserid() {
	return userid;
}



public void setUserid(int userid) {
	this.userid = userid;
}



public int getPackageid() {
	return packageid;
}



public void setPackageid(int packageid) {
	this.packageid = packageid;
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
