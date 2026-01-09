
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.travoapp.model.dto.*"%>
<%@ page import="java.util.List"%>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    List<TravellerDetails> travellers = (List<TravellerDetails>) request.getAttribute("travellers");
    Payment payment = (Payment) request.getAttribute("payment");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family:'Poppins', sans-serif; background:#f5f5f8; margin:0; padding:0; }
        .container { max-width:900px; margin:40px auto; padding:0 20px; }
        .card { background:#fff; border-radius:16px; padding:24px; margin-bottom:20px; box-shadow:0 12px 25px rgba(0,0,0,0.08);}
        h2 { margin-bottom:16px; }
        .row { display:flex; justify-content:space-between; margin-bottom:10px; }
        .traveller-item { background:#faf8ff; border-radius:12px; padding:16px; margin-bottom:10px; border:1px solid #d7c9f3; }
    </style>
</head>
<body>

<div class="container">
    <h1>Booking Details</h1>

    <!-- Booking Info -->
    <div class="card">
        <h2>Package: <%= booking.getDestination() %></h2>
        <div class="row"><span>Booking ID</span><strong>#<%= booking.getBookingId() %></strong></div>
        <div class="row"><span>Travel Date</span><strong><%= booking.getTravelDate() %></strong></div>
        <div class="row"><span>Total Amount</span><strong>₹<%= booking.getAmount() %></strong></div>
    </div>

    <!-- Travellers -->
    <div class="card">
        <h2>Travellers</h2>
        <% for(TravellerDetails t : travellers) { %>
            <div class="traveller-item">
                <p><strong>Name:</strong> <%= t.getFullname() %></p>
                <p><strong>Age:</strong> <%= t.getAge() %></p>
                <p><strong>Gender:</strong> <%= t.getGender() %></p>
            </div>
        <% } %>
    </div>

    <!-- Payment Info -->
    <div class="card">
        <h2>Payment Details</h2>
        <div class="row"><span>Payment Method</span><strong><%= payment.getPaymentMethod() %></strong></div>
        <div class="row"><span>Status</span><strong><%= payment.getPaymentStatus() %></strong></div>
        <div class="row"><span>Transaction Ref</span><strong><%= payment.getTransactionRef() %></strong></div>
    </div>
    
    <a href="dashboard"> go to dashboard</a>

</div>
</body>
</html>
