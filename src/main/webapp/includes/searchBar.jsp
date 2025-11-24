<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.travoapp.model.dto.Users"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Users user=(Users)session.getAttribute("users"); %>
<div class="hero fade-in" role="region" aria-label="Search hero">
  <div class="hero-left">
    <div class="hero-title"> Welcome back, <%= user.getName()%></br> Where would you like to go next?</div>
    <div class="hero-sub">Search 1,000+ destinations, compare offers and plan your trip.</div>

    <div class="search-row" style="margin-top:18px;">
      <!-- make action to SearchServlet when dynamic -->
      <input class="input" type="text" id="q" placeholder="Search destination • ex: Paris, Bali, Tokyo">
      <select class="input" id="tripType">
        <option value="">Trip type (all)</option>
        <option value="solo">Solo</option>
        <option value="family">Family</option>
        <option value="agency">Agency</option>
      </select>
      <input class="input" type="date" id="date">
      <button class="btn search-btn" onclick="doSearch()">Search</button>
    </div>

    <div style="margin-top:14px;display:flex;gap:8px;flex-wrap:wrap;">
      <span class="filter-pill">Budget</span>
      <span class="filter-pill">Adventure</span>
      <span class="filter-pill">Luxury</span>
      <span class="filter-pill">Family</span>
    </div>
  </div>

  <!-- hero right: quick overview cards -->
  <div style="width:360px;display:flex;flex-direction:column;gap:12px">
    <div class="card stat-card">
      <div class="kicker">Recommended for you</div>
      <div style="display:flex;align-items:center;justify-content:space-between">
        <div>
          <div style="font-weight:800">Bali — Beach Escape</div>
          <div class="kicker" style="margin-top:6px">7 days • starting ₹34,499</div>
        </div>
        <div class="badge primary">Top</div>
      </div>
    </div>

    <div class="card stat-card center">
      <div class="kicker">Limited Offer</div>
      <div style="font-size:18px;font-weight:800;color:var(--primary)">25% OFF Winter Sale</div>
      <div class="kicker">Use code: TRAVOWINTER</div>
    </div>
  </div>
</div>

<script>
  function doSearch(){
    const q = document.getElementById('q').value || '';
    const type = document.getElementById('tripType').value || '';
    const date = document.getElementById('date').value || '';
    // TODO: Replace alert with real redirect to SearchServlet:
    // window.location.href = `${pageContext.request.contextPath}/SearchServlet?q=${encodeURIComponent(q)}&type=${type}&date=${date}`;
    alert('Search (demo): ' + q + ' / ' + type + ' / ' + date);
  }
</script>


</body>
</html>