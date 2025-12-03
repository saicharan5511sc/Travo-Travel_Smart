<%@page import="java.util.List"%>
<%
List<String> offers = (List<String>) request.getAttribute("offers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Special Offers</title>
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
            color:white;
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

        .offers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .offer-card {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            height: 220px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 12px 35px rgba(92,46,145,0.15);
            color: white;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            background-size: cover;
            background-position: center;
        }

        .offer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(92,46,145,0.25);
        }

        .offer-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.4);
            z-index: 1;
        }

        .offer-main {
            position: relative;
            z-index: 2;
            display: flex;
            align-items: center;
            padding: 16px;
        }

        .offer-icon {
            margin-right: 14px;
        }

        .offer-content h4.offer-text {
            font-size: 1.2rem;
            font-weight: 700;
            margin: 0 0 4px 0;
        }

        .offer-content p.offer-subtext {
            font-size: 0.9rem;
            margin: 0;
        }

        .offer-btn {
            position: absolute;
            bottom: 16px;
            right: 16px;
            padding: 10px 18px;
            background: var(--primary);
            color:white;
            border: none;
            border-radius: 14px;
            font-weight: 600;
            cursor: pointer;
            z-index: 2;
            transition: background 0.3s, transform 0.3s;
        }

        .offer-btn:hover {
            background: #5b21b6;
            color:white;
            transform: translateY(-2px);
        }

        .empty-offer {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 180px;
            background: #eee;
            color: #555;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            border-radius: 18px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="section fade-in" style="margin-top: 40px;">
        <h3 class="section-title">Special Offers</h3>

        <div class="offers-grid">

            <% 
            if (offers != null && !offers.isEmpty()) { 
                int index = 0;
                for(String offer : offers) { 

                    String[] bgImages = {
                        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80",
                        "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=1200&q=80",
                        "https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef?w=1200&q=80",
                        "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGFyaXN8ZW58MHx8MHx8fDA%3D"
                    };
                    
                    String img = bgImages[index % bgImages.length];
                    index++;
            %>

            <div class="offer-card" style="background-image: url('<%= img %>');">
                <div class="offer-overlay"></div>

                <div class="offer-main">
                    <div class="offer-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="white">
                            <path d="M12 2C6.49 2 2 6.49 2 12s4.49 
                                  10 10 10 10-4.49 10-10S17.51 2 
                                  12 2zm-4 11c-.55 0-1-.45-1-1s.45-1 
                                  1-1 1 .45 1 1-.45 1-1 1zm1.5 4h5c.28 
                                  0 .5.22.5.5s-.22.5-.5.5h-5a.5.5 0 
                                  1 1 0-1zm5.5-6c-.55 0-1-.45-1-1s.45-1 
                                  1-1 1 .45 1 1-.45 1-1 1z"/>
                        </svg>
                    </div>

                    <div class="offer-content">
                        <h4 class="offer-text"><%= offer %></h4>
                        <p class="offer-subtext">Grab exclusive savings for a limited time.</p>
                    </div>
                </div>

                <button class="offer-btn">Claim Deal</button>
            </div>

            <% } 
            } else { %>

            <div class="offer-card empty-offer">
                <div class="offer-content">
                    <h4 class="offer-text">No offers at the moment</h4>
                    <p class="offer-subtext">Check back soon for new deals</p>
                </div>
            </div>

            <% } %>

        </div>
    </div>
</div>

</body>
</html>
