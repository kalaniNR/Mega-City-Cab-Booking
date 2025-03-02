<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Taxi & Car Rental Service</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Css/homeStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
	<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

body {
    background-color: #000; /* Black background */
    color: #fff;
    line-height: 1.6;
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

/* Hero Section */
.hero {
    background: url('../images/taxi-bg.jpg') no-repeat center center/cover;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 50px;
    position: relative;
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
}

.hero-content {
    max-width: 50%;
    position: relative;
    z-index: 2;
}

.hero-content h1 {
    font-size: 50px;
    color: #ffcc00;
}

.hero-content h2 {
    font-size: 30px;
}

.hero-content p {
    margin: 20px 0;
    font-size: 18px;
}

.hero .btn {
    padding: 10px 20px;
    font-size: 18px;
    background: #ffcc00;
    border: none;
    cursor: pointer;
    color: #000;
    font-weight: bold;
    transition: background 0.3s ease;
}

.hero .btn:hover {
    background: #e6b800;
}

/* Booking Form */
.booking-form {
    background: #111;
    padding: 20px;
    width: 30%;
    border-radius: 10px;
    position: relative;
    z-index: 2;
    color: white;
    border: 1px solid white;
}

.booking-form h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #ffcc00;
}

.booking-form input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ffcc00;
    border-radius: 5px;
    background: black;
    color: white;
}

.booking-form .btn {
    width: 100%;
    padding: 10px;
    background: #ffcc00;
    border: none;
    cursor: pointer;
    font-size: 18px;
    color: #000;
    font-weight: bold;
}

.booking-form .btn:hover {
    background: #e6b800;
}

/* Services Section */
.services {
    padding: 50px;
    text-align: center;
    background: #111;
    
}

