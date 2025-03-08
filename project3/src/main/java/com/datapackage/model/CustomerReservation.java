package com.datapackage.model;

public class CustomerReservation {
	
	 private int id;
	    private String name;
	    private String email;
	    private String phone;
	    private String fromLocation;
	    private String toLocation;
	    private String datetime;
	    private String status;
	    private int driverId; // To store assigned driver ID

	    // Constructors
	    public CustomerReservation() {}

	    public CustomerReservation(int id, String name, String email, String phone, String fromLocation, 
	                       String toLocation, String datetime, String status, int driverId) {
	        this.id = id;
	        this.name = name;
	        this.email = email;
	        this.phone = phone;
	        this.fromLocation = fromLocation;
	        this.toLocation = toLocation;
	        this.datetime = datetime;
	        this.status = status;
	        this.driverId = driverId;
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

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getFromLocation() {
			return fromLocation;
		}

		public void setFromLocation(String fromLocation) {
			this.fromLocation = fromLocation;
		}

		public String getToLocation() {
			return toLocation;
		}

		public void setToLocation(String toLocation) {
			this.toLocation = toLocation;
		}

		public String getDatetime() {
			return datetime;
		}

		public void setDatetime(String datetime) {
			this.datetime = datetime;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public int getDriverId() {
			return driverId;
		}

		public void setDriverId(int driverId) {
			this.driverId = driverId;
		}
    
		// ToString Method
	    @Override
	    public String toString() {
	        return "Reservation [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone 
	                + ", fromLocation=" + fromLocation + ", toLocation=" + toLocation 
	                + ", datetime=" + datetime + ", status=" + status + ", driverId=" + driverId + "]";
	    }
    

}
