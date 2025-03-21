<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Summary</title>
    <style>
/* Reset and Global Styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

/* Body Styling */
body {
    background-color: #111; /* Deep Black */
    color: #FFD700; /* Gold */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

/* Container */
.container {
    background: #222; /* Darker Black */
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 0px 20px rgba(255, 215, 0, 0.5);
    width: 600px;
    animation: fadeIn 0.6s ease-in-out;
}

/* Header */
h2, h3 {
    color: #FFD700;
    border-bottom: 2px solid #FFD700;
    padding-bottom: 8px;
    margin-bottom: 15px;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 16px;
}

/* Table Headers */
th {
    background-color: #FFD700;
    color: #111;
    padding: 12px;
    text-align: left;
    font-weight: bold;
}

/* Table Rows */
td {
    padding: 12px;
    border-bottom: 1px solid #444;
    color: white;
}

/* Alternating Row Colors */
tr:nth-child(even) {
    background-color: #333;
}

/* Hover Effect */
tr:hover {
    background-color: #444;
    transition: 0.3s ease-in-out;
}

/* Error Message */
.error {
    color: red;
    font-weight: bold;
    margin-top: 10px;
}

/* Button Styling */
button {
    background: #FFD700;
    color: #111;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
    margin-top: 15px;
    width: 100%;
}

button:hover {
    background: #FFA500;
    transform: scale(1.05);
}

/* Fade-in Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 600px) {
    .container {
        width: 90%;
        padding: 20px;
    }

    table {
        font-size: 14px;
    }

    button {
        width: 100%;
    }
}


    </style>
</head>
<body>

    <div class="container">
    <h2>Booking Summary</h2>
    <table>
        <tr>
            <th>Detail</th>
            <th>Information</th>
        </tr>
        <tr>
            <td>Name</td>
            <td><%= session.getAttribute("name") != null ? session.getAttribute("name") : "N/A" %></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= session.getAttribute("email") != null ? session.getAttribute("email") : "N/A" %></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "N/A" %></td>
        </tr>
        <tr>
            <td>From</td>
            <td><%= session.getAttribute("fromLocation") != null ? session.getAttribute("fromLocation") : "N/A" %></td>
        </tr>
        <tr>
            <td>To</td>
            <td><%= session.getAttribute("toLocation") != null ? session.getAttribute("toLocation") : "N/A" %></td>
        </tr>
        <tr>
            <td>Date & Time</td>
            <td><%= session.getAttribute("datetime") != null ? session.getAttribute("datetime") : "N/A" %></td>
        </tr>
    </table>

    <h3>Selected Car</h3>
    <table>
        <tr>
            <th>Detail</th>
            <th>Information</th>
        </tr>
        <%
            Car car = (Car) session.getAttribute("selectedCar");
            if (car != null) {
        %>
            <tr>
                <td>Brand</td>
                <td><%= car.getBrandName() %></td>
            </tr>
            <tr>
                <td>Capacity</td>
                <td><%= car.getCapacity() %> persons</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>RS. <%= car.getPrice() %></td>
            </tr>
            <tr>
                <td>License Plate</td>
                <td><%= car.getLicensePlate() %></td>
            </tr>
        <%
            } else {
        %>
            <tr>
                <td colspan="2" class="error">No car selected. Please go back and choose a car.</td>
            </tr>
        <%
            }
        %>
    </table>
<%
    double totalAmount = car.getPrice(); 
    session.setAttribute("totalAmount", totalAmount);
%>

    <a href="payment.jsp"><button>Go To Payment</button></a>
</div>

</body>
</html>
