<%@page import="com.travoapp.model.dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Travo — Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/dashboard.css">
</head>

<body>

<%
Users u = (Users) session.getAttribute("users");
if(u == null){
%>
    <script>alert("PLEASE LOGIN");</script>
<%
    request.getRequestDispatcher("Login.jsp").include(request, response);
    return;
}
%>

<div class="container">

  <!-- ============================
       NAVBAR
  ============================= -->
  <header class="navbar fade-in">
  
      <!-- LEFT -->
      <div class="nav-left">
        <img class="logo" src="./Assets/travo-removebg-preview.png" alt="Travo Logo">
      </div>

      <!-- MIDDLE LINKS -->
      <nav class="nav-links">
        <a href="<%= request.getContextPath() %>/packages">Packages</a>
        <a href="#">Bookings</a>
        <a href="#">Agencies</a>
      </nav>

      <!-- RIGHT PROFILE -->
      <div class="nav-right">

        <div class="profile-wrapper">
          <div class="profile-avatar" onclick="toggleProfileMenu()">
            <%= u.getName().charAt(0) %>
          </div>

          <div id="profileMenu" class="profile-menu hidden">
            <div class="profile-item title"><%= u.getName() %></div>
            <hr>
            <a class="profile-item" href="profile.jsp">View Profile</a>
            <a class="profile-item" href="#">Settings</a>
            <a class="profile-item logout" href="LogoutServlet">Logout</a>
          </div>
        </div>

      </div>
  </header>



  <%@ include file="includes/searchBar.jsp" %>

 
  <%@ include file="includes/stats.jsp" %>


  <%@ include file="includes/upcomingTrips.jsp" %>


  <%@ include file="includes/recommended.jsp" %>


  <%@ include file="includes/popularDestinations.jsp" %>

  <%@ include file="includes/offers.jsp" %>

 
  <%@ include file="includes/topAgencies.jsp" %>


  <%@ include file="includes/recentBookings.jsp" %>

</div>


<script>
  function toggleProfileMenu(){
      document.getElementById("profileMenu").classList.toggle("hidden");
  }

  document.addEventListener("click", function(e){
      if(!e.target.closest(".profile-wrapper")){
          document.getElementById("profileMenu").classList.add("hidden");
      }
  });
</script>

</body>
</html>
