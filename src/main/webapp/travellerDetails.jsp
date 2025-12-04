<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Traveller Details</title>

    <style>
        /* ---------- ROOT THEMES ---------- */
        :root {
            --primary: #6d28d9;
            --light-bg: #f6f2ff;
            --card-bg: #ffffff;
            --text-dark: #2d2743;
            --border: #d7c9f3;
        }

        /* ---------- BODY ---------- */
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

        /* ---------- HEADER ---------- */
        .page-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .page-sub {
            color: #555;
            margin-bottom: 30px;
        }

        /* ---------- FORM ---------- */
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

        .section-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin: 20px 0 15px 0;
        }

        /* ---------- ROWS ---------- */
        .form-row {
            display: flex;
            gap: 18px;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
        }

        input, select, textarea {
            padding: 12px 14px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 12px;
            outline: none;
            transition: 0.25s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 8px rgba(109, 40, 217, 0.25);
        }

        textarea {
            resize: none;
            min-height: 80px;
        }

        /* ---------- BUTTONS ---------- */
        .add-btn {
            background: #eee2ff;
            border: 1px solid var(--primary);
            padding: 12px 20px;
            border-radius: 12px;
            font-size: 1rem;
            cursor: pointer;
            font-weight: 600;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .add-btn:hover {
            background: var(--primary);
            color: white;
        }

        .book-btn {
            width: 100%;
            background: var(--primary);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 14px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 30px;
            transition: 0.3s;
        }

        .book-btn:hover {
            background: #5b21b6;
            transform: translateY(-2px);
        }

        /* ---------- RESPONSIVE ---------- */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>

</head>
<body>

<div class="container">

    <h1 class="page-title">Traveller Information</h1>
    <p class="page-sub">Enter details of all travellers to continue</p>

    <form action="BookingServlet" method="post">

        <input type="hidden" name="step" value="traveller">

        <!-- LEAD TRAVELLER -->
        <div class="traveller-section">

            <h2 class="section-title">Lead Traveller Details</h2>

            <div class="form-card">

                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="lead_name" required>
                    </div>

                    <div class="form-group">
                        <label>Age</label>
                        <input type="number" name="lead_age" min="1" required>
                    </div>

                    <div class="form-group">
                        <label>Gender</label>
                        <select name="lead_gender" required>
                            <option value="">Select</option>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

       

                   <!--   <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" name="lead_phone" required>
                    </div>
                </div>-->

                <div class="form-row">
                    <div class="form-group">
                        <label>ID Proof Type</label>
                        <select name="lead_id_type" required>
                            <option value="">Select</option>
                            <option>Aadhar</option>
                            <option>Passport</option>
                            <option>Driving License</option>
                            <option>Voter ID</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>ID Number</label>
                        <input type="text" name="lead_id_no" required>
                    </div>
                </div>

                <label>Medical Conditions / Special Requests</label>
                <textarea name="lead_notes"></textarea>

            </div>
        </div>

        <!-- OTHER TRAVELLERS -->
        <h2 class="section-title">Additional Travellers</h2>

        <div id="travellersContainer"></div>

        <button type="button" class="add-btn" onclick="addTraveller()">+ Add Traveller</button>

        <button type="submit" class="book-btn">Proceed to Payment</button>

    </form>

</div>


<script>
let travellerCount = 0;

function addTraveller() {
    travellerCount++;

    const container = document.getElementById("travellersContainer");

    const card = document.createElement("div");
    card.classList.add("form-card");

    card.innerHTML = `
        <h3 style="margin-bottom: 12px;">Traveller ${travellerCount}</h3>

        <div class="form-row">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="t${travellerCount}_name" required>
            </div>

            <div class="form-group">
                <label>Age</label>
                <input type="number" name="t${travellerCount}_age" min="1" required>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <select name="t${travellerCount}_gender" required>
                    <option value="">Select</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>ID Proof Type</label>
                <select name="t${travellerCount}_id_type" required>
                    <option value="">Select</option>
                    <option>Aadhar</option>
                    <option>Passport</option>
                    <option>Driving License</option>
                    <option>Voter ID</option>
                </select>
            </div>

            <div class="form-group">
                <label>ID Number</label>
                <input type="text" name="t${travellerCount}_id_no" required>
            </div>
        </div>

        <label>Medical Conditions / Notes</label>
        <textarea name="t${travellerCount}_notes"></textarea>
    `;

    container.appendChild(card);
}
</script>

</body>
</html>
