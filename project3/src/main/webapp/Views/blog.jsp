<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    class BlogPost {
        String title, description, category, readTime, image;
        
        BlogPost(String title, String description, String category, String readTime, String image) {
            this.title = title;
            this.description = description;
            this.category = category;
            this.readTime = readTime;
            this.image = image;
        }
    }

    List<BlogPost> blogs = Arrays.asList(
        new BlogPost("The Future of Taxi Services in Sri Lanka", "Explore how digital transformation is reshaping the taxi industry in Sri Lanka.", "INDUSTRY", "4 MIN READ", "blog1.jpg"),
        new BlogPost("Maximizing Efficiency with a Digital Dispatch System", "Learn how Sri Lankan taxi businesses can streamline operations with digital dispatch.", "TECHNOLOGY", "3 MIN READ", "blog2.jpg"),
        new BlogPost("Safety First: Enhancing Passenger Security", "How taxi services in Sri Lanka are improving safety for passengers.", "SAFETY", "3 MIN READ", "blog3.jpg"),
        new BlogPost("Electric Vehicles: The Future of Taxis in Sri Lanka?", "Should Sri Lanka’s taxi industry switch to EVs for a greener future?", "GROWTH", "4 MIN READ", "blog4.jpg"),
        new BlogPost("Data-Driven Decisions in the Taxi Industry", "How analytics can help Sri Lankan taxi businesses grow.", "TECHNOLOGY", "3 MIN READ", "blog5.jpg"),
        new BlogPost("How to Stay Compliant with Local Regulations", "Key legal aspects Sri Lankan taxi operators must follow.", "LEGAL", "3 MIN READ", "blog6.jpg")
    );
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taxi Blog - Sri Lanka</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <style>
    /* General Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #000;
    color: #fff;
}

.blog-container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
}

/* Blog Cards */
.blog-card {
    background: #1a1a1a;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(255, 255, 0, 0.5);
    transition: transform 0.3s, box-shadow 0.3s;
}

.blog-card:hover {
    transform: translateY(-5px);
    box-shadow: 4px 4px 15px rgba(255, 255, 0, 0.8);
}

.blog-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
}

.blog-title {
    font-size: 18px;
    font-weight: bold;
    margin-top: 10px;
    color: #ffcc00;
}

.blog-desc {
    font-size: 14px;
    color: #ccc;
}

.blog-meta {
    font-size: 12px;
    color: #ffcc00;
}

/* Navbar */
.navbar {
    background-color: #000 !important;
}

.navbar-brand {
    font-size: 24px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .blog-card {
        margin-bottom: 20px;
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
    
    </style> <!-- Advanced CSS File -->
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container">
        <a class="navbar-brand text-warning" href="#">ｍ𝑒𝕘𝐚 ⓒƗ𝐓𝔂 ⓒ𝐚๒ Blog - Sri Lanka</a>
    </div>
</nav>

<div class="blog-container">
    <h2 class="text-center mt-4 text-warning">Welcome to the Official Taxi Blog of Sri Lanka</h2>
    <p class="text-center text-light">Stay updated with the latest trends, technology, and insights in Sri Lanka's taxi industry.</p>

    <div class="row">
        <% for (BlogPost blog : blogs) { %>
            <div class="col-md-4 mb-4">
                <div class="blog-card">
                    <img src="<%= request.getContextPath() %>/images/<%= blog.image %>" alt="<%= blog.title %>">

                    <p class="blog-meta"><strong><%= blog.category %></strong> | <%= blog.readTime %></p>
                    <p class="blog-title"><%= blog.title %></p>
                    <p class="blog-desc"><%= blog.description %></p>
                </div>
            </div>
        <% } %>
    </div>
</div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
