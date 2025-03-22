<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Fetch logged-in username from session
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String name = "", contact = "", profilePic = "default.jpg";
    int unreadMessages = 0;
    
    String jdbcURL = "jdbc:mysql://localhost:3306/project3";
    String dbUser = "root";
    String dbPassword = "Kalani2003@#$";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT name, contact, profile_pic FROM register WHERE username=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            name = rs.getString("name");
            contact = rs.getString("contact");
            profilePic = rs.getString("profile_pic") != null ? rs.getString("profile_pic") : "default.jpg";
        }

        sql = "SELECT COUNT(*) AS unreadMessages FROM messages WHERE recipient=? AND status='unread'";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            unreadMessages = rs.getInt("unreadMessages");
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
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: yellow;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background: #222;
            height: 100vh;
            padding: 20px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            color: yellow;
            text-decoration: none;
            margin-bottom: 10px;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        .profile-section {
            background: #333;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
        }
        .btn {
            background: yellow;
            color: black;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Dashboard</h2>
        <a href="profile.jsp">Update profile</a>
        <a href="messages.jsp">Message box</a>
        
        
        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    </div>
    <div class="main-content">
        <div class="profile-section">
            <div>
            <img src="<%= request.getContextPath() %>/images/<%= profilePic %>" alt="Profile Picture" class="profile-pic">
               
                <h3><%= name %></h3>
                <p><%= contact %></p>
            </div>
            <div>
                <button class="btn" onclick="window.location.href='profile.jsp'">Update Profile</button>
                <button class="btn" onclick="window.location.href='messages.jsp'">Messages (<%= unreadMessages %>)</button>
                <button class="btn" onclick="window.location.href='home.jsp'">Back</button> 
            </div>
        </div>
    </div>
</body>
</html>
