<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Admins</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/adminStyle.css">
    <style>
/* ===== Professional Admin Panel Design ===== */

body {
    font-family: 'Poppins', sans-serif;
    background: #063047;
    color: #333;
    margin: 0;
    padding: 20px;
    text-align: center;
}

.container {
    width: 90%;
    max-width: 800px;
    margin: 50px auto;
    padding: 25px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
}

h2, h3 {
    color: #0056b3;
    font-size: 2rem;
    margin-bottom: 10px;
}

h3 {
    color: #007bff;
    margin-top: 20px;
}

/* ===== Form Styling ===== */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    background: #f9fbff;
    border-radius: 10px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
}

form input {
    width: 60%;
    padding: 12px;
    margin: 10px 0;
    border: 2px solid #007bff;
    border-radius: 8px;
    font-size: 1rem;
    background: #ffffff;
}

form input:focus {
    outline: none;
    border-color: #0048ff;
    box-shadow: 0 0 10px rgba(0, 72, 255, 0.3);
}

button {
    background: #007bff;
    color: white;
    padding: 12px 18px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1rem;
    transition: all 0.3s ease-in-out;
    margin: 10px;
}

button:hover {
    background: #0056b3;
    transform: scale(1.1);
}

/* ===== Table Styling ===== */
table {
    width: 95%;
    margin: 25px auto;
    border-collapse: collapse;
    background: #ffffff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 15px;
    border: 1px solid #ddd;
    text-align: center;
    font-size: 1rem;
}

th {
    background: linear-gradient(45deg, #007bff, #0056b3);
    color: white;
    font-weight: bold;
}

tr:nth-child(even) {
    background: #f2f7ff;
}

/* ===== Action Buttons ===== */
.edit-btn, .delete-btn {
    padding: 10px 15px;
    margin: 5px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 1rem;
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
}

.delete-btn:hover {
    background: #c82333;
    transform: scale(1.1);
}

/* ===== Responsive Design ===== */
@media (max-width: 768px) {
    form, table {
        width: 100%;
    }
    
    th, td {
        font-size: 0.9rem;
    }

    button {
        width: 100%;
    }
}
    </style>
</head>
<body>
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
    <div class="container">
        <h2>Manage Admins</h2>

        <%-- Success or error messages --%>
        <% String successMessage = request.getParameter("success");
           String errorMessage = request.getParameter("error");
        %>
        <% if (successMessage != null) { %>
            <div class="success">✔ <%= successMessage %></div>
        <% } %>
        <% if (errorMessage != null) { %>
            <div class="error">✖ <%= errorMessage %></div>
        <% } %>

        <!-- Add Admin Form -->
        
        <form action="${pageContext.request.contextPath}/AdminManagementServlet" method="post">
            <input type="hidden" name="action" value="add">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter Admin Username" required >

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Admin Password" required>
            
            <button type="reset">Clear</button>

            <button type="submit">Add New Admin</button>
        </form>

        <!-- Admins List Table -->
        <h3>Admin List</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
            
            <% 
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project3", "root", "Kalani2003@#$");
                String sql = "SELECT * FROM admin";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/editAdmin.jsp?id=<%= rs.getInt("id") %>&username=<%= rs.getString("username") %>" class="edit-btn">✏ Edit</a>

                    <a href="${pageContext.request.contextPath}/AdminManagementServlet?action=delete&id=<%= rs.getInt("id") %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this admin?');">🗑 Delete</a>
                </td>
            </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
            %>
        </table>

        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
