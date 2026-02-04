<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Traveller Details</title>
<style>
    :root {
        --primary: #6d28d9;
        --light-bg: #f6f2ff;
        --card-bg: #ffffff;
        --text-dark: #2d2743;
        --border: #d7c9f3;
    }

    body {
        margin: 0;
        padding: 0;
        background: var(--light-bg);
        font-family: "Poppins", sans-serif;
        color: var(--text-dark);
    }

    .container {
        width: 90%;
        max-width: 600px;
        margin: 40px auto;
    }

    h1 {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 10px;
    }

    form {
        background: var(--card-bg);
        padding: 25px;
        border-radius: 16px;
        border: 1px solid var(--border);
        box-shadow: 0 10px 25px rgba(109, 40, 217, 0.12);
        animation: fade 0.4s ease;
    }

    @keyframes fade {
        from { opacity: 0; transform: translateY(10px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .form-row {
        display: flex;
        gap: 18px;
        margin-bottom: 15px;
        flex-wrap: wrap;
    }

    label {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
    }

    input, select, textarea {
        width: 100%;
        padding: 12px 14px;
        border-radius: 12px;
        border: 1px solid #ccc;
        font-size: 1rem;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        min-height: 80px;
    }

    .update-btn {
        width: 100%;
        background: var(--primary);
        color: white;
        padding: 14px;
        border-radius: 14px;
        font-size: 1.1rem;
        font-weight: 700;
        cursor: pointer;
        border: none;
        margin-top: 15px;
    }

    .update-btn:hover {
        background: #5b21b6;
    }

</style>

</head>
<body>
<%
    com.travoapp.model.dto.TravellerDetails traveller = 
        (com.travoapp.model.dto.TravellerDetails) request.getAttribute("traveller");
    int packageId = (Integer) request.getAttribute("packageId");
%>

<div class="container">
    <h1>Edit Traveller Details</h1>

    <form action="TravellerUpdateServlet" method="post">

        <input type="hidden" name="traveller_id" value="<%= traveller.getTravellerId() %>">
        <input type="hidden" name="package_id" value="<%= packageId %>">

        <div class="form-row">
            <div>
                <label>Full Name</label>
                <input type="text" name="name" value="<%= traveller.getFullname() %>" required>
            </div>
            <div>
                <label>Age</label>
                <input type="number" name="age" value="<%= traveller.getAge() %>" min="1" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label>Gender</label>
                <select name="gender" required>
                    <option value="Male" <%= "Male".equals(traveller.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(traveller.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(traveller.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div>
                <label>ID Proof Type</label>
                <select name="id_type" required>
                    <option value="Aadhar" <%= "Aadhar".equals(traveller.getIdproof()) ? "selected" : "" %>>Aadhar</option>
                    <option value="Passport" <%= "Passport".equals(traveller.getIdproof()) ? "selected" : "" %>>Passport</option>
                    <option value="Driving License" <%= "Driving License".equals(traveller.getIdproof()) ? "selected" : "" %>>Driving License</option>
                    <option value="Voter ID" <%= "Voter ID".equals(traveller.getIdproof()) ? "selected" : "" %>>Voter ID</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label>ID Number</label>
                <input type="text" name="id_no" value="<%= traveller.getIdnumber() %>" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label>Medical Conditions / Notes</label>
                <textarea name="notes"><%= traveller.getMedicalconditions() %></textarea>
            </div>
        </div>

        <button type="submit" class="update-btn">Update Traveller</button>
    </form>
</div>

</body>
</html>
