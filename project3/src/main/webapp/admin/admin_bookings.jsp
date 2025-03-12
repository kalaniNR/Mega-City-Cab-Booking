<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom Styles -->
    <style>
       /* admin-bookings.css */

/* Global Styles */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #0a192f;
    color: #ffffff;
    margin: 0;
    padding: 0;
}

/* Container Styling */
.container {
    max-width: 95%;
    margin: auto;
    background: #1e1e2f;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1);
    margin-top: 20px;
}

/* Header */
h2 {
    text-align: center;
    color: #00bcd4;
    font-weight: bold;
    margin-bottom: 20px;
}

/* Back Link */
.back-link {
    display: inline-block;
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

/* Table Styling */
.table {
    width: 100%;
    border-collapse: collapse;
    background: #2d2d3f;
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background: #007bff;
    color: #ffffff;
}

.table th, .table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #3a3a3a;
}

.table tbody tr:hover {
    background-color: #3a3a4f;
    transition: 0.3s ease-in-out;
}

/* Buttons */
.btn-confirm {
    background-color: #28a745;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.btn-cancel {
    background-color: #dc3545;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.btn-confirm:hover {
    background-color: #218838;
    transform: scale(1.05);
}

.btn-cancel:hover {
    background-color: #c82333;
    transform: scale(1.05);
}

/* Responsive Table */
@media (max-width: 768px) {
    .table th, .table td {
        font-size: 14px;
        padding: 10px;
    }
}

/* Animations */
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

.container {
    animation: fadeIn 0.5s ease-in-out;
}

    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Customer Bookings</h2>
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
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Amount Paid</th>
                    <th>Created At</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String JDBC_URL = "jdbc:mysql://localhost:3306/project3";
                    String JDBC_USER = "root";
                    String JDBC_PASS = "Kalani2003@#$";

                    try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                         PreparedStatement pstmt = conn.prepareStatement("SELECT id, customer_name, email, phone, from_location, to_location, amount_paid, created_at, status FROM bookings");
                         ResultSet rs = pstmt.executeQuery()) {

                        while (rs.next()) {
                            int bookingId = rs.getInt("id");
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= bookingId %></td>
                    <td><%= rs.getString("customer_name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("from_location") %></td>
                    <td><%= rs.getString("to_location") %></td>
                    <td>RS.<%= rs.getDouble("amount_paid") %></td>
                    <td><%= rs.getTimestamp("created_at") %></td>
                    <td><strong><%= status %></strong></td>
                    <td>
    <% 
        if ("PENDING".equals(status)) { 
    %>
        <form method="post" action="${pageContext.request.contextPath}/UpdateBookingStatusServlet">
            <input type="hidden" name="booking_id" value="<%= bookingId %>">
            <button type="submit" name="status" value="CONFIRMED" class="btn btn-success btn-sm">Confirm</button>
            <button type="submit" name="status" value="CANCELLED" class="btn btn-danger btn-sm">Cancel</button>
        </form>
    <% 
        } else { 
    %>
        <strong><%= status %></strong>
    <% 
        } 
    %>
</td>

                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='10' class='text-danger'>Error loading data. Please try again.</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
