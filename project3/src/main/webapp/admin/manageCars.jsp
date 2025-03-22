<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.datapackage.dao.CarDao"%>
<%@ page import="com.datapackage.model.Car"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Cars</title>
<link rel="stylesheet" href="styles.css">
<style>
/* ===== General Styles ===== */
body {
	font-family: 'Poppins', sans-serif;
	background: #063047;
	color: #333;
	margin: 0;
	padding: 20px;
	text-align: center;
}

/* ===== Header Styles ===== */
h2 {
	color: white;
	font-size: 2rem;
	margin-bottom: 10px;
}

h3 {
	color: white;
	margin-top: 20px;
}

/* ===== Form Styling ===== */
form input {
	width: 50%;
	padding: 12px;
	margin: 10px 0;
	border: 2px solid #007bff;
	border-radius: 5px;
	font-size: 1rem;
	background: #ffffff;
	border-radius: 10px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
	text-align: left;
}

form input:focus {
	outline: none;
	border-color: #0048ff;
	box-shadow: 0 0 5px rgba(0, 72, 255, 0.3);
}

button {
	background: #007bff;
	color: white;
	padding: 7px 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1rem;
	transition: background 0.3s;
	display: inline-block;
}

button:hover {
	background: #0056b3;
	transform: scale(1.05);
}

/* ===== Table Styling ===== */
table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
	background: #ffffff;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: center;
	font-size: 1rem;
}

th {
	background: linear-gradient(45deg, #007bff, #0048ff);
	color: white;
	font-weight: bold;
}

tr:nth-child(even) {
	background: #f2f7ff;
}

/* ===== Image Styling ===== */
img {
	border-radius: 8px;
	transition: transform 0.3s ease-in-out;
	width: 100px;
	height: 60px;
}

img:hover {
	transform: scale(1.1);
}

/* ===== Action Buttons ===== */
.edit-btn, .delete-btn {
	display: inline-block;
	padding: 8px 12px;
	margin: 5px;
	border-radius: 5px;
	text-decoration: none;
	font-size: 0.9rem;
	font-weight: bold;
	transition: all 0.3s;
}

.edit-btn {
	background: #28a745;
	color: white;
}

.edit-btn:hover {
	background: #218838;
}

.delete-btn {
	background: #dc3545;
	color: white;
	border: none;
}

.delete-btn:hover {
	background: #c82333;
	transform: scale(1.05);
}

/* ===== Responsive Design ===== */
@media ( max-width : 768px) {
	form, table {
		width: 100%;
	}
	th, td {
		font-size: 0.9rem;
	}
	button {
		width: 100%;
		margin-top: 10px;
	}
	
}
.back-link {
    display: flex;
    text-decoration: none;
    font-size: 24px;
    color: #00bcd4;
    margin-bottom: 10px;
    transition: 0.3s ease-in-out;
}

.back-link:hover {
    color: #ff4081;
    transform: scale(1.1);
}
</style>
</head>
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
<body>
            
	<h2>Manage Cars</h2>
	
	<form action="${pageContext.request.contextPath}/CarManagementServlet"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="action" value="add"> <input
			type="text" name="brandName" placeholder="Brand Name" required>
		<input type="number" name="capacity" placeholder="Capacity" required>
		<input type="text" name="price" placeholder="Price" required>
		<input type="text" name="licensePlate" placeholder="License Plate"
			required> <input type="file" name="imageFile"
			accept="images/*" required>
		<button type="submit">Add Car</button>
		<button type="reset">Clear</button>
	</form>

	<h3>Car List</h3>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Brand</th>
			<th>Capacity</th>
			<th>Price</th>
			<th>License Plate</th>
			<th>Image</th>
			<th>Actions</th>
		</tr>
		<%
		CarDao carDao = new CarDao();
		List<Car> carList = carDao.getAllCars();
		for (Car car : carList) {
		%>
		<tr>
			<td><%=car.getId()%></td>
			<td><%=car.getBrandName()%></td>
			<td><%=car.getCapacity()%></td>
			<td><%=car.getPrice()%></td>
			<td><%=car.getLicensePlate()%></td>
			<td><img
				src="${pageContext.request.contextPath}/images/<%= car.getImage() %>"
				width="100" height="60"
				onerror="this.onerror=null; this.src='default.jpg';"></td>
			<td>
			<a href="${pageContext.request.contextPath}/admin/editCar.jsp?id=<%= car.getId() %>
&brandName=<%= car.getBrandName() %>
&capacity=<%= car.getCapacity() %>
&price=<%= car.getPrice() %>
&licensePlate=<%= car.getLicensePlate() %>
&image=<%= car.getImage()%>" 
class="edit-btn">✏ Edit</a>

				<form
					action="${pageContext.request.contextPath}/CarManagementServlet"
					method="post" class="d-inline">
					<input type="hidden" name="action" value="delete"> <input
						type="hidden" name="id" value="<%=car.getId()%>">
					<button type="submit" class="btn btn-danger btn-sm"
						onclick="return confirm('Are you sure?')">🗑 Delete</button>
				</form></td>
		</tr>
		<%
		}
		%>
	</table>
	
</body>
</html>
