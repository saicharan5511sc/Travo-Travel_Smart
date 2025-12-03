<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Overview</title>
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

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .stat-card {
            background: #fff;
            padding: 30px 20px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .stat-label {
            font-size: 1rem;
            font-weight: 600;
            color: #555;
            margin-bottom: 10px;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
        }

        @media(max-width: 900px) {
            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media(max-width: 600px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="stats-section fade-in">
        <h3 class="section-title">Your Booking Overview</h3>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-label">Upcoming Trips</div>
                <div class="stat-value"><%= request.getAttribute("statUpcoming") != null ? request.getAttribute("statUpcoming") : 0 %></div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Completed Trips</div>
                <div class="stat-value"><%= request.getAttribute("statCompleted") != null ? request.getAttribute("statCompleted") : 0 %></div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Total Bookings</div>
                <div class="stat-value"><%= request.getAttribute("statTotal") != null ? request.getAttribute("statTotal") : 0 %></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
