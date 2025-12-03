<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Top Travel Agencies</title>
    <style>
        :root {
            --primary: #6d28d9;
            --light-bg: #f7f2ff;
            --text-dark: #2d2743;
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

        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 20px;
        }

        .agency-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .agency-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .agency-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .agency-logo {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .agency-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 6px;
            color: var(--text-dark);
        }

        .kicker {
            font-size: 0.95rem;
            color: #555;
            margin-bottom: 12px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn.ghost {
            background: none;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn.ghost:hover {
            background: var(--primary);
            color: #fff;
        }

        @media(max-width: 900px) {
            .agency-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media(max-width: 600px) {
            .agency-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="section fade-in">
        <h3 class="section-title">Top Travel Agencies</h3>

        <div class="agency-grid">

            <div class="agency-card">
                <img class="agency-logo" src="https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?w=200&q=60&auto=format&fit=crop" alt="SOTC Travel">
                <div class="agency-info">
                    <div class="agency-name">SOTC Travel</div>
                    <div class="kicker">⭐ 4.8 · Packages from ₹35,000</div>
                </div>
                <button class="btn ghost">Explore More</button>
            </div>

            <div class="agency-card">
                <img class="agency-logo" src="https://cdn.prod.website-files.com/65e76740607a710e8e5a7d0f/662c09367f8ef4db2e8fbe71_razones-agencia-de-viajes-corporativos.jpeg.webp" alt="Thomas Cook">
                <div class="agency-info">
                    <div class="agency-name">SRS</div>
                    <div class="kicker">⭐ 4.7 · Packages from ₹29,000</div>
                </div>
                <button class="btn ghost">Explore More</button>
            </div>

            <div class="agency-card">
                <img class="agency-logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZe9p-hOn_8JThMagZ5UIBQoTeXWiBGOv_mQ&s" alt="Veena World">
                <div class="agency-info">
                    <div class="agency-name">Manikanta Travellers</div>
                    <div class="kicker">⭐ 4.8 · Packages from ₹25,000</div>
                </div>
                <button class="btn ghost">Explore More</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
