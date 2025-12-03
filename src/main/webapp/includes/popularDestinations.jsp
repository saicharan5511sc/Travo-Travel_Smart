<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.travoapp.model.dto.Package"%>

<%
    List<String> popularList = (List<String>) request.getAttribute("popularDestinations");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Popular Destinations</title>
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

        .popular-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .popular-card {
            background: #fff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .popular-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .popular-img {
            width: 100%;
            height: 150px;
            background-size: cover;
            background-position: center;
        }

        .popular-content {
            padding: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .popular-name {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 10px;
            text-align: center;
            color: var(--text-dark);
        }

        .popular-btn {
            text-decoration: none;
            padding: 10px 18px;
            background: var(--primary);
            color: white;
            font-weight: 600;
            border-radius: 12px;
            transition: background 0.3s, transform 0.3s;
        }

        .popular-btn:hover {
            background: #5b21b6;
            transform: translateY(-2px);
        }

        @media(max-width: 900px) {
            .popular-grid {
                grid-template-columns: 1fr 1fr;
                gap: 16px;
            }
        }

        @media(max-width: 600px) {
            .popular-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<%
List<Package> popList = (List<Package>) request.getAttribute("popularDestinations");
%>
<div class="container">
    <div class="section fade-in" style="margin-top: 40px;">
        <h3 class="section-title">Popular Destinations</h3>

        <div class="popular-grid">

       <% 
if (popList != null && !popList.isEmpty()) {
    for (Package p : popList) { 
%>

                <div class="popular-card">
                    <!-- Background Image -->
                    <div class="popular-img" style="background-image: url('<%= p.getImageUrl() %>');"></div>

                    <!-- Card Content -->
                    <div class="popular-content">
                        <div class="popular-name"><%= p.getDestination() %></div>
                        <a href="packageDetails?destination=<%= p.getPackageId() %>" class="popular-btn">
                            Explore
                        </a>
                    </div>
                </div>

            <% } } else { %>

                <p style="margin-left: 10px; color: #777;">No destinations found.</p>

            <% } %>

        </div>
    </div>
</div>

</body>
</html>
