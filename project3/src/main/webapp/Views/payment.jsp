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

body {
    background-color: #111;
    color: #FFD700;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background: #222;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(255, 215, 0, 0.5);
    width: 100%;
    max-width: 420px;
    text-align: center;
}

h2 {
    color: #FFD700;
    margin-bottom: 20px;
}

.secure-badge {
    background-color: #FFD700;
    color: #111;
    padding: 5px 12px;
    border-radius: 5px;
    font-weight: bold;
    margin-bottom: 15px;
    display: inline-block;
}

form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

input, select {
    width: 100%;
    padding: 12px;
    border: 2px solid #FFD700;
    background: #333;
    color: #FFD700;
    border-radius: 8px;
    font-size: 16px;
    text-align: center;
}

.hidden {
    display: none;
}

.payment-logo {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 15px;
}

.payment-logo img {
    height: 40px;
    width: auto;
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
    transition: background 0.3s ease-in-out;
}

button:hover {
    background: #FFA500;
}

.loading {
    display: none;
    margin-top: 10px;
}

.loading img {
    width: 40px;
}

    </style>

    <script>
        function togglePaymentFields() {
            const paymentMethod = document.getElementById("paymentMethod").value;
            const cardDetails = document.getElementById("cardDetails");
            const upiDetails = document.getElementById("upiDetails");

            if (paymentMethod === "credit_card") {
                cardDetails.classList.remove("hidden");
                upiDetails.classList.add("hidden");
            } else if (paymentMethod === "upi") {
                upiDetails.classList.remove("hidden");
                cardDetails.classList.add("hidden");
            } else {
                cardDetails.classList.add("hidden");
                upiDetails.classList.add("hidden");
            }
        }

        function showLoading() {
            document.getElementById("loading").style.display = "block";
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Secure Payment</h2>
        <div class="secure-badge">🔒 100% Secure Payment</div>

        <div class="payment-logo">
            <img src="${pageContext.request.contextPath}/images/visa.png" alt="Visa">
            <img src="${pageContext.request.contextPath}/images/card.png" alt="Mastercard">
            <img src="${pageContext.request.contextPath}/images/upi.png" alt="UPI">
            <img src="${pageContext.request.contextPath}/images/net.png" alt="Net Banking">
        </div>

        <form action="${pageContext.request.contextPath}/PaymentServlet" method="post" onsubmit="showLoading()">
            <label>Select Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" onchange="togglePaymentFields()" required>
                <option value="" disabled selected>Select Payment Method</option>
                <option value="credit_card">Credit/Debit Card</option>
                <option value="upi">UPI</option>
                <option value="net_banking">Net Banking</option>
            </select>

            <div id="cardDetails" class="hidden">
                <label>Enter Card Number:</label>
                <input type="text" name="paymentDetails" placeholder="**** **** **** ****" maxlength="16">
                <label>Expiry Date:</label>
                <input type="text" name="expiryDate" placeholder="MM/YY">
                <label>CVV:</label>
                <input type="text" name="cvv" placeholder="***" maxlength="3">
            </div>

            <div id="upiDetails" class="hidden">
                <label>Enter UPI ID:</label>
                <input type="text" name="paymentDetails" placeholder="example@upi">
            </div>

            <label>Amount to Pay (RS):</label>
            <%
                Object amountObj = session.getAttribute("totalAmount");
                String amount = (amountObj != null) ? amountObj.toString() : "0";
            %>
            <input type="text" name="amount" value="<%= amount %>" readonly>

            <button type="submit">Proceed to Pay</button>
        </form>

        <div class="loading" id="loading">
            <img src="${pageContext.request.contextPath}/images/Anima.gif" alt="Loading...">
            <p>Processing your payment...</p>
        </div>
    </div>
</body>
</html>
