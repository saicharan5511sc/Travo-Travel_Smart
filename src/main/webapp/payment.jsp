<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <link rel="stylesheet" href="css/bookPackage.css">
</head>

<body>

<div class="container">

    <h1 class="page-title">Payment</h1>
    <p class="page-sub">Complete secure payment to confirm your trip</p>

    <form action="BookingServlet" method="post">

        <input type="hidden" name="step" value="payment">

        <div class="form-card">

            <h3 class="section-title">Select Payment Method</h3>

            <label><input type="radio" name="method" value="card" checked> Credit / Debit Card</label>
            <label><input type="radio" name="method" value="upi"> UPI</label>
            <label><input type="radio" name="method" value="netbanking"> Net Banking</label>

            <div class="payment-box">
                <label>Card Number</label>
                <input type="text" name="cardNumber" required>

                <label>Expiry Date</label>
                <input type="text" name="expiry" required>

                <label>CVV</label>
                <input type="password" name="cvv" required>
            </div>

        </div>

        <button type="submit" class="book-btn">Pay & Confirm</button>
    </form>

</div>

</body>
</html>
