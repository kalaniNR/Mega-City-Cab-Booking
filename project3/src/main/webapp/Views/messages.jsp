<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("Views/login.jsp");
        return;
    }

    String jdbcURL = "jdbc:mysql://localhost:3306/project3";
    String dbUser = "root";
    String dbPassword = "Kalani2003@#$";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String errorMessage = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Messages</title>
    <link rel="stylesheet" href="style.css">

    <style>
       /* Global Styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #000;
    color: #FFD700;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    padding: 20px;
    font-size: 2rem;
    color: #FFD700;
    border-bottom: 2px solid #FFD700;
}

/* Message Container */
.message-container {
    width: 60%;
    margin: 30px auto;
    padding: 20px;
    background-color: #111;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(255, 215, 0, 0.5);
}

.message {
    padding: 15px;
    margin: 10px 0;
    border-radius: 5px;
    box-shadow: 0px 0px 5px rgba(255, 215, 0, 0.3);
    transition: all 0.3s ease;
}

.unread {
    background-color: #FFD700;
    color: #000;
    font-weight: bold;
}

.read {
    background-color: #222;
    color: #FFD700;
}

/* Back Link */
.back-link {
    display: block;
    text-align: center;
    margin: 20px auto;
    padding: 10px 20px;
    width: fit-content;
    background-color: #FFD700;
    color: #000;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: 0.3s;
}

.back-link:hover {
    background-color: #FFC107;
    box-shadow: 0px 0px 5px rgba(255, 215, 0, 0.8);
}

/* Error Message */
.error-message {
    text-align: center;
    color: red;
    font-size: 1.1rem;
    font-weight: bold;
}

/* Responsive Design */
@media (max-width: 768px) {
    .message-container {
        width: 90%;
    }
}
    </style>
</head>
<body>

<h2>My Messages</h2>
<a href="dashboard.jsp" class="back-link" onclick="goBack()">⋘ Back to Profile</a>

<% if (!errorMessage.isEmpty()) { %>
    <div class="error-message"><%= errorMessage %></div>
<% } %>

<div class="message-container">
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // SQL query to fetch messages where the email matches the logged-in user
        String sql = "SELECT name, email, phone, department, message, reply FROM contact_us WHERE email = ? ORDER BY id DESC";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username); // Use the email of the logged-in user
        rs = stmt.executeQuery();

        while (rs.next()) {
            String sender = rs.getString("name"); // Name of the person who sent the message
            String message = rs.getString("message");
            String reply = rs.getString("reply");
%>
            <div class="message <%= reply == null || reply.isEmpty() ? "unread" : "read" %>">
                <strong>From: <%= sender %></strong><br>
                <strong>Message:</strong> <%= message %><br>
                <% if (reply != null && !reply.isEmpty()) { %>
                    <strong>Reply:</strong> <%= reply %>
                <% } else { %>
                    <em>No reply yet.</em>
                <% } %>
            </div>
<%      }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "Error loading messages. Please try again later.";
    }
%>
</div>

<script>
    function goBack() {
        if (window.history.length > 1) {
            window.history.back();
        } else {
            window.location.href = "Views/profile.jsp";
        }
    }
</script>

</body>
</html>
