<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travo – Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #5C2E91;
            --light-bg: #F9F6FF;
            --text-dark: #2c2450;
            --muted: #8b86a3;
            --radius: 18px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            background: var(--light-bg);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-card {
            width: 100%;
            max-width: 900px;
            background: #fff;
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
            animation: fadeInUp .8s ease;
        }

        @keyframes fadeInUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .welcome-box {
            background: var(--primary);
            color: #fff;
            padding: 60px 40px;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        .form-box img{
            width: 150px;
            filter: brightness(100%) drop-shadow(0 10px 20px rgba(0,0,0,0.2));
            position: relative;
            left: 30%;
            display: inline-block;
        }

        .welcome-box h1 {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .welcome-box p {
            font-size: 15px;
            line-height: 1.6;
            opacity: 0.95;
        }

        .form-box {
            padding: 60px 50px;
        }

        .form-box h2 {
            text-align: center;
            color: var(--text-dark);
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 35px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 6px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 14px;
            transition: 0.3s ease;
        }

        input:focus, select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(92, 46, 145, 0.18);
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s ease;
            box-shadow: 0 6px 18px rgba(92,46,145,0.25);
        }

        .btn:hover {
            background: #4a2477;
            transform: translateY(-2px);
        }

        .signup-link {
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
            color: var(--muted);
        }

        .signup-link a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 830px) {
            .login-card {
                grid-template-columns: 1fr;
            }
            .welcome-box {
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <div class="login-card">

        <div class="welcome-box">
            <h1>Welcome Back</h1>
            <p>
                Log in to continue trip planning, check bookings,  
                and explore new travel possibilities.
            </p>
        </div>

        <div class="form-box">
            <img src="./Assets/travo-removebg-preview.png" alt="Travo Logo">
            <h2>Login to Your Account</h2>

            <form action="LoginServlet" method="post">

                <div class="form-group">
                    <label>Email Address</label>
                    <input required type="email" name="email" placeholder="Enter your email">
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input required type="password" name="password" placeholder="Enter your password">
                </div>

            <!--   <div class="form-group">
                    <label>Role</label>
                    <select name="role">
                        <option value="User">User</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>-->

                <button class="btn">Login</button>
            </form>

            <div class="signup-link">
                New to Travo?
                <a href="Register.jsp">Create an account</a>
            </div>
        </div>

    </div>

</body>
</html>
