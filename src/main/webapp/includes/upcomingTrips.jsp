<%@page import="com.travoapp.model.dto.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Booking> upcomingTrips = (List<Booking>) request.getAttribute("upcomingTrips");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Upcoming Trips</title>
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

    .upcoming-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 25px;
    }

    .upcoming-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 12px 35px rgba(92,46,145,0.15);
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .upcoming-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 45px rgba(92,46,145,0.25);
    }

    .upcoming-img {
        width: 100%;
        height: 180px;
        object-fit: cover;
    }

    .upcoming-info {
        padding: 15px 18px;
        text-align: left;
    }

    .trip-title {
        font-size: 1.2rem;
        font-weight: 600;
        margin: 0 0 8px;
        color: var(--text-dark);
    }

    .trip-date, .trip-status {
        font-size: 0.95rem;
        color: #555;
        margin: 4px 0;
    }

    .badge {
        padding: 3px 10px;
        border-radius: 12px;
        font-weight: 600;
        font-size: 0.85rem;
        color: #fff;
    }

    .badge.primary {
        background: var(--primary);
    }

    @media(max-width: 900px) {
        .upcoming-grid {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media(max-width: 600px) {
        .upcoming-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>
<div class="container">
    <div class="section fade-in">
        <h3 class="section-title">Upcoming Trips</h3>

        <div class="upcoming-grid">
            <% if(upcomingTrips != null && !upcomingTrips.isEmpty()) {
                for(Booking trip : upcomingTrips) { %>
                <div class="upcoming-card">

                    <img 
                        class="upcoming-img" 
                        src="<%= trip.getImageUrl() != null ? trip.getImageUrl() : 
                            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80&auto=format&fit=crop" %>" 
                        alt="<%= trip.getDestination() %>"
                    />

                    <div class="upcoming-info">
                        <h4 class="trip-title"><%= trip.getDestination() %></h4>
                        <p class="trip-date">Start Date: <%= trip.getTravelDate() %></p>
                        <p class="trip-status">Status: <span class="badge primary">Upcoming</span></p>
                    </div>

                </div>
            <% } } else { %>
                <p style="color: #777;">No upcoming trips available.</p>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
