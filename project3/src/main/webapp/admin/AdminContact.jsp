<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Contact Messages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
