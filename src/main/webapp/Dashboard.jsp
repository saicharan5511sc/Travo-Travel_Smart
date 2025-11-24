<%@page import="com.travoapp.model.dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Travo — Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
<%
Users u=(Users)session.getAttribute("users");
if(u==null){
	%>
	<script type="text/javascript">
	alert("PLEASE LOGIN");
	</script>
	<% 
	request.getRequestDispatcher("Login.jsp").include(request, response);
	return;
}
%>
  <div class="container">

    <!-- NAVBAR -->
    <header class="navbar fade-in">
      <div class="nav-left">
        <!-- local logo (use your uploaded path) -->
        <img class="logo" src="./Assets/travo-removebg-preview.png" alt="Travo Logo">
      </div>

      <div class="nav-links">
        <a href="<%= request.getContextPath() %>/packages">Packages</a>
        <a href="#">Bookings</a>
        <a href="#">Agencies</a>
        <a href="#">Profile</a>
      </div>

      <div class="top-controls">
        <button class="btn ghost">Export</button>
        <button class="btn">Create Booking</button>
      </div>
    </header>

    <!-- include sections -->
    <%@ include file="includes/searchBar.jsp" %>
    <%@ include file="includes/stats.jsp" %>
    <%@ include file="includes/popularDestinations.jsp" %>
    <%@ include file="includes/offers.jsp" %>
    <%@ include file="includes/tripPlans.jsp" %>
    <%@ include file="includes/topAgencies.jsp" %>
    <%@ include file="includes/recommended.jsp" %>
    <%@ include file="includes/upcomingTrips.jsp" %>
    <%@ include file="includes/travelGuide.jsp" %>
    <%@ include file="includes/recentBookings.jsp" %>

  </div>

</body>
</html>
