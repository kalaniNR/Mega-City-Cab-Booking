<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>Edit Car</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Css/adminStyle.css">
    <style>
    /* ===== Professional Edit Car Page Styling ===== */

body {
    font-family: 'Poppins', sans-serif;
    background: #063047;
    color: #333;
    margin: 0;
    padding: 20px;
    text-align: center;
}

.container {
    width: 100%;
    max-width: 700px;
    margin: 50px auto;
    padding: 25px;
    background: #a3dbf0;
    border-radius: 12px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
}

h2 {
    color: #0056b3;
    font-size: 2rem;
    margin-bottom: 20px;
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
    margin-top: 15px;
}

button:hover {
    background: #0056b3;
    transform: scale(1.1);
}

/* ===== Image Preview Styling ===== */
img {
    border-radius: 8px;
    margin-top: 10px;
    width: 150px;
    height: auto;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

img:hover {
    transform: scale(1.1);
}

/* ===== Back Link Styling ===== */
a {
    display: block;
    margin-top: 15px;
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
}

a:hover {
    color: #0056b3;
}

/* ===== Responsive Design ===== */
@media (max-width: 768px) {
    form {
        width: 100%;
    }
    
    form input {
        width: 90%;
    }
    
    button {
        width: 90%;
    }
}
    
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Car</h2>

        <% 
            int id = Integer.parseInt(request.getParameter("id"));
            String brandName = request.getParameter("brandName");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String licensePlate = request.getParameter("licensePlate");
            String existingImage = request.getParameter("image");
        %>

        <form action="${pageContext.request.contextPath}/CarManagementServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="hidden" name="existingImage" value="<%= existingImage %>">

            <label for="brandName">Brand Name:</label>
            <input type="text" id="brandName" name="brandName" value="<%= brandName %>" required>

            <label for="capacity">Capacity:</label>
            <input type="number" id="capacity" name="capacity" value="<%= capacity %>" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value="<%= price %>" required>

            <label for="licensePlate">License Plate:</label>
            <input type="text" id="licensePlate" name="licensePlate" value="<%= licensePlate %>" required>

            <label for="imageFile">Upload New Image (Optional):</label>
            <input type="file" id="imageFile" name="imageFile">

            <% if (existingImage != null && !existingImage.isEmpty()) { %>
                <p>Current Image:</p>
                <img src="${pageContext.request.contextPath}/images/<%= existingImage %>" alt="Car Image" width="200">
            <% } %>

            <button type="submit">Update Car</button>
            <a href="manageCars.jsp">Cancel</a>
        </form>
    </div>
</body>
</html>
