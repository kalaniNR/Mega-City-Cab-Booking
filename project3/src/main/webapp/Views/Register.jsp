<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration page</title>
<style>
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
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #218838;
        }
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
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>