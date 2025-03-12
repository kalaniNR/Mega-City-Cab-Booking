<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="style.css"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
      <style>
    /* General Styling */
body {
    background-color: #121212;
    color: #FFD700;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 80px;
    text-align: center;
}
/* Header */
.sticky-header {
    background: #000; /* Black header */
    color: #ffcc00; /* Yellow text */
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
}

.sticky-header .logo {
    font-size: 24px;
    font-weight: bold;
    color: #ffcc00;
}

.sticky-header nav ul {
    list-style: none;
    display: flex;
}

.sticky-header nav ul li {
    margin-left: 20px;
}

.sticky-header nav ul li a {
    color: #ffcc00;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s ease;
}

.sticky-header nav ul li a:hover {
    color: white;
}

/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.back-link {
   position: absolute;
    left: 20px;
    font-size: 1rem;
    font-weight: bold;
    color: #FFD700;
    text-decoration: none;
   
}

.back-link:hover {
    color: #FFC107;
    text-decoration: underline;
}


/* Heading */
h2 {
    color: #FFD700;
    font-size: 2rem;
    margin-top: 20px;
    text-transform: uppercase;
}

.container {
    max-width: 90%;
}

.col-md-6 {
    padding: 20px;
}

/* Align text and add shadow */
h5 {
    color: #FFD700;
    font-size: 1.5rem;
    text-transform: uppercase;
    text-shadow: 2px 2px 5px rgba(255, 215, 0, 0.5);
}

/* Add spacing between form and contact details */
.col-md-6:nth-child(2) {
    background-color: #1E1E1E;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(255, 215, 0, 0.5);
}

/* Center the iframe map */
.ratio iframe {
    border-radius: 10px;
    border: 2px solid #FFD700;
}

/* Input Fields */
input, select, textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    background: #222;
    border: 1px solid #FFD700;
    color: white;
    border-radius: 5px;
    font-size: 1rem;
}

/* Placeholder Styling */
input::placeholder, textarea::placeholder {
    color: rgba(255, 215, 0, 0.7);
}

/* Submit Button */
button {
    background-color: #FFD700;
    color: black;
    border: none;
    padding: 12px 20px;
    font-size: 1rem;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

button:hover {
    background-color: #FFC107;
}

/* Success & Error Messages */
.alert {
    width: 50%;
    margin: auto;
    padding: 15px;
    border-radius: 5px;
    font-weight: bold;
    margin-bottom: 20px;
}

.alert-success {
    background-color: #28a745;
    color: white;
}

.alert-danger {
    background-color: #dc3545;
    color: white;
}

/* Contact Info Section */
.col-md-6 {
    background-color: #1E1E1E;
    padding: 20px;
    border-radius: 10px;
    width: 50%;
   
    box-shadow: 0px 4px 10px rgba(255, 215, 0, 0.5);
}

h5 {
    color: #FFD700;
    font-size: 1.5rem;
}

/* Google Maps Embed */
.ratio {
    border: 3px solid #FFD700;
    border-radius: 10px;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    form, .col-md-6 {
        width: 90%;
    }
}
	/* Footer Section */
.footer {
    background-color: #121212;
    color: #fff;
    padding: 50px 20px;
    font-family: Arial, sans-serif;
}

.footer-container {
    max-width: 1200px;
    margin: auto;
}

.footer-top {
    display: flex;
    justify-content: space-around;
    padding-bottom: 30px;
    border-bottom: 1px solid #444;
}

.footer-box {
    text-align: center;
}

.footer-box i {
    font-size: 30px;
    color: #f4b342;
    margin-bottom: 10px;
}

.footer-box h3 {
    font-size: 18px;
    margin-bottom: 5px;
}

.footer-box p {
    font-size: 14px;
    color: #ccc;
}

.footer-main {
    display: flex;
    justify-content: space-between;
    padding: 40px 0;
}

.footer-logo h2 {
    font-size: 28px;
    font-weight: bold;
}

.footer-logo h2 span {
    color: #f4b342;
}

.footer-logo p {
    font-size: 14px;
    color: #ccc;
    margin-top: 10px;
}

.social-icons {
    margin-top: 15px;
}

.social-icons a {
    display: inline-block;
    margin-right: 10px;
    font-size: 20px;
    color: #f4b342;
    transition: 0.3s;
}

.social-icons a:hover {
    color: #fff;
}

.footer-links h3 {
    font-size: 20px;
    margin-bottom: 15px;
}

.footer-links ul {
    list-style: none;
    padding: 0;
}

.footer-links ul li {
    margin-bottom: 10px;
}

.footer-links ul li a {
    text-decoration: none;
    color: #ccc;
    transition: 0.3s;
}

.footer-links ul li a:hover {
    color: #f4b342;
}

.footer-subscribe h3 {
    font-size: 20px;
    margin-bottom: 15px;
}

.footer-subscribe p {
    font-size: 14px;
    color: #ccc;
}

.subscribe-box {
    display: flex;
    margin-top: 10px;
}

.subscribe-box input {
    flex: 1;
    padding: 10px;
    border: 1px solid #f4b342;
    background: transparent;
    color: white;
    border-radius: 5px 0 0 5px;
}

.subscribe-box button {
    padding: 10px 15px;
    background-color: #f4b342;
    border: none;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
}

.subscribe-box button i {
    color: #121212;
    font-size: 16px;
}

.footer-bottom {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid #444;
}

.footer-bottom p {
    font-size: 14px;
    color: #ccc;
}

.footer-bottom a {
    color: #f4b342;
    text-decoration: none;
}

.footer-bottom a:hover {
    text-decoration: underline;
}
    
    </style>
</head>
<body>
<a href="#" class="back-link" onclick="goBack()">⋘ </a>
<script>
    function goBack() {
        if (window.history.length > 1) {
            window.history.back();
        } else {
            window.location.href = "home.jsp"; 
        }
    }
</script>
<header class="sticky-header">
		<div class="logo">ｍ𝑒𝕘𝐚 ⓒƗ𝐓𝔂 ⓒ𝐚๒</div>
		
		<nav>
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="aboutus.jsp">About</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#gallery">Gallery</a></li>
				<li><a href="blog.jsp">Blog</a></li>
				<li><a href="ContactUs.jsp">Contact</a></li>
				<li><a href="profile.jsp">View Profile</a></li>
				<li><a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a></li>
			</ul>
		</nav>
	</header>
	

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success"><%= request.getAttribute("success") %></div>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
            <% } %>
