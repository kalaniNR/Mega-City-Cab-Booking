<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="Css/adminStyle.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f0f8ff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 255, 0.2);
    text-align: center;
    width: 300px;
}

h2 {
    color: #003366;
}

label {
    display: block;
    margin: 10px 0 5px;
    color: #003366;
    font-weight: bold;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 8px;
    margin: 5px 0 10px;
    border: 1px solid #003366;
    border-radius: 5px;
}

button {
    background-color: #003366;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    margin-top: 10px;
}

button:hover {
    background-color: #0055cc;
}

p {
    margin-top: 10px;
}
    </style>
 
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            
            <a href="adminDashboard.jsp">
				<button type="submit">Login</button>
			</a>
			<button type="reset">Clear</button>
            
        </form>
        
        <%-- Display error message if login fails --%>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if (errorMessage != null) { %>
            <p style="color: red;"><%= errorMessage %></p>
        <% } %>
    </div>
</body>
</html>