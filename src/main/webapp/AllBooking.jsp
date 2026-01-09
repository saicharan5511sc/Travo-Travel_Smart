<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travoapp.model.dto.Booking"%>
<%@ page import="com.travoapp.model.dto.Users"%>
<%@ page import="com.travoapp.model.dao.BookingDAO"%>
<%@ page import="com.travoapp.model.dao.BookingDAOImpl"%>
<%@ page import="java.util.List"%>

<%
    Users user = (Users) session.getAttribute("users");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    BookingDAO bookingDAO = new BookingDAOImpl();
    List<Booking> bookings = bookingDAO.findRecentBookingsByUser(user.getUserId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Bookings</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: #f5f5f8;
    margin: 0;
    padding: 0;
}
.container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 20px;
}
h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}
.booking-card {
    display: flex;
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    margin-bottom: 20px;
    overflow: hidden;
}
.booking-card img {
    width: 200px;
    object-fit: cover;
}
.booking-info {
    padding: 20px;
    flex: 1;
}
.booking-info h2 {
    margin: 0 0 10px;
    font-size: 1.3rem;
    color: #6d28d9;
}
.booking-info p {
    margin: 6px 0;
    color: #555;
}
.status {
    padding: 6px 12px;
    border-radius: 12px;
    font-weight: 600;
    display: inline-block;
    font-size: 0.9rem;
    margin-top: 10px;
}
.status-pending { background: #fff3cd; color: #856404; }
.status-confirmed { background: #d1e7dd; color: #0f5132; }
.status-completed { background: #cfe2ff; color: #084298; }

</style>
</head>
<body>

<div class="container">
    <h1>My Bookings</h1>

    <%
        if (bookings != null && !bookings.isEmpty()) {
            for (Booking b : bookings) {
    %>
        <div class="booking-card">
            <img src="<%= b.getImageUrl() %>" alt="Package Image">
            <div class="booking-info">
                <h2><%= b.getDestination() %> (<%= b.getTripType() %>)</h2>
                <p><strong>Booking ID:</strong> #<%= b.getBookingId() %></p>
                <p><strong>Travel Date:</strong> <%= b.getTravelDate() %></p>
                <p><strong>Amount:</strong> ₹<%= b.getAmount() %></p>
                <p><strong>Status:</strong> 
                    <span class="status status-<%= b.getStatus().toLowerCase() %>"><%= b.getStatus() %></span>
                </p>
                <p><strong>Travellers:</strong> <%= bookingDAO.getTravellerCount(user.getUserId(), b.getPackageId()) %></p>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <p style="text-align:center; color:#555; font-size:1.1rem;">You have no bookings yet!</p>
    <%
        }
    %>
</div>

</body>
</html>
