<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="section-title">Recent Bookings</div>

<div class="table-container fade-in">
  <table class="table">
    <thead>
      <tr>
        <th>Destination</th><th>Date</th><th>Passengers</th><th>Status</th><th>Price</th>
      </tr>
    </thead>
    <tbody>
      <!-- loop rows dynamically here -->
      <tr>
        <td>Paris</td><td>12 Jan 2025</td><td>2</td><td><span class="badge primary">Confirmed</span></td><td>₹28,999</td>
      </tr>
      <tr>
        <td>Bali</td><td>03 Mar 2025</td><td>4</td><td><span class="badge">Pending</span></td><td>₹34,499</td>
      </tr>
      <tr>
        <td>Tokyo</td><td>22 Feb 2025</td><td>1</td><td><span class="badge">Cancelled</span></td><td>₹45,200</td>
      </tr>
    </tbody>
  </table>
</div>


</body>
</html>