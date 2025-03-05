<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Get admin ID and username from request parameters
    String adminId = request.getParameter("id");
    String currentUsername = request.getParameter("username");

    if (adminId == null || currentUsername == null) {
        response.sendRedirect("manageAdmins.jsp?error=Invalid Admin ID");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/adminStyle.css">
    <style>
       

body {
    font-family: 'Poppins', sans-serif;
    background:#063047;
    color: #333;
    margin: 0;
    padding: 20px;
    text-align: center;
}

.container {
    width: 90%;
    max-width: 500px;
    margin: 50px auto;
    padding: 25px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
}

h2 {
    color: #0056b3;
    font-size: 2rem;
    margin-bottom: 10px;
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
    width: 80%;
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

.cancel {
    background-color: #cc0000;
    text-decoration: none;
    padding: 12px 18px;
    color: white;
    border-radius: 8px;
    margin-top: 10px;
    display: inline-block;
    transition: all 0.3s ease-in-out;
}

.cancel:hover {
    background: #ff0000;
    transform: scale(1.1);
}

/* ===== Responsive Design ===== */
@media (max-width: 768px) {
    form, .container {
        width: 100%;
    }
    
    h2 {
        font-size: 1.5rem;
    }

    button, .cancel {
        width: 100%;
    }
}

    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Admin</h2>
        

        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
        %>

        <form action="${pageContext.request.contextPath}/AdminManagementServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= id %>">

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= username %>" required>

            <label for="password">New Password (Leave empty to keep the current password):</label>
            <input type="password" id="password" name="password" placeholder="Enter new password">

            <button type="submit">Update Admin</button>
            
        </form>
        <a href="manageAdmins.jsp">Cancel</a>
    </div>
</body>
</html>