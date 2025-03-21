<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Payment</title>
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
    background-color: #111;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

/* Payment Container */
.container {
    background: #222;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 15px rgba(255, 215, 0, 0.5);
    width: 400px;
    animation: fadeIn 0.6s ease-in-out;
}

h2 {
    color: #FFD700;
    border-bottom: 2px solid #FFD700;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

input, select {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 2px solid #FFD700;
    background: #333;
    color: #FFD700;
    border-radius: 6px;
    font-size: 16px;
    text-align: center;
}

button {
    background: #FFD700;
    color: #111;
    border: none;
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
    margin-top: 15px;
}

button:hover {
    background: #FFA500;
    transform: scale(1.05);
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Secure Payment</h2>
        <form action="${pageContext.request.contextPath}/PaymentServlet" method="post">
            <label>Select Payment Method:</label>
            <select name="paymentMethod" required>
                <option value="credit_card">Credit/Debit Card</option>
                <option value="upi">UPI</option>
                <option value="net_banking">Net Banking</option>
            </select>

            <label>Enter Card/UPI ID:</label>
            <input type="text" name="paymentDetails" placeholder="Card Number / UPI ID" required>

            <label>Amount to Pay (RS):</label>
            <%
                Object amountObj = session.getAttribute("totalAmount");
                String amount = (amountObj != null) ? amountObj.toString() : "0";
            %>
            <input type="text" name="amount" value="<%= amount %>" readonly>

            <button type="submit">Proceed to Pay</button>
        </form>
    </div>

   
</body>
</html>