.service-list {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.service-item {
    background: black;
    padding: 20px;
    width: 22%;
    margin: 10px;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(255, 204, 0, 0.5);
}

.service-item h3 {
    color: #ffcc00;
    margin-bottom: 10px;
}
.service-p{
color:white;
}

/* Gallery */
.gallery {
    text-align: center;
    padding: 50px 20px;
    background: #000;
}

.gallery-container {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.gallery-container img {
    width: 30%;
   
    border-radius: 10px;
    border: 3px solid #ffcc00;
}

/* Blog Section */
.blog {
    padding: 50px;
    text-align: center;
    background: #111;
}

.blog article {
    max-width: 50%;
    margin: 20px auto;
    padding: 15px;
    background: black;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(255, 204, 0, 0.5);
}

/* Help Section */
.help {
    text-align: center;
    padding: 50px 20px;
    background: black;
}

.help .btn {
    padding: 10px 20px;
    font-size: 18px;
    background: #ffcc00;
    border: none;
    cursor: pointer;
    color: #000;
    font-weight: bold;
}

.help .btn:hover {
    background: #e6b800;
}

/* Contact Section */
.contact-section {
    padding: 50px;
    text-align: center;
    background: #111;
}

.contact-form {
    max-width: 50%;
    margin: 0 auto;
    background: black;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(255, 204, 0, 0.5);
}

.contact-form input, .contact-form select, .contact-form textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ffcc00;
    border-radius: 5px;
    background: black;
    color: white;
}

.contact-form button {
    width: 100%;
    padding: 10px;
    background: #ffcc00;
    border: none;
    cursor: pointer;
    font-size: 18px;
    color: #000;
    font-weight: bold;
}

.contact-form button:hover {
    background: #e6b800;
}
.about {
    text-align: center;
    padding: 50px 20px;
    background: black;
}

.about h2 {
    font-size: 30px;
    color: white;
    margin-bottom: 20px;
}
.para{
    max-width: 50%;
    margin: 20px auto;
    padding: 15px;
    background: black;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(255, 204, 0, 0.5);
    
}
.aboutbtn{
    padding: 10px;
    background: #ffcc00;
    border: none;
    cursor: pointer;
    font-size: 18px;
    color: #000;
    font-weight: bold;
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
	<script>
        function validateForm() {
            let name = document.forms["myForm"]["name"].value;
            let email = document.forms["myForm"]["email"].value;
            let phone = document.forms["myForm"]["phone"].value;
            let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            let phonePattern = /^\d{10}$/;
            let errors = [];

            if (name.trim() === "") {
                errors.push("Name must not be empty.");
            }
            if (!emailPattern.test(email)) {
                errors.push("Invalid email format.");
            }
            if (!phonePattern.test(phone)) {
                errors.push("Phone number must be 10 digits.");
            }

            if (errors.length > 0) {
                alert(errors.join("\n"));
                return false;
            }
            return true;
        }
    </script>

</head>
<body>

	<header class="sticky-header">
		<div class="logo">ｍ𝑒𝕘𝐚 ⓒƗ𝐓𝔂 ⓒ𝐚๒</div>
		<nav>
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="aboutus.jsp">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="blog.jsp">Blog</a></li>
				<li><a href="ContactUs.jsp">Contact</a></li>
				<li><a href="#">View Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</nav>
	</header>



	<section class="hero">
		<div class="overlay"></div>
		<div class="hero-content">
			<h2>Need a Ride? Just Call</h2>
			<h1>911 999 911</h1>
			<p>Enjoy city breaks or extended holidays in comfort. Book your
				taxi now!</p>
			<button class="btn">Call for Taxi</button>
		</div>
		<div class="booking-form">
			<h2>Book Your Taxi Online</h2>
			<form action="${pageContext.request.contextPath}/CustomerReservationServlet" onsubmit="return validateForm()" method="post">
				<input type="text" id="name" name="name" placeholder="Your name"required> 
				<input type="email" id="email" name="email"placeholder="Email address" required>
				<input type="text"id="phone" name="phone" placeholder="Phone number" required>
				<input type="text" id="fromLocation" name="fromLocation"placeholder="From Destination" required>
				<input type="text"id="toLocation" name="toLocation" placeholder="To Destination"required> 
				<input type="datetime-local" id="datetime"name="datetime" required>
				<a href="booking.jsp">
				<button type="submit" class="btn">Make Reservation</button>
				</a>
				


			</form>
		</div>
	</section>

	<!-- About Section -->
	<section class="about" id="about">
		<h2>About Us</h2>
		<p class="para" id="para" >We are a trusted taxi and car rental service providing safe and
			reliable rides to our customers. With a fleet of modern vehicles and
			professional drivers, we ensure your journey is comfortable and
			hassle-free.</p>
			<a href="aboutus.jsp">
				<button id="aboutbtn" class="aboutbtn" type="submit">Read More</button>
			</a>
	</section>

	<!-- Services Section -->
	<section class="services" id="services">
		<h2>Our Services</h2>
		<div class="service-list">
			<div class="service-item">
				<h3>Airport Pickup</h3>
				<p class="service-p">We provide fast and convenient airport taxi services 24/7.</p>
			</div>
			<div class="service-item">
				<h3>City Tours</h3>
				<p class="service-p">Explore the city with our comfortable and guided tours.</p>
			</div>
			<div class="service-item">
				<h3>Corporate Rides</h3>
				<p class="service-p">Professional car rental solutions for businesses and
					executives.</p>
			</div>
			<div class="service-item">
				<h3>Long Distance Travel</h3>
				<p class="service-p">Travel between cities with affordable and comfortable rides.</p>
			</div>
		</div>
	</section>

	<!-- Gallery Section -->
	<section class="gallery" id="gallery">
		<h2>Gallery</h2>
		<div class="gallery-container">
			<img src="${pageContext.request.contextPath}/images/gallery1.jpg" alt="Taxi Image 1"> 
			<img  src="${pageContext.request.contextPath}/images/gallery2.jpg" alt="Taxi Image 2">
		    <img src="${pageContext.request.contextPath}/images/car1.jpg" alt="Taxi Image 3">
		</div>
	</section>

	<!-- Blog Section -->
	<section class="blog" id="blog">
		<h2>Latest News & Blogs</h2>
		<article>
			<h3>5 Tips for Safe Taxi Travel</h3>
			<p>Stay safe while using taxi services with these essential
				tips...</p>
		</article>
		<article>
			<h3>Why Choose Our Taxi Service?</h3>
			<p>Learn what makes us the best choice for your travel needs...</p>
		</article>
	</section>

	<!-- Help Section -->
	<section class="help" id="help">
		<h2>Help & Support</h2>
		<p>Have questions? Reach out to our 24/7 customer support team.</p>
		<button class="btn">Contact Support</button>
	</section>

	<!-- Contact Section -->
	<section class="contact-section" id="contact">
		<h2>Get in touch with us and ask your questions!</h2>

		<div class="contact-info">
			<p>Email: support@kubertaxi.com</p>
			<p>Phone: 911 999 911</p>
		</div>

		<form class="contact-form">
			<input type="text" name="name" placeholder="Your Name" required>
			<input type="email" name="email" placeholder="Your Email" required>
			<input type="text" name="phone" placeholder="Your Phone" required>
			<select name="department">
				<option value="business">Business Department</option>
				<option value="support">Support</option>
				<option value="sales">Sales</option>
			</select>
			<textarea name="message" rows="4" placeholder="Your Message" required></textarea>
			<button type="submit">Submit</button>
		</form>

		<div class="social-icons">
			<a href="#">&#xf099;</a>
			<!-- Facebook -->
			<a href="#">&#xf09a;</a>
			<!-- Twitter -->
			<a href="#">&#xf16d;</a>
			<!-- Instagram -->
		</div>
	</section>

	 <footer class="footer">
        <div class="footer-container">
            <div class="footer-top">
                <div class="footer-box">
                    <i class="fas fa-phone me-2"></i>
                    <h3>Call us</h3>
                    <p>+971 52-333-4444</p>
                </div>
                <div class="footer-box">
                    <i class="fas fa-envelope me-2"></i>
                    <h3>Write to us</h3>
                    <p>info@renax.com</p>
                </div>
                <div class="footer-box">
                    <i class="fas fa-map-marker-alt me-2"></i>
                    <h3>Address</h3>
                    <p>Dubai, Water Tower, Office 123</p>
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