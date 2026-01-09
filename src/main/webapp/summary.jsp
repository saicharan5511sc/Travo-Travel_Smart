<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.travoapp.model.dto.Package"%>
<%@ page import="com.travoapp.model.dto.TravellerDetails"%>
<%@ page import="com.travoapp.model.dto.Users"%>
<%@ page import="com.travoapp.model.dao.PackageDAO"%>
<%@ page import="com.travoapp.model.dao.PackageDAOImpl"%>
<%@ page import="java.util.List"%>

<%
    Users user = (Users) session.getAttribute("users");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer packageId = (Integer) session.getAttribute("packageId");
    if (packageId == null) {
        response.sendRedirect("error.jsp");
        return;
    }
    String travelDate = (String) session.getAttribute("travelDate"); // from package details selection

    // Fetch package details
    PackageDAO packageDAO = new PackageDAOImpl();
    Package pkg = packageDAO.getPackageById(packageId);
    if (pkg == null) {
        out.println("<h2>Package not found!</h2>");
        return;
    }

    // Fetch traveller list (reuse existing logic)
    com.travoapp.model.dao.TravellerDetailsDAO tDao = new com.travoapp.model.dao.TravellerDetailsDAOImpl();
    List<TravellerDetails> tList = tDao.getTravellerDetails(user.getUserId(), packageId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Summary</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f6f2ff; color: #2d2743; margin:0; padding:0; }
        .container { width: 90%; max-width: 900px; margin: 40px auto; }
        .card { background: #fff; padding: 25px; border-radius: 16px; margin-bottom: 20px; box-shadow: 0 10px 25px rgba(109, 40, 217, 0.12); }
        h2 { margin-bottom: 15px; }
        .traveller-item { padding: 12px; border-radius: 12px; background: #faf8ff; border: 1px solid #d7c9f3; margin-bottom: 10px; }
        .summary-row { display: flex; justify-content: space-between; margin-bottom: 10px; }
        .book-btn { width: 100%; background: #6d28d9; color: white; padding: 14px; border-radius: 14px; font-size: 1.1rem; font-weight: 700; cursor: pointer; border:none; }
    </style>
</head>
<body>

<div class="container">
    <h1>Booking Summary</h1>

    <!-- Package Info -->
    <div class="card">
        <h2>Package: <%= pkg.getDestination() %></h2>
        <p><strong>Description:</strong> <%= pkg.getDescription() %></p>
        <p><strong>Price per person:</strong> ₹<%= pkg.getPrice() %></p>
        <p><strong>Selected Travel Date:</strong> <%= travelDate %></p>
    </div>

    <!-- Traveller Info -->
    <div class="card">
        <h2>Travellers</h2>
        <% if (tList != null && !tList.isEmpty()) { 
            for (TravellerDetails t : tList) { %>
                <div class="traveller-item">
                    <p><strong>Name:</strong> <%= t.getFullname() %></p>
                    <p><strong>Age:</strong> <%= t.getAge() %></p>
                    <p><strong>Gender:</strong> <%= t.getGender() %></p>
                    <p><strong>ID:</strong> <%= t.getIdproof() %> - <%= t.getIdnumber() %></p>
                    <p><strong>Medical Notes:</strong> <%= (t.getMedicalconditions()==null || t.getMedicalconditions().isEmpty()) ? "None" : t.getMedicalconditions() %></p>
                </div>
        <%  } 
        } else { %>
            <p>No travellers added yet!</p>
        <% } %>
    </div>

    <!-- Price Summary -->
    <div class="card">
        <h2>Price Summary</h2>
        <div class="summary-row">
            <span>Base Price (per person):</span>
            <span>₹<%= pkg.getPrice() %></span>
        </div>
        <div class="summary-row">
            <span>Total Travellers:</span>
            <span><%= tList.size() %></span>
        </div>
        <div class="summary-row">
            <strong>Total Amount:</strong>
            <strong>₹<%= pkg.getPrice() * tList.size() %></strong>
        </div>

        <!-- Confirm Booking -->
        <form action="BookingServlet" method="post">
            <input type="hidden" name="packageId" value="<%= packageId %>">
            <input type="hidden" name="travelDate" value="<%= travelDate %>">
            <button type="submit" class="book-btn">Confirm Booking</button>
        </form>
    </div>
</div>

</body>
</html>
