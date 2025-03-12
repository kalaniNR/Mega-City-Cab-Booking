<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.DriverManager"%>
<%@ page import="java.util.List"%>
<%@ page import="com.datapackage.dao.DriverDao"%>
<%@ page import="db.DatabaseConnection"%>
<%@ page import="com.datapackage.model.Driver"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Drivers</title>
<link rel="stylesheet" href="css/style.css">
<style>
/* Global Styles */
body {
	font-family: Arial, sans-serif;
	background-color: #063047;
	color: #333;
	margin: 0;
	padding: 90px;
	text-align: center;
}

h2, h3 {
	color: white;
	font-family: times-new-roman;
}

/* Form Styles */
form {
	border-radius: 8px;
	color: white;
	max-width: 500px;
	margin: 20px auto;
}

label {
	display: block;
	margin: 10px 0 5px;
	font-weight: bold;
}

input, select, button {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	background: #0073e6;
	color: #fff;
	border: none;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.3s;
}

button:hover {
	background: #005bb5;
}

/* Table Styles */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background: white;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #0073e6;
	color: white;
	font-size: 18px;
}

td img {
	border-radius: 5px;
	max-width: 100px;
	height: auto;
}

.editbutton {
	background: #0073e6;
	color: #fff;
	border: none;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.3s;
}

.deletebutton {
	background: #0073e6;
	color: #fff;
	border: none;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.3s;
}

/* Edit Modal */
#editModal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: black;
	padding: 80px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	z-index: 1000;
	width: 400px;
}

#editModal h3 {
	color: dark-blue;
}

#editModal button {
	width: auto;
	display: inline-block;
	margin-top: 10px;
}

/* Responsive Design */
@media ( max-width : 600px) {
	form, table {
		width: 100%;
	}
}

.alert {
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    text-align: center;
    font-weight: bold;
}
.alert-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}
.alert-danger {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

</style>

</head>
<body>
<% 
    String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType");
    if (message != null) { 
%>
    <div class="alert <%= "success".equals(messageType) ? "alert-success" : "alert-danger" %>">
        <%= message %>
    </div>
    <% 
        session.removeAttribute("message"); 
        session.removeAttribute("messageType"); 
    %>
<% } %>

            <a href="adminDashboard.jsp" class="back-link" onclick="goBack()">⋘ </a>

<script>
    function goBack() {
        if (window.history.length > 1) {
            window.history.back();
        } else {
            window.location.href = "adminDashboard.jsp"; 
        }
    }
</script>
	<h2>Manage Drivers</h2>
	<form action="${pageContext.request.contextPath}/DriverServlet"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="action" value="add"> <label>Name:</label>
		<input type="text" name="name" required> <label>Phone:</label>
		<input type="text" name="phone" required> <label>Email:</label>
		<input type="email" name="email" required> <label>License:</label>
		<input type="text" name="licenseNumber" required> <label>Driver
			Image:</label> <input type="file" name="imagePath" accept="image/*" required>
		<button type="submit">Add Driver</button>
		<a  href="adminDashboard.jsp">Back to Dashboard</a>
	</form>

	<hr>

	<!-- Display All Drivers -->
	<h3>Driver List</h3>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Phone</th>
			<th>Email</th>
			<th>License</th>
			<th>Status</th>
			<th>Image</th>
			<th>Actions</th>
		</tr>
		<%
		Connection con = DatabaseConnection.getConnection();
		DriverDao driverDao = new DriverDao(con);
		List<Driver> drivers = driverDao.getAllDrivers();
		for (Driver driver : drivers) {
		%>
		<tr>
			<td><%=driver.getId()%></td>
			<td><%=driver.getName()%></td>
			<td><%=driver.getPhone()%></td>
			<td><%=driver.getEmail()%></td>
			<td><%=driver.getLicenseNumber()%></td>
			<td><%=driver.getStatus()%></td>
			<td>
    <% if (driver.getImagePath() != null && !driver.getImagePath().isEmpty()) { %>
        <img src="<%= request.getContextPath() + "/" + driver.getImagePath() %>" width="100">
    <% } else { %>
        No Image
    <% } %>
</td>

			<td>
    <form action="${pageContext.request.contextPath}/DriverServlet" method="post" style="display:inline;">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="<%= driver.getId() %>">
        <button type="submit" class="deletebutton" onclick="return confirmDelete();">Delete</button>
    </form>

    <button class="editbutton"
    onclick="editDriver('<%= driver.getId() %>', '<%= driver.getName() %>', 
                        '<%= driver.getPhone() %>', '<%= driver.getEmail() %>', 
                        '<%= driver.getLicenseNumber() %>', '<%= driver.getStatus() %>', 
                        '<%= request.getContextPath() + "/" + driver.getImagePath() %>')">
    Edit
</button>
</td>

		</tr>
		<%
		}
		%>
	</table>
	

	<!-- Update Driver Modal -->
<div id="editModal" style="display:none;">
    <h3>Edit Driver</h3>
    <form action="${pageContext.request.contextPath}/DriverServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" id="editId">
        
        <label>Name:</label>
        <input type="text" name="name" id="editName" required>

        <label>Phone:</label>
        <input type="text" name="phone" id="editPhone" required>

        <label>Email:</label>
        <input type="email" name="email" id="editEmail" required>

        <label>License:</label>
        <input type="text" name="licenseNumber" id="editLicense" required>

        <label>Status:</label>
        <select name="status" id="editStatus">
            <option value="Available">Available</option>
            <option value="Assigned">Assigned</option>
        </select>

        <label>Current Image:</label>
        <img id="currentImage" width="100">
        <input type="hidden" name="existingImage" id="existingImage">

        <label>New Image (Optional):</label>
        <input type="file" name="imagePath" accept="image/*">

        <button type="submit">Update Driver</button>
        <button type="button" onclick="manageDrivers.jsp">Cancel</button>
    </form>
</div>




	<script>
	function editDriver(id, name, phone, email, license, status, imagePath) {
	    document.getElementById("editId").value = id;
	    document.getElementById("editName").value = name;
	    document.getElementById("editPhone").value = phone;
	    document.getElementById("editEmail").value = email;
	    document.getElementById("editLicense").value = license;
	    document.getElementById("editStatus").value = status;
	    
	    // Ensure the existing image is retained when no new image is uploaded
	    document.getElementById("existingImage").value = imagePath;
	    
	    // Update the current image preview properly
	    if (imagePath && imagePath !== "No Image") {
	        document.getElementById("currentImage").src = imagePath;
	        document.getElementById("currentImage").style.display = "block";
	    } else {
	        document.getElementById("currentImage").style.display = "none"; // Hide image if not available
	    }
	    
	    document.getElementById("editModal").style.display = "block";
	}


		
		function confirmDelete() {
		    return confirm("Are you sure you want to delete this driver?");
		}

	</script>
</body>
</html>