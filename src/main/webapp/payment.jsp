<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travoapp.model.dto.Users"%>

<%
    Users user = (Users) session.getAttribute("users");
    Integer bookingId = (Integer) session.getAttribute("bookingId");
    Double amount = (Double) session.getAttribute("totalAmount");

    if (user == null || bookingId == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Secure Payment</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: #f5f5f8;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1000px;
    margin: 50px auto;
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    padding: 0 20px;
}

.card {
    background: #fff;
    border-radius: 16px;
    padding: 30px;
    box-shadow: 0 12px 25px rgba(0,0,0,0.08);
}

.left-panel, .right-panel {
    flex: 1;
    min-width: 300px;
}

h2 {
    font-weight: 600;
    margin-bottom: 20px;
    color: #333;
}

/* Payment Options List */
.payment-option {
    border: 1px solid #ddd;
    border-radius: 12px;
    padding: 18px 16px;
    margin-bottom: 14px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 12px;
    transition: all 0.2s;
}
.payment-option:hover {
    border-color: #6d28d9;
    background: #f9f5ff;
}

input[type=radio] {
    transform: scale(1.3);
    accent-color: #6d28d9;
}

/* Dynamic Sub-option Panels */
.sub-panel {
    background: #f9f5ff;
    border-radius: 12px;
    padding: 20px;
    border: 1px solid #ddd;
    display: none;
    animation: fadeIn 0.3s ease-in-out;
}
@keyframes fadeIn {
    from {opacity:0; transform: translateY(-5px);}
    to {opacity:1; transform: translateY(0);}
}

/* Inputs */
input[type=text], input[type=number], select {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: 1px solid #ccc;
    font-size: 1rem;
    margin-bottom: 14px;
    transition: border 0.2s;
}
input:focus, select:focus {
    outline: none;
    border-color: #6d28d9;
    box-shadow: 0 0 8px rgba(109,40,217,0.2);
}

/* Pay Button */
.pay-btn {
    width: 100%;
    background: #6d28d9;
    color: #fff;
    border: none;
    padding: 16px;
    border-radius: 12px;
    font-size: 1.2rem;
    font-weight: 700;
    cursor: pointer;
    margin-top: 20px;
    transition: background 0.3s;
}
.pay-btn:hover {
    background: #5b21b6;
}

/* Responsive */
@media(max-width: 900px){
    .container { flex-direction: column; }
}
</style>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</head>

<body>

<div class="container">

    <!-- LEFT PANEL: Payment Methods -->
    <div class="card left-panel">
        <h2>Choose Payment Method</h2>
        <form >
            <input type="hidden" name="bookingId" value="<%= bookingId %>">
            <input type="hidden" name="amount" value="<%= amount %>">

            <label class="payment-option">
                <input type="radio" name="paymentMethod" value="CARD" required onclick="showSubPanel('card')">
                💳 Credit / Debit Card
            </label>

            <label class="payment-option">
                <input type="radio" name="paymentMethod" value="UPI" onclick="showSubPanel('upi')">
                📱 UPI
            </label>

            
    </div>

    <!-- RIGHT PANEL: Sub-options / Inputs -->
    <div class="card right-panel">
        <h2>Enter Details</h2>

        <div id="card" class="sub-panel">
            <input type="text" name="cardNumber" placeholder="Card Number" maxlength="16">
            <div style="display:flex; gap:10px;">
                <input type="text" name="expiry" placeholder="MM/YY" style="flex:1;">
                <input type="text" name="cvv" placeholder="CVV" maxlength="3" style="flex:1;">
            </div>
            <input type="text" name="cardHolder" placeholder="Card Holder Name">
        </div>

        <div id="upi" class="sub-panel">
            <p style="text-align:center;">Scan this QR code to pay via UPI</p>
            <img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/QR_code_for_mobile_English_Wikipedia.svg" alt="UPI QR" style="display:block; margin: 0 auto; width:180px;">
        </div>

        <div id="netbanking" class="sub-panel">
            <select name="bank">
                <option value="">Select Bank</option>
                <option>HDFC Bank</option>
                <option>ICICI Bank</option>
                <option>SBI</option>
                <option>Axis Bank</option>
                <option>Other</option>
            </select>
        </div>

        <div id="wallet" class="sub-panel">
            <select name="wallet">
                <option value="">Select Wallet</option>
                <option>Paytm</option>
                <option>PhonePe</option>
                <option>Google Pay</option>
                <option>Mobikwik</option>
            </select>
        </div>

       <button type="button" class="pay-btn" onclick="payNow()">Pay ₹<%= amount %></button>

        </form>
    </div>

</div>
<script>
function payNow() {

    var options = {
        key: "rzp_test_RwzlXe1QU93GBz",
        amount: "<%= (int)(100 * 100) %>", // ₹100 test
        currency: "INR",

        name: "Travo Travel",
        description: "Booking Payment",

        prefill: {
            name: "Hrishikesh C",
            email: "test@travo.com",
            contact: "6360603008"
        },

        handler: function (response) {

            var form = document.createElement("form");
            form.method = "POST";
            form.action = "RazorpaySuccessServlet";

            form.innerHTML = `
                <input type="hidden" name="razorpay_payment_id" value="${response.razorpay_payment_id}">
                <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <input type="hidden" name="paymentMethod" value="RAZORPAY">
            `;

            document.body.appendChild(form);
            form.submit();
        }
    };

    var rzp1 = new Razorpay(options);
    rzp1.open();
}
</script>

</body>
</html>
