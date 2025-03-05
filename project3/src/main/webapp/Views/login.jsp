<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
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

/* Login Container */
.container {
    background: #222; /* Darker Black */
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 20px rgba(255, 215, 0, 0.5);
    width: 350px;
    animation: fadeIn 0.6s ease-in-out;
}

/* Login Header */
h2 {
    color: #FFD700;
    border-bottom: 2px solid #FFD700;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* Input Fields */
.input-group {
    position: relative;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    background: #333;
    border: 2px solid #FFD700;
    border-radius: 6px;
    padding: 5px;
}

.input-group i {
    color: #FFD700;
    padding: 10px;
    font-size: 18px;
}

.input-group input {
    width: 100%;
    border: none;
    outline: none;
    background: none;
    color: #FFD700;
    padding: 10px;
    font-size: 16px;
}

.input-group input::placeholder {
    color: #bbb;
}

/* Button */
button {
    width: 100%;
    padding: 12px;
    background-color: #FFD700;
    color: #111;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

button:hover {
    background-color: #FFA500;
    transform: scale(1.05);
}

/* Links */
.links {
    margin-top: 15px;
}

.links a {
    text-decoration: none;
    color: #FFD700;
    font-size: 14px;
}

.links a:hover {
    text-decoration: underline;
}

/* Error Message */
.error {
    color: red;
    font-size: 14px;
    margin-bottom: 10px;
}

/* Fade-in Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 500px) {
    .container {
        width: 90%;
        padding: 20px;
    }

    button {
        width: 100%;
    }
}

</style>
</head>
<body>

<% 
  
    String savedUsername = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("savedUsername".equals(cookie.getName())) {
                savedUsername = cookie.getValue();
                break;
            }
        }
    }

    
    String error = request.getParameter("error");
%>

	<div class="container">
		<h2>Login</h2>

		<% if ("invalid".equals(error)) { %>
		    <p class="error">Invalid username or password. Try again.</p>
		<% } %>

		<form action="${pageContext.request.contextPath}/loginServlet" method="post">

			<div class="input-group">
				<i style="font-size:24px;color:white" class="fa fa-user">&#128100;</i>
				<input type="text" id="uname" name="username" placeholder="Username" value="<%= savedUsername %>" required>
			</div>

			<div class="input-group">
				<i>&#128274;</i>
				<input type="password" id="password" name="password" placeholder="Password" required>
			</div>

			<label>
				<input type="checkbox" name="rememberMe" <%= savedUsername.isEmpty() ? "" : "checked" %>> Remember Me
			</label>
			
			<button type="submit">Login</button>

		</form>

		<div class="links">
			<p>Not registered yet? <a href="Register.jsp">Register here</a></p>
		</div>
	</div>

</body>
</html>
