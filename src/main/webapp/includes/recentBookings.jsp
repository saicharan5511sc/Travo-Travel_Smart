<%@page import="java.util.List"%>
<%@page import="com.travoapp.model.dto.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Booking> recent = (List<Booking>) request.getAttribute("recentBookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recent Bookings</title>
    <style>
        :root {
            --primary: #6d28d9;
            --light-bg: #f7f2ff;
            --text-dark: #2d2743;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: var(--light-bg);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 30px auto;
        }

        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 20px;
        }

        .recent-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .recent-card {
            background: #fff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .recent-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .recent-img {
            width: 100%;
            height: 140px;
            background-size: cover;
            background-position: center;
        }

        .recent-content {
            padding: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .recent-destination {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: var(--text-dark);
        }

        .recent-meta {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 12px;
        }

        .recent-amount {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--primary);
        }

        .recent-btn {
            text-decoration: none;
            padding: 8px 16px;
            background: var(--primary);
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            transition: background 0.3s, transform 0.3s;
        }

        .recent-btn:hover {
            background: #5b21b6;
            transform: translateY(-2px);
        }

        @media(max-width: 900px) {
            .recent-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media(max-width: 600px) {
            .recent-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="section fade-in" style="margin-top: 40px;">
        <h3 class="section-title">Recent Bookings</h3>

        <div class="recent-grid">

            <% if (recent != null && !recent.isEmpty()) {
                for (Booking rb : recent) { %>

                <div class="recent-card">
                    <!-- Image -->
                    <div class="recent-img" 
                        style="background-image: url('<%= rb.getImageUrl() != null ? rb.getImageUrl() : "https://via.placeholder.com/300" %>');">
                    </div>

                    <!-- Content -->
                    <div class="recent-content">
                        <div class="recent-destination"><%= rb.getDestination() %></div>
                        <div class="recent-meta">Booked On: <%= rb.getBookingDate() %></div>
                        <div class="recent-amount">₹<%= (int)rb.getAmount() %></div>
                        <a href="BookingDetails?id=<%= rb.getBookingId() %>" class="recent-btn">View Details</a>
                    </div>
                </div>

            <% } } else { %>
                <p style="margin-left: 10px; color: #777;">No recent bookings available.</p>
            <% } %>

        </div>
    </div>
</div>

</body>
</html>
