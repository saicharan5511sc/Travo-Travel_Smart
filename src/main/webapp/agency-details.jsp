<%@page import="com.travoapp.model.dto.Package"%>
<%@page import="com.travoapp.model.dto.*"%>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Travo – <%= ((AgencyDetailsDTO)request.getAttribute("agency")).getAgencyName() %></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
    <style>
        :root {
            --primary: #5C2E91;
            --light-bg: #F9F6FF;
            --text-dark: #2c2450;
            --muted: #8b86a3;
            --radius: 16px;
        }
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Poppins", sans-serif; }
        body { background: var(--light-bg); padding: 25px 0; }
        .container { width: 90%; max-width: 1200px; margin:auto; }
        .banner { width: 100%; height: 300px; object-fit: cover; border-radius: var(--radius); margin-bottom: 20px; }
        .agency-info { background:#fff; padding:20px; border-radius:var(--radius); box-shadow:0 10px 25px rgba(0,0,0,0.08); margin-bottom:20px; }
        .agency-logo { width: 120px; height:120px; border-radius:50%; object-fit:cover; margin-right:20px; }
        .agency-header { display:flex; align-items:center; margin-bottom:15px; }
        .agency-name { font-size:28px; font-weight:700; color:var(--text-dark); }
        .agency-desc { font-size:16px; color:var(--muted); margin-bottom:10px; }
        .contact { margin-bottom:10px; color:var(--text-dark); }
        .rating { font-weight:700; color:var(--primary); }
        .reviews { margin-top:20px; }
        .review-card { background:#fff; padding:15px; border-radius:var(--radius); box-shadow:0 6px 18px rgba(0,0,0,0.1); margin-bottom:12px; }
        .review-user { font-weight:600; color:var(--text-dark); margin-bottom:5px; }
        .review-comment { font-size:14px; color:var(--muted); }
        .packages-section {
    margin-top: 30px;
}

.packages-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
    margin-top: 15px;
}

.package-card {
    background: #fff;
    border-radius: var(--radius);
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    transition: transform 0.3s ease;
}

.package-card:hover {
    transform: translateY(-6px);
}

.package-img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}

.package-body {
    padding: 15px;
}

.package-title {
    font-size: 18px;
    font-weight: 700;
    color: var(--text-dark);
}

.package-desc {
    font-size: 14px;
    color: var(--muted);
    margin: 8px 0;
    height: 40px;
    overflow: hidden;
}

.package-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.package-price {
    font-weight: 700;
    color: var(--primary);
}

.view-btn {
    padding: 8px 14px;
    border-radius: 20px;
    background: var(--primary);
    color: #fff;
    text-decoration: none;
    font-size: 13px;
}
        
    </style>
</head>

<body>
<div class="container">

    <%
        AgencyDetailsDTO agency = (AgencyDetailsDTO) request.getAttribute("agency");
        if(agency != null) {
    %>
<img src="<%= agency.getBannerUrl() != null ? agency.getBannerUrl() : "https://img.freepik.com/premium-psd/travel-agency-banner-design-template_987701-5354.jpg" %>" alt="Agency Banner" class="banner">

    <!-- Agency Info -->
    <div class="agency-info">
        <div class="agency-header">
            <img src="<%= agency.getLogoUrl() %>" alt="Logo" class="agency-logo">
            <div>
                <div class="agency-name"><%= agency.getAgencyName() %></div>
                <div class="agency-desc"><%= agency.getDescription() %></div>
                <div class="contact">📍 <%= agency.getCity() %> | 📞 <%= agency.getPhone() %> | ✉️ <%= agency.getEmail() %></div>
                <div class="rating">⭐ Rating: <%= agency.getAvgRating() %> (<%= agency.getTotalReviews() %> reviews)</div>
            </div>
        </div>
    </div>

    <!-- Reviews -->
    <div class="reviews">
        <h3>Customer Reviews</h3>
        <%
            List<ReviewDTO> reviews = agency.getReviews();
            if(reviews != null && !reviews.isEmpty()) {
                for(ReviewDTO r : reviews) {
        %>
            <div class="review-card">
    <div class="review-user">
        <% 
            // Display userId instead of username
            String reviewer = "User " + r.getUserId(); 
            if(r.getCreatedAt() != null){
                reviewer += " | " + r.getCreatedAt().toLocalDateTime().toLocalDate();
            }
        %>
        <%= reviewer %> ⭐ <%= r.getRating() %>
    </div>
    <div class="review-comment"><%= r.getComment() %></div>
</div>

        <%
                }
            } else {
        %>
            <p>No reviews yet.</p>
        <%
            }
        %>
    </div>
    <!-- Packages -->
<div class="packages-section">
    <h3>Packages Offered</h3>

    <%
        List<Package> packages = agency.getPackages();
        if (packages != null && !packages.isEmpty()) {
    %>

    <div class="packages-grid">
        <%
            for (Package p : packages) {
        %>
        <div class="package-card">
            <img src="<%= p.getImageUrl() %>" class="package-img" alt="Package Image">

            <div class="package-body">
                <div class="package-title"><%= p.getDestination() %></div>
                <div class="package-desc"><%= p.getDescription() %></div>

                <div class="package-footer">
                    <div class="package-price">₹ <%= p.getPrice() %></div>
                    <a href="packageDetails?packageId=<%= p.getPackageId() %>" class="view-btn">
                        View Details
                    </a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

    <%
        } else {
    %>
        <p>No packages available for this agency.</p>
    <%
        }
    %>
</div>
    

<%
        } else {
%>
<p style="color:red; text-align:center;">Agency details not found.</p>
<%
        }
%>

</div>
</body>
</html>
