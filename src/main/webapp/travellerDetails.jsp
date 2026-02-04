<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.travoapp.model.dto.Users"%>
<%@page import="com.travoapp.model.dto.Package"%>
<%@page import="com.travoapp.model.dto.TravellerDetails"%>

<%
Integer packageId = (Integer) session.getAttribute("packageId");
if (packageId == null) {
    response.sendRedirect("error.jsp");
    return;
}
   
    List<TravellerDetails> tList = (List<TravellerDetails>) request.getAttribute("travellerlist");
    String travelDate = (String) session.getAttribute("travelDate"); // Get travel date from session
%>

<!DOCTYPE html>
<html>
<head>
    <title>Traveller Details</title>

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
            max-width: 900px;
            margin: 40px auto;
        }

        .page-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .page-sub {
            color: #555;
            margin-bottom: 30px;
        }

        .form-card {
            background: var(--card-bg);
            padding: 25px;
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: 0 10px 25px rgba(109, 40, 217, 0.12);
            margin-bottom: 25px;
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
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
        }

        input, select, textarea {
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        .add-btn {
            background: #eee2ff;
            border: 1px solid var(--primary);
            padding: 12px 20px;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .book-btn {
            width: 100%;
            background: var(--primary);
            color: white;
            padding: 14px;
            border-radius: 14px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .traveller-item {
            display: flex;
            justify-content: space-between;
            padding: 18px;
            border-radius: 14px;
            background: #faf8ff;
            border: 1px solid var(--border);
            margin-bottom: 15px;
        }

        .traveller-actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .action-btn {
            padding: 10px 16px;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            border: none;
        }

        .action-btn.update {
            background: #e9dcff;
            color: var(--primary);
            border: 1px solid var(--primary);
        }

        .action-btn.delete {
            background: #ffe6ea;
            color: #d62041;
            border: 1px solid #d62041;
        }

        .travel-date {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #4b4b4b;
        }

    </style>

</head>
<body>

<div class="container">

    <!-- SHOW SELECTED TRAVEL DATE -->
    <% if(travelDate != null) { %>
        <p class="travel-date">Selected Travel Date: <strong><%= travelDate %></strong></p>
    <% } %>

    <!-- SHOW EXISTING TRAVELLERS -->
    <% if (tList != null && !tList.isEmpty()) { %>
        <div class="form-card">
            <h2 class="section-title">Added Travellers</h2>

            <% for (TravellerDetails t : tList) { %>
                <div class="traveller-item">
                    <div class="traveller-info">
                        <h3><%= t.getFullname() %></h3>
                        <p><strong>Age:</strong> <%= t.getAge() %></p>
                        <p><strong>Gender:</strong> <%= t.getGender() %></p>
                        <p><strong>ID Proof:</strong> <%= t.getIdproof() %> — <%= t.getIdnumber() %></p>
                        <p><strong>Medical Notes:</strong>
                            <%= (t.getMedicalconditions() == null || t.getMedicalconditions().trim().isEmpty()) ? "None" : t.getMedicalconditions() %>
                        </p>
                    </div>

                    <div class="traveller-actions">

                        <!-- UPDATE -->
                        <form action="TravellerEditForm" method="get">
                            <input type="hidden" name="traveller_id" value="<%= t.getTravellerId()  %>">
                            <input type="hidden" name="package_id" value="<%= packageId %>">
                            <button class="action-btn update">Update</button>
                        </form>

                        <!-- DELETE -->
                        <form action="deletetraveller" method="get"
                            onsubmit="return confirm('Are you sure you want to delete this traveller?');">

                            <input type="hidden" name="traveller_id" value="<%= t.getTravellerId()  %>">
                            <input type="hidden" name="package_id" value="<%= packageId %>">

                            <button class="action-btn delete">Delete</button>
                        </form>

                    </div>
                </div>
            <% } %>

        </div>
    <% } %>

    <!-- ADD TRAVELLER FORM -->
    <h1 class="page-title">Traveller Information</h1>
    <p class="page-sub">Enter details of all travellers to continue</p>

    <form action="addtraveller" method="post">

        <input type="hidden" name="package_id" value="<%=packageId %>">
        <input type="hidden" name="travelDate" value="<%= travelDate %>">

        <div class="form-card">
            <h2 class="section-title">Add Traveller</h2>

            <div class="form-row">
                <div>
                    <label>Full Name</label>
                    <input type="text" name="name" required>
                </div>

                <div>
                    <label>Age</label>
                    <input type="number" name="age" min="1" required>
                </div>

                <div>
                    <label>Gender</label>
                    <select name="gender" required>
                        <option value="">Select</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label>ID Proof Type</label>
                    <select name="id_type" required>
                        <option value="">Select</option>
                        <option>Aadhar</option>
                        <option>Passport</option>
                        <option>Driving License</option>
                        <option>Voter ID</option>
                    </select>
                </div>

                <div>
                    <label>ID Number</label>
                    <input type="text" name="id_no" required>
                </div>
            </div>

            <label>Medical Conditions / Special Requests</label>
            <textarea name="notes"></textarea>

            <button type="submit" class="add-btn">+ Add Traveller</button>
        </div>
    </form>

    <a href="summary.jsp?packageId=<%= packageId %>&travelDate=<%= travelDate %>" class="book-btn">
    Proceed to Summary
</a>
</div>

</body>
</html>
