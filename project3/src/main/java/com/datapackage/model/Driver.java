package com.datapackage.model;

public class Driver {
	private int id;
    private String name;
    private String phone;
    private String email;
    private String licenseNumber;
    private String status;
    private String imagePath; 

    

    public Driver(int id, String name, String phone, String email, String licenseNumber, String status, String imagePath) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.licenseNumber = licenseNumber;
        this.status = status;
        this.imagePath = imagePath;
    }



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getLicenseNumber() {
		return licenseNumber;
	}



	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
    
    

	
    
    

}
