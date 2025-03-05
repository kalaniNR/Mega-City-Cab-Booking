<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Mega City Cab</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/aboutus.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
    <style>
    /* Global Styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #0d0d0d;
    color: #ffffff;
    margin: 0;
    padding: 0;
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


/* Hero Section */
.hero-section {
    background: url('../images/about-banner.jpg') no-repeat center center/cover;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

.overlay {
    background: rgba(0, 0, 0, 0.6);
    padding: 50px;
    text-align: center;
    width: 100%;
}

h1 {
    color: #f4c100;
    font-size: 2.5rem;
}

/* About Intro */
.about-intro {
    text-align: center;
    padding: 50px 20px;
    max-width: 1000px;
    margin: auto;
}

.highlight {
    color: #f4c100;
    font-weight: bold;
}

.stats-container {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    margin-top: 30px;
}

.stat-box {
    background-color: #1a1a1a;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    width: 200px;
    margin: 10px;
    border: 2px solid #f4c100;
    box-shadow: 0 4px 10px rgba(255, 204, 0, 0.3);
}

h3 {
    color: #f4c100;
}

/* Team Section */
.team-section {
    text-align: center;
    padding: 50px 20px;
}

.team-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
}

.team-card {
    background: #1a1a1a;
    padding: 20px;
    border-radius: 10px;
    width: 220px;
    text-align: center;
    border: 2px solid #f4c100;
    transition: transform 0.3s;
}

.team-card:hover {
    transform: scale(1.05);
}

.team-card img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
}

/* Features Section */
.features-section {
    text-align: center;
    padding: 50px 20px;
    background-color: #222;
}

.features-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
}

.feature-box {
    background: #1a1a1a;
    padding: 20px;
    width: 250px;
    text-align: center;
    border-radius: 10px;
    border: 2px solid #f4c100;
    transition: transform 0.3s;
}

.feature-box:hover {
    transform: scale(1.05);
}

.icon {
    font-size: 2rem;
    color: #f4c100;
}

/* Responsive Design */
@media (max-width: 768px) {
    .stats-container, .team-container, .features-container {
        flex-direction: column;
        align-items: center;
    }

    .stat-box, .team-card, .feature-box {
        width: 80%;
    }
   
}
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


<!-- Hero Section -->
<section class="hero-section">
<a href="#" class="back-link" onclick="goBack()">⋘</a>

<script>
    function goBack() {
        if (window.history.length > 1) {
            window.history.back();
        } else {
            window.location.href = "home.jsp"; 
        }
    }
</script>
    <div class="overlay">
        <h1>About Us</h1>
        
    </div>
</section>

<!-- Introduction Section -->
<section class="about-intro">
    <h2>We offer customers a wide range of <span class="highlight">premium cabs</span> for every occasion.</h2>
    <p>
        At Mega City Cab, we are committed to providing top-notch cab services. Our fleet includes well-maintained vehicles to cater to diverse needs. 
        With a strong focus on customer satisfaction, safety, and affordability, we ensure a seamless travel experience.
    </p>
    
    <div class="stats-container">
        <div class="stat-box">
            <h3>10,250+</h3>
            <p>Completed Rides</p>
        </div>
        <div class="stat-box">
            <h3>5,800+</h3>
            <p>Happy Customers</p>
        </div>
        <div class="stat-box">
            <h3>320+</h3>
            <p>Fleet Vehicles</p>
        </div>
        <div class="stat-box">
            <h3>8+</h3>
            <p>Years of Excellence</p>
        </div>
    </div>
</section>

<!-- Team Section -->
<section class="team-section">
    <h2>Board of Directors</h2>
    <div class="team-container">
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/person1.jpg" alt="CEO">
            <h3>John Doe</h3>
            <p>Chief Executive Officer</p>
        </div>
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/person2.jpg" alt="CTO">
            <h3>Sarah Lee</h3>
            <p>Chief Technology Officer</p>
        </div>
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/person3.jpg" alt="COO">
            <h3>Michael Smith</h3>
            <p>Chief Operations Officer</p>
        </div>
        <div class="team-card">
            <img src="${pageContext.request.contextPath}/images/person4.jpg" alt="Finance Director">
            <h3>Emily Davis</h3>
            <p>Finance Director</p>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features-section">
    <h2>Our Premium Services</h2>
    <div class="features-container">
        <div class="feature-box">
            <i class="icon">🚖</i>
            <h3>Reliable Service</h3>
            <p>Our cabs are available 24/7 to ensure you reach your destination safely and on time.</p>
        </div>
        <div class="feature-box">
            <i class="icon">💰</i>
            <h3>Affordable Rides</h3>
            <p>We offer competitive pricing while maintaining excellent service quality.</p>
        </div>
        <div class="feature-box">
            <i class="icon">🏆</i>
            <h3>Top-Rated Drivers</h3>
            <p>All drivers are professionally trained and customer-friendly.</p>
        </div>
        <div class="feature-box">
            <i class="icon">🎉</i>
            <h3>Special Event Booking</h3>
            <p>Book luxury rides for weddings, corporate events, and more.</p>
        </div>
    </div>
</section>

 <footer class="footer">
        <div class="footer-container">
            <div class="footer-top">
                <div class="footer-box">
                    <i class="fas fa-phone me-2"></i>
                    <h3>Call us</h3>
                    <p>+94 77 256  2548</p>
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
