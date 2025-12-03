<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmed</title>
    <link rel="stylesheet" href="css/bookPackage.css">
</head>

<body>

<div class="container">

    <h1 class="page-title">🎉 Booking Confirmed!</h1>
    <p class="page-sub">Your Bali trip is officially booked.</p>

    <div class="success-card">
        <h2>Thank you, <%= request.getAttribute("name") %>!</h2>
        <p>Your booking ID is:</p>
        <h3>#<%= request.getAttribute("bookingId") %></h3>
        <p>A confirmation email has been sent to:</p>
        <strong><%= request.getAttribute("email") %></strong>
    </div>

    <a href="dashboard.jsp" class="book-btn">Go to Dashboard</a>

</div>

</body>
</html>
