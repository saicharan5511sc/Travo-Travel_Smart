<%@page import="com.travoapp.model.dto.Users"%>
<%@ page import="java.util.*, com.travoapp.model.dto.Package" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Travo – Packages</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet" />

    <style>
        :root {
            --primary: #5C2E91;
            --light-bg: #F9F6FF;
            --text-dark: #2c2450;
            --muted: #8b86a3;
            --radius: 16px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            background: var(--light-bg);
            padding: 25px 0;
        }

        .container {
            width: 90%;
            max-width: 1300px;
            margin: auto;
        }

        .title {
            text-align: center;
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 10px;
            color: var(--text-dark);
        }

        .subtitle {
            text-align: center;
            color: var(--muted);
            margin-bottom: 40px;
        }

        .package-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }

        .package-card {
            background: #fff;
            border-radius: var(--radius);
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            overflow: hidden;
            animation: fadeIn 0.7s ease;
            display: flex;
            flex-direction: column;
        }

        @keyframes fadeIn {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .pkg-img img {
            width: 100%;
            height: 170px;
            object-fit: cover;
            transition: 0.4s ease;
        }

        .pkg-img img:hover {
            transform: scale(1.07);
        }

        .pkg-content {
            padding: 18px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .pkg-title {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .pkg-desc {
            font-size: 14px;
            color: var(--muted);
            height: 45px;
            overflow: hidden;
        }

        .pkg-footer {
            margin-top: auto;
            display: flex;
            justify-content: space-between;
            padding-top: 10px;
            align-items: center;
        }

        .price {
            color: var(--primary);
            font-size: 20px;
            font-weight: 800;
        }

        .book-btn {
            padding: 10px 14px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 14px;
            cursor: pointer;
            box-shadow: 0 6px 18px rgba(92,46,145,0.25);
            transition: 0.3s ease;
        }

        .book-btn:hover {
            transform: translateY(-2px);
            background: #492275;
        }
        .nullbook{
        display: flex;
        }
        
    </style>
</head>

<body>

<div class="container">

    <h1 class="title">Available Travel Packages</h1>
    <p class="subtitle">Choose the perfect travel package crafted for your journey</p>

    <div class="package-grid">

        <%
            List<Package> packageList = (List<Package>) request.getAttribute("packageList");
            if (packageList != null) {
                for (Package pkg : packageList) {
        %>

        <div class="package-card">

            <div class="pkg-img">
                <img src="<%= pkg.getImageUrl() %>" alt="Package Image" />
            </div>

            <div class="pkg-content">
                <h3 class="pkg-title"><%= pkg.getDestination() %></h3>

                <p class="pkg-desc"><%= pkg.getDescription() %></p>

                <div class="pkg-footer">
                    <div class="price">₹<%= pkg.getPrice() %></div>

<% Users u=(Users)session.getAttribute("users");
if(u==null){
	%>
	<form action="Login.jsp" method="post">
                        <input type="hidden" name="packageId" value="<%= pkg.getPackageId() %>">
                       <button class="book-btn">Book Now</button>
                    </form></div>

            </div>

        </div>
       <%         

}else{
%>
                    <form action="packageDetails" method="get">
                        <input type="hidden" name="packageId" value="<%= pkg.getPackageId() %>">
                        <input type="hidden" name="packageimg" value="<%= pkg.getImageUrl() %>">
                       <button class="book-btn">Book Now</button>
                    </form>
                </div>

            </div>

        </div>

        <%
}
                }
            } else {
        %>

        <p style="text-align:center; color:red;">No packages found.</p>

        <%
            }
        %>

    </div>

</div>

</body>
</html>
