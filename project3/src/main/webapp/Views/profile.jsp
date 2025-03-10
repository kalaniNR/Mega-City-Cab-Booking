<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Fetch logged-in username from session
    String username = (String) session.getAttribute("username");
    String name = "", address = "", contact = "", password = "", profilePic = "default.jpg";
    
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/project3";
    String dbUser = "root";
    String dbPassword = "Kalani2003@#$";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Fetch user details from 'register' table
        String sql = "SELECT name, address, contact, password, profile_pic FROM register WHERE username=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            address = rs.getString("address");
            contact = rs.getString("contact");
            password = rs.getString("password");
            profilePic = rs.getString("profile_pic") != null ? rs.getString("profile_pic") : "default.jpg";
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings</title>
    <link rel="stylesheet" href="style.css">
    
    <style>
    .profile-pic-container {
    text-align: center;
    margin-bottom: 20px;
}

.profile-pic {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 3px solid #FFD700;
    object-fit: cover;
}

input[type="file"] {
    margin: 10px 0;
    color: white;
}
/* Reset and Global Styles */
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

/* Profile Section */
.profile-section {
    background: #222; /* Darker Black */
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 0px 15px rgba(255, 215, 0, 0.3);
    width: 800px;
}

/* Profile Picture */
.profile-pic-container {
    text-align: center;
    margin-bottom: 20px;
}

.profile-pic {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 4px solid #FFD700;
    object-fit: cover;
    transition: transform 0.3s ease-in-out;
}

.profile-pic:hover {
    transform: scale(1.1);
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

input {
    padding: 12px;
    border: 2px solid #FFD700;
    background: #333;
    color: #FFD700;
    border-radius: 5px;
    font-size: 16px;
}

input::placeholder {
    color: #ccc;
}

/* File Input */
input[type="file"] {
    background: transparent;
    color: white;
    border: none;
}

/* Submit Button */
.btn {
    background: #FFD700;
    color: #111;
    border: none;
    padding: 12px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

.btn:hover {
    background: #FFA500; /* Orange Tint */
    transform: scale(1.05);
}
.back-link {
   position: absolute;
    left: 20px;
    font-size: 1rem;
    font-weight: bold;
    color: #FFD700;
    text-decoration: none;
   
}

.back-link:hover {
    color: #FFC107;
    text-decoration: underline;
}

    
    </style>
    
</head>
<body>


<section class="profile-section">
    <h2>My Profile</h2>
    <a href="home.jsp" class="back-link" onclick="goBack()">⋘ </a>

<script>
    function goBack() {
        if (window.history.length > 1) {
            window.history.back();
        } else {
            window.location.href = "home.jsp"; 
        }
    }
</script>

    <div class="profile-pic-container">
        <img src="<%= request.getContextPath() %>/images/<%= profilePic %>" alt="Profile Picture" class="profile-pic">

    </div>

    <form action="${pageContext.request.contextPath}/ProfileUpdateServlet" method="post" enctype="multipart/form-data">
        <input type="text" name="name" value="<%= name %>" placeholder="Full Name" required>
        <input type="text" name="address" value="<%= address %>" placeholder="Address" required>
        <input type="text" name="contact" value="<%= contact %>" placeholder="Phone Number" required>
        <input type="text" name="username" value="<%= username %>" readonly>

        <input type="password" name="newPassword" placeholder="New Password (Leave empty to keep current)">
        
        <!-- File Upload for Profile Picture -->
        <input type="file" name="profilePic" accept="images/*">

        <button type="submit" class="btn">Update Profile</button>
    </form>
</section>


</body>
</html>
