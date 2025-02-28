<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
	width: 350px;
	text-align: center;
	animation: fadeIn 0.8s ease-in-out;
}

h2 {
	margin-bottom: 20px;
	color: #333;
}

/* Input Fields */
.input-group {
	position: relative;
	margin-bottom: 15px;
	display: flex;
	align-items: center;
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 5px;
}

.input-group i {
	color: #007bff;
	padding: 10px;
}

.input-group input {
	width: 100%;
	border: none;
	outline: none;
	padding: 10px;
	font-size: 16px;
}

/* Button */
button {
	width: 100%;
	padding: 12px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	background-color: #0056b3;
}

/* Links */
.links {
	margin-top: 15px;
}

.links a {
	text-decoration: none;
	color: #007bff;
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

/* Animations */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>

	<div class="container">
		<h2>Login</h2>

		<form action="${pageContext.request.contextPath}/loginServlet" method="post">

			<div class="input-group">
				<i>&#128100;</i>
				<!-- User Icon -->
				<input type="text" id="uname" name="username" placeholder="Username"
					required>
			</div>

			<div class="input-group">
				<i>&#128274;</i>
				<!-- Lock Icon -->
				<input type="password" id="password" name="password"
					placeholder="Password" required>
			</div>

			<a href="Views/home.jsp">
				<button type="submit">Login</button>
			</a>

		</form>

		<div class="links">
			<p>
				Not registered yet? <a href="Register.jsp">Register here</a>
			</p>
		</div>
	</div>




</body>
</html>
