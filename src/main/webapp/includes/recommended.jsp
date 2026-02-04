<%@page import="java.util.List"%>
<%@page import="com.travoapp.model.dto.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Booking> rec = (List<Booking>) request.getAttribute("recommendedTrips");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recommended Trips</title>
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

        .recommended-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .recommended-card {
            background: #fff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .recommended-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .recommended-img {
            width: 100%;
            height: 140px;
            background-size: cover;
            background-position: center;
        }

        .recommended-body {
            padding: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .recommended-title {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: var(--text-dark);
        }

        .recommended-price {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 12px;
            color: var(--primary);
        }

        .recommended-btn {
            text-decoration: none;
            padding: 8px 16px;
            background: var(--primary);
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            transition: background 0.3s, transform 0.3s;
        }

        .recommended-btn:hover {
            background: #5b21b6;
            transform: translateY(-2px);
        }

        @media(max-width: 900px) {
            .recommended-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media(max-width: 600px) {
            .recommended-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="section fade-in" style="margin-top: 40px;">
        <h3 class="section-title">Recommended For You</h3>

        <div class="recommended-grid">

            <% if (rec != null && !rec.isEmpty()) {
                for (Booking r : rec) { %>

                <div class="recommended-card">
                    <!-- Image -->
                    <div class="recommended-img"
                        style="background-image: url('<%= r.getImageUrl() != null ? r.getImageUrl() : "https://via.placeholder.com/300" %>');">
                    </div>

                    <!-- Content -->
                    <div class="recommended-body">
                        <div class="recommended-title"><%= r.getDestination() %></div>
                        <div class="recommended-price">Starting at ₹<%= (int)r.getAmount() %></div>
                        <a href="packageDetails?id=<%= r.getBookingId() %>" class="recommended-btn">View Package</a>
                    </div>
                </div>

            <% } } else { %>
                <p style="margin-left: 10px; color: #777;">No recommended trips available.</p>
            <% } %>

        </div>
    </div>
</div>

</body>
</html>
