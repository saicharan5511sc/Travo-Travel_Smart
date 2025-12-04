<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="edit" method="post">

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

        <!-- OTHER TRAVELLERS
        <h2 class="section-title">Additional Travellers</h2>

        <div id="travellersContainer"></div>

        <button type="button" class="add-btn" onclick="addTraveller()">+ Add Traveller</button>

        <button type="submit" class="book-btn">Proceed to Payment</button>-->

    </form>


</body>
</html>