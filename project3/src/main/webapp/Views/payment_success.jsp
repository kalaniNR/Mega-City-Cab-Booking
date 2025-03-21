<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Successful</title>
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

/* Payment Success Container */
.container {
    background: #222; /* Darker Black */
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 20px rgba(255, 215, 0, 0.5);
    width: 400px;
    animation: fadeIn 0.6s ease-in-out;
}

/* Success Header */
h2 {
    color: #32CD32; /* Green for success */
    border-bottom: 2px solid #32CD32;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

/* Text Styling */
p {
    font-size: 16px;
    color: white;
    margin: 10px 0;
}

/* Highlighted Data */
b {
    color: #FFD700;
}

/* Buttons */
button {
    background: #FFD700;
    color: #111;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
    margin-top: 15px;
    width: 100%;
}

button:hover {
    background: #FFA500;
    transform: scale(1.05);
}

/* Fade-in Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
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
    <div class="container">
        <h2>Payment Successful!</h2>
        <p>A confirmation email has been sent to your registered email.</p>
        <p><b>Payment Method:</b> <%= session.getAttribute("paymentMethod") %></p>
        <p><b>Details:</b> <%= session.getAttribute("paymentDetails") %></p>
        <p><b>Amount Paid:</b> RS. <%= session.getAttribute("amount") %></p>
        <p><b>Status:</b> <%= session.getAttribute("paymentStatus") %></p>
        <a href="home.jsp"><button>Back to Home</button></a>
        <a href="${pageContext.request.contextPath}/GeneratePDFServlet"><button class="btn">Download PDF</button></a>

    </div>
</body>
</html>
