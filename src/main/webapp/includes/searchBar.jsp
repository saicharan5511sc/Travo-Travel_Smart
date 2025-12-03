<%@page import="com.travoapp.model.dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Users user = (Users) session.getAttribute("users");
    String username = (user != null) ? user.getName() : "Traveler";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Welcome, <%= username %></title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<style>
:root {
    --primary: #6d28d9;
    --light-bg: #f7f2ff;
    --text-dark: #2d2743;
    --input-bg: #f1f1f5;
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

/* SEARCHBAR CARD */
.searchbar-section {
    background: #fff;
    padding: 25px 30px;
    border-radius: 20px;
    box-shadow: 0 12px 35px rgba(92,46,145,0.15);
    margin-bottom: 40px;
    transition: all 0.3s ease;
}

.searchbar-section.fade-in {
    opacity: 0;
    animation: fadeIn 1s forwards;
}

@keyframes fadeIn { to { opacity: 1; } }

.searchbar-header {
    margin-bottom: 20px;
}

.searchbar-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 5px;
}

.searchbar-sub {
    font-size: 1rem;
    color: #555;
}

/* INPUT GRID */
.searchbar-form {
    display: grid;
    grid-template-columns: 1fr 1fr auto;
    gap: 15px;
    align-items: center;
}

.searchbar-input {
    padding: 12px 18px;
    font-size: 1rem;
    border: 1px solid #ddd;
    border-radius: 14px;
    outline: none;
    background: var(--input-bg);
    transition: border 0.3s, box-shadow 0.3s;
    width: 100%;
}

.searchbar-input:focus {
    border-color: var(--primary);
    box-shadow: 0 0 10px rgba(109, 40, 217, 0.2);
}

/* Icons inside input */
.input-wrapper {
    position: relative;
}

.input-wrapper i {
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    color: #888;
}

.searchbar-input.with-icon {
    padding-left: 36px;
}

.searchbar-btn {
    padding: 12px 25px;
    background: var(--primary);
    color: #fff;
    font-size: 1rem;
    font-weight: 600;
    border: none;
    border-radius: 14px;
    cursor: pointer;
    transition: 0.3s;
}

.searchbar-btn:hover {
    background: #5b21b6;
    transform: translateY(-2px);
}

@media(max-width: 768px) {
    .searchbar-form {
        grid-template-columns: 1fr;
    }
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="container">

    <div class="searchbar-section fade-in">
        <div class="searchbar-header">
            <h2 class="searchbar-title">Welcome back, <%= username %> 👋</h2>
            <p class="searchbar-sub">Plan your next adventure with ease</p>
        </div>

        <form class="searchbar-form" action="SearchResults.jsp" method="get">
            <div class="input-wrapper">
                <i class="fa fa-location-dot"></i>
                <input class="searchbar-input with-icon" type="text" name="from" placeholder="From " required>
            </div>
            <div class="input-wrapper">
                <i class="fa fa-map-marker-alt"></i>
                <input class="searchbar-input with-icon" type="text" name="to" placeholder="To" required>
            </div>
            <button type="submit" class="searchbar-btn"><i class="fa fa-search"></i> Search</button>
        </form>

    </div>

</div>

</body>
</html>
