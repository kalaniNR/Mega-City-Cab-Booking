<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Contact Messages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
    /* admin-contact.css */

/* General Page Styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #121212;
    color: #ffffff;
    margin: 0;
    padding: 0;
}

/* Container Styling */
.container {
    max-width: 90%;
    margin: auto;
    background: #1e1e1e;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1);
}

/* Header Styling */
h2 {
    text-align: center;
    color: #00bcd4;
    font-weight: bold;
    margin-bottom: 20px;
}

/* Table Styling */
.table {
    width: 100%;
    margin-bottom: 1rem;
    border-collapse: collapse;
}

.table-dark {
    background-color: #212529;
    color: #fff;
    border-radius: 10px;
    overflow: hidden;
}

.table th, .table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #373737;
}

.table th {
    background: #00bcd4;
    color: #000;
    font-weight: bold;
    text-transform: uppercase;
}

.table tbody tr:hover {
    background-color: #2d2d2d;
    transition: 0.3s ease-in-out;
}

/* Responsive Table */
@media (max-width: 768px) {
    .table th, .table td {
        font-size: 14px;
        padding: 10px;
    }
}

/* Form Styling */
.form-control {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    color: #ffffff;
    background: #333;
    border: 2px solid #00bcd4;
    border-radius: 5px;
    outline: none;
    transition: 0.3s;
}

.form-control:focus {
    background: #444;
    border-color: #ff4081;
    box-shadow: 0px 0px 10px rgba(255, 64, 129, 0.5);
}

/* Button Styling */
.btn {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    background: #00bcd4;
    border: none;
    color: #000;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

.btn:hover {
    background: #ff4081;
    color: #fff;
    transform: scale(1.05);
}

/* Mobile Responsiveness */
@media (max-width: 600px) {
    .btn {
        font-size: 14px;
        padding: 8px;
    }

    .form-control {
        font-size: 14px;
        padding: 8px;
    }
}

/* Add Fade-in Animation */
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

/* Apply Animation */
.container {
    animation: fadeIn 0.5s ease-in-out;
}
    
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Contact Messages</h2>
        <table class="table table-dark table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Message</th>
                    <th>Reply</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection
                    String jdbcURL = "jdbc:mysql://localhost:3306/project3";
                    String dbUser = "root";
                    String dbPassword = "Kalani2003@#$";
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String sql = "SELECT * FROM contact_us";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            String phone = rs.getString("phone");
                            String message = rs.getString("message");
                            String reply = rs.getString("reply");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= phone %></td>
                    <td><%= message %></td>
                    <td><%= (reply != null) ? reply : "No reply yet" %></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/AdminContactServlet" method="post">
                            <input type="hidden" name="id" value="<%= id %>">
                            <input type="text" name="reply" class="form-control mb-2" placeholder="Enter reply" required>
                            <button type="submit" class="btn btn-primary">Send Reply</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
