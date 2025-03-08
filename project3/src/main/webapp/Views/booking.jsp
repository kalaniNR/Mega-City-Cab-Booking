<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.datapackage.model.Car" %>
<%@ page import="com.datapackage.dao.CarDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Booking</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/bookingstyle.css">
    <style>
    /* General Page Styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #0d0d0d;
    color: #ffffff;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}

/* Header */
header {
    text-align: center;
    padding: 20px;
    background-color: #222;
    width: 100%;
}

h1 {
    margin: 0;
    font-size: 2rem;
    color: #f4c100; /* Yellow theme */
}

/* Car Listing Container */
form {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 20px;
    max-width: 1200px;
}

/* Car Card Styling */
div {
    background-color: #1a1a1a;
    border-radius: 12px;
    padding: 15px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
    box-shadow: 0 5px 10px rgba(255, 204, 0, 0.2);
    border: 2px solid #f4c100;
    position: relative;
}

div:hover {
    transform: scale(1.05);
}

/* Car Images */
img {
    width: 100%;
    height: auto;
    border-radius: 12px;
}

/* Car Information */
p {
    margin: 10px 0;
    font-size: 1rem;
}

/* Price Styling */
p:nth-of-type(3) {
    font-weight: bold;
    font-size: 1.2rem;
    color: #f4c100;
}

/* Rent Button */
button {
    background-color: #f4c100;
    color: #000;
    border: none;
    padding: 10px 15px;
    font-size: 1rem;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
    text-transform: uppercase;
}

button:hover {
    background-color: #ffdb4d;
}

/* Icon Styling */
.icon {
    color: #f4c100;
    font-size: 1.2rem;
    margin-right: 5px;
}

/* Responsive Design */
@media (max-width: 768px) {
    form {
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    }

    h1 {
        font-size: 1.5rem;
    }
}
    
    </style>
</head>
<body>
    <header>
        <h1>Book Your Car</h1>
    </header>

    
        <%
            CarDao carDao = new CarDao();
            List<Car> carList = carDao.getAllCars(); // Fetch car list dynamically

           
        %>
        <form action="${pageContext.request.contextPath}/CartServlet" method="post">
    <% for (Car car : carList) { %>
        <div>
            <img src="${pageContext.request.contextPath}/images/<%= car.getImage() %>" alt="<%= car.getBrandName() %>">
            <p>Brand: <%= car.getBrandName() %></p>
            <p>Capacity: <%= car.getCapacity() %> persons</p>
            <p>Price: RS.<%= car.getPrice() %></p>
            <p>License Plate: <%= car.getLicensePlate() %></p>
            <button type="submit" name="carId" value="<%= car.getId() %>">Select Car</button>
        </div>
    <% } %>
</form>




   
</body>
</html>
