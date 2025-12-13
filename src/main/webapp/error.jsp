<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Oops! Something Went Wrong | Travo</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #5C2E91;
            --primary-light: #7A44D1;
            --bg: #F4F0FF;
            --surface: #FFFFFF;
            --text: #1F1530;
            --muted: #7A6E90;
        }

        body {
            margin: 0;
            background: var(--bg);
            font-family: "Poppins", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .error-container {
            background: var(--surface);
            padding: 40px 50px;
            width: min(550px, 90%);
            border-radius: 20px;
            box-shadow: 0 18px 45px rgba(92, 46, 145, 0.15);
            animation: fadeIn 0.4s ease;
        }

        .error-img {
            width: 260px;
            margin-bottom: 20px;
            opacity: 0.9;
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--primary);
        }

        p {
            font-size: 15px;
            color: var(--muted);
            margin-bottom: 25px;
        }

        .error-box {
            background: #f8f4ff;
            padding: 14px 18px;
            border-left: 4px solid var(--primary);
            border-radius: 10px;
            font-size: 13px;
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            display: none;
        }

        .btn {
            padding: 12px 28px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: 600;
            background: var(--primary);
            color: white;
            cursor: pointer;
            transition: 0.25s;
        }

        .btn:hover {
            background: var(--primary-light);
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        .small {
            margin-top: 15px;
            font-size: 13px;
            color: #aaa;
        }
    </style>

</head>

<body>

<div class="error-container">

    <img class="error-img" 
         src="https://cdn.dribbble.com/users/730703/screenshots/6581243/avento.gif" 
         alt="Error">

    <h1>Oops! Something Went Wrong</h1>

    <p>We couldn't process your request at the moment. Please try again later.</p>

    <div id="errBox" class="error-box">
        <%= request.getAttribute("errorMessage") != null 
            ? request.getAttribute("errorMessage") 
            : "" %>
    </div>

    <button class="btn" onclick="window.location.href='index.jsp'">Go Back Home</button>

    <div class="small">Error Code: <%= request.getAttribute("errorCode") != null ? request.getAttribute("errorCode") : "500" %></div>
</div>

<script>

    const errMsg = `<%= request.getAttribute("errorMessage") %>`;
    if (errMsg && errMsg.trim() !== "null") {
        document.getElementById("errBox").style.display = "block";
    }
</script>

</body>
</html>
