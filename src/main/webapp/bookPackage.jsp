<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travoapp.model.dto.Package" %>

<%
    Package pkg = (Package) request.getAttribute("package");
    

    if (pkg == null) {
        out.println("<h2>Package not found</h2>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= pkg.getDestination() %> – Vacation Package</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bookPackage.css">
    <script src="https://kit.fontawesome.com/a2f0b5c56b.js" crossorigin="anonymous"></script>
</head>

<body>

<div class="container">

    <!-- GALLERY -->
    <div class="gallery">

        <!-- Main Image -->
        <img src="<%= pkg.getImageUrl() %>" class="gallery-main" id="mainImg">

        <div class="gallery-thumbs">
            <% for (String img : pkg.getGalleryImages()) { %>
                <img src="<%= img %>" onclick="changeImg(this.src)">
            <% } %>
        </div>
    </div>

    <!-- TITLE -->
    <h1 class="package-title"><%= pkg.getDestination() %> – Premium Package</h1>
    <p class="package-sub"><%= pkg.getDescription() %></p>

    <!-- BOOKING STEPS -->
    <div class="steps">
        <div class="step active">Select Package</div>
        <div class="line"></div>
        <div class="step">Traveller Details</div>
        <div class="line"></div>
        <div class="step">Payment</div>
        <div class="line"></div>
        <div class="step">Confirmation</div>
    </div>

    <!-- MAIN GRID -->
    <div class="details-grid">

        <!-- LEFT SIDE -->
        <div>
            <!-- TABS -->
            <div class="tabs">
                <div class="tab active" onclick="switchTab('overview', event)">Overview</div>
                <div class="tab" onclick="switchTab('itinerary', event)">Itinerary</div>
                <div class="tab" onclick="switchTab('hotels', event)">Hotels</div>
                <div class="tab" onclick="switchTab('reviews', event)">Reviews</div>
            </div>

            <!-- OVERVIEW TAB -->
            <div id="overview" class="tab-content active">

                <div class="section-card">
                    <h3 class="section-title">Package Details</h3>

                    <p><strong>Price:</strong> ₹<%= pkg.getPrice() %> per person</p>

                </div>

                <div class="section-card">
                    <h3 class="section-title">Trip Highlights</h3>
                    <ul class="list">
                        <% for (String h : pkg.getHighlights()) { %>
                            <li><%= h %></li>
                        <% } %>
                    </ul>
                </div>

                <div class="section-card">
                    <h3 class="section-title">Inclusions</h3>
                    <ul class="list">
                        <% for (String inc : pkg.getInclusions()) { %>
                            <li><i class="fas fa-check-circle icon-success"></i> <%= inc %></li>
                        <% } %>
                    </ul>
                </div>

                <div class="section-card">
                    <h3 class="section-title">Exclusions</h3>
                    <ul class="list">
                        <% for (String exc : pkg.getExclusions()) { %>
                            <li><i class="fas fa-times-circle icon-danger"></i> <%= exc %></li>
                        <% } %>
                    </ul>
                </div>

            </div>

            <!-- ITINERARY TAB -->
            <div id="itinerary" class="tab-content">
                <div class="section-card">
                    <h3 class="section-title">Day-wise Itinerary</h3>

                    <% for (String day : pkg.getItinerary()) { %>
                        <p class="itinerary-day"><%= day %></p>
                    <% } %>
           

                </div>
            </div>

            <!-- HOTELS TAB -->
            <div id="hotels" class="tab-content">
                <div class="section-card">
                    <h3 class="section-title">Hotels & Stay</h3>

                    <% for (String hotel : pkg.getHotels()) { %>
                        <p class="hotel-item"><i class="fas fa-hotel"></i> <%= hotel %></p>
                    <% } %>

                </div>
            </div>

            <!-- REVIEWS TAB -->
            <div id="reviews" class="tab-content">
                <div class="section-card">
                    <h3 class="section-title">Customer Reviews</h3>
                    <p>No reviews yet.</p>
                </div>
            </div>
        </div>

        <!-- RIGHT SIDE PRICE CARD -->
        <div>
            <div class="billing-card">
                <h3 class="bill-title">Price Summary</h3>

                <div class="bill-row">
                    <span>Base Price</span>
                    <span>₹<%= pkg.getPrice() %></span>
                </div>

                <hr>

                <div class="bill-total">
                    <span>Total Amount</span>
                    <span class="bill-amount">₹<%= pkg.getPrice() %></span>
                </div>

                <button class="book-btn">
                    <a href="travellerDetails.jsp?packageId=<%= pkg.getPackageId() %>">Book Now</a>
                </button>
            </div>
        </div>

    </div>

</div>

<script>
function changeImg(src) {
    document.getElementById("mainImg").src = src;
}

function switchTab(id, event) {
    document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
    document.querySelectorAll(".tab-content").forEach(c => c.classList.remove("active"));

    event.target.classList.add("active");
    document.getElementById(id).classList.add("active");
}
</script>

</body>
</html>