<h2>Contact Us</h2>
            <form name="contactForm" action="${pageContext.request.contextPath}/ContactUsServlet" method="post">
                <input type="text" name="name" placeholder="Your Name" required><br>
                <input type="email" name="email" placeholder="Your Email" required><br>
                <input type="text" name="phone" placeholder="Your Phone" required><br>
                <select name="department">
                    <option value="Business">Department</option>
                    <option value="Support">Support</option>
                    <option value="IT">IT</option>
                    <option value="HR">HR</option>
                </select><br>
                <textarea name="message" rows="4" placeholder="Your Message" required></textarea><br>
                <button type="submit">Submit</button>
            </form>
            
            <%  
                String email = request.getParameter("email");
                if (email != null) {
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project3", "root", "Kalani2003@#$");
                        String sql = "SELECT reply FROM contact_us WHERE email = ? ORDER BY id DESC LIMIT 1";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, email);
                        rs = stmt.executeQuery();
                        if (rs.next()) {
                            String reply = rs.getString("reply");
                            if (reply != null && !reply.isEmpty()) {
            %>
                <div class="alert alert-info">Admin Reply: <%= reply %></div>
            <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                }
            %>
        </div>
        <div class="col-md-6">
            <h5>Contact Information</h5>
            <p><i class="fas fa-map-marker-alt me-2"></i>colombo 07</p>
            <p><i class="fas fa-phone me-2"></i>+77 365 2596</p>
            <p><i class="fas fa-envelope me-2"></i>mega@domain.com</p>

            <!-- Google Maps -->
            <div class="ratio ratio-16x9 mt-3">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509366!2d-122.41941538468156!3d37.77492977975921!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808f7e2b03f5f7f1%3A0xf99d6b7f9b92712c!2sSan+Francisco%2C+CA!5e0!3m2!1sen!2sus!4v1633042670644!5m2!1sen!2sus" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>
 


	 <footer class="footer">
        <div class="footer-container">
            <div class="footer-top">
                <div class="footer-box">
                    <i class="fas fa-phone me-2"></i>
                    <h3>Call us</h3>
                    <p>+94 77 252 3636</p>
                </div>
                <div class="footer-box">
                    <i class="fas fa-envelope me-2"></i>
                    <h3>Write to us</h3>
                    <p>megacity@cab.com</p>
                </div>
                <div class="footer-box">
                    <i class="fas fa-map-marker-alt me-2"></i>
                    <h3>Address</h3>
                    <p>Colombo 7, Mel Mavath, Office Mega</p>
                </div>
            </div>

            <div class="footer-main">
                <div class="footer-logo">
                    <h2><span>Mega</span>City Cab</h2>
                    <p>Rent a car imperdiet sapien porttitor the bibenum ellentsue the commodo erat nesuen.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>

                <div class="footer-links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Cars</a></li>
                        <li><a href="#">Car Types</a></li>
                        <li><a href="#">Team</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>

                <div class="footer-subscribe">
                    <h3>Subscribe</h3>
                    <p>Want to be notified about our services? Just sign up and we'll send you notifications by email.</p>
                    <div class="subscribe-box">
                        <input type="email" placeholder="Email Address">
                        <button><i class="fas fa-arrow-right"></i></button>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <p>©2024 <a href="#">ｍ𝑒𝕘𝐚 ⓒƗ𝐓𝔂 ⓒ𝐚๒</a>. All rights reserved.</p>
            </div>
        </div>
    </footer>


</body>
</html>
