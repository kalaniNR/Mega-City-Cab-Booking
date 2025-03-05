<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration page</title>
<style>
       /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #111; /* Black background */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Container Styling */
.container {
    background-color: #222; /* Dark Gray for contrast */
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(255, 223, 0, 0.5); /* Yellow glow effect */
    width: 380px;
    text-align: center;
}

/* Headings */
h2 {
    margin-bottom: 20px;
    color: #ffcc00; /* Yellow */
}

/* Input Fields */
input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 2px solid #ffcc00; /* Yellow Border */
    border-radius: 5px;
    font-size: 16px;
    background-color: #333;
    color: white;
    outline: none;
}

input::placeholder {
    color: #bbb;
}

/* Buttons */
button {
    width: 100%;
    padding: 12px;
    background-color: #ffcc00; /* Yellow */
    color: black;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    font-weight: bold;
    margin-top: 10px;
    transition: 0.3s;
}

button:hover {
    background-color: #e6b800; /* Darker Yellow */
}

/* Links */
.links {
    margin-top: 15px;
}

.links a {
    text-decoration: none;
    color: #ffcc00;
    font-size: 14px;
}

.links a:hover {
    text-decoration: underline;
}
.links p{
color:white;
}

/* Error Message */
.error {
    color: red;
    font-size: 14px;
    margin-bottom: 10px;
}

    </style>
</head>
<body>

    <div class="container">
        <h2>Register</h2>

       
        <% String error = request.getParameter("error");
            if (error != null && error.equals("userExists")) { %>
            <p class="error">Username already exists. Try another one.</p>
        <% } %>

        <form action="${pageContext.request.contextPath}/registerServlet" method="post">
            <input type="text" id="name" name="name" placeholder="Full Name" required>
            <input type="text" id="address" name="address" placeholder="Address" required>
            <input type="text" id="contact" name="contact" placeholder="Contact Number" required pattern="\d{10}" title="Enter a valid 10-digit number">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit">Register</button>
            <button type="reset">Clear</button>
        </form>

        <div class="links">
            <p >Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>