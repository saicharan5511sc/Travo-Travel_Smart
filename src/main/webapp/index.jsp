<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Travo — Travel Management System</title>

  <!-- FONTS -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">

  <style>
    :root{
      --primary: #5C2E91; /* brand purple */
      --accent: linear-gradient(135deg, rgba(92,46,145,0.98), rgba(92,46,145,0.78) 60%, rgba(80,36,155,0.6));
      --bg: #0f1724; /* deep background for contrast */
      --card-bg: #0b1220;
      --muted: #bfc7d6;
      --glass: rgba(255,255,255,0.04);
      --radius: 14px;
      --transition: 300ms cubic-bezier(.2,.9,.3,1);
    }

    /* ---------------- Reset & base ---------------- */
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family: "Poppins", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
      background: linear-gradient(180deg,#f6f7fb 0%, #eef2fb 100%); /* soft light for page */
      color:#0b1220;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      color: black;
    }
    a{color:inherit}
    img{display:block;max-width:100%}

    /* ---------------- Navbar ---------------- */
    .nav {
      position:fixed; left:0; right:0; top:0;
      display:flex; align-items:center; justify-content:space-between;
      padding:14px 6%;
      gap:10px;
      z-index:90;
      background: linear-gradient(180deg, rgba(255,255,255,0.75), rgba(255,255,255,0.60));
      border-bottom-left-radius:6px;
      border-bottom-right-radius:6px;
      box-shadow: 0 6px 18px rgba(12,18,30,0.06);
      backdrop-filter: blur(6px);
    }

    .nav-left { display:flex; align-items:center; gap:12px; }
    .brand {
      display:flex; align-items:center; gap:10px;
      text-decoration:none;
    }
    .brand .logo {
      width:100px;
      height:auto;
      filter: drop-shadow(0 6px 18px rgba(92,46,145,0.18));
    }
    .brand-title {
      font-weight:800; color:var(--primary); font-size:18px;
      letter-spacing:1px;
    }

    .nav-links { display:flex; gap:18px; align-items:center; }
    .nav-links a { font-weight:600; font-size:14px; padding:8px 10px; color:#0b1220; border-radius:8px; transition:var(--transition); }
    .nav-links a:hover { background:rgba(92,46,145,0.06); color:var(--primary); transform:translateY(-3px); }

    .cta {
      padding:9px 16px;
      background:var(--primary);
      color:#fff; border-radius:10px;
      font-weight:700; cursor:pointer; border:none;
      box-shadow:0 8px 28px rgba(92,46,145,0.18);
      transition:var(--transition);
    }
    .cta:hover{ transform:translateY(-3px); box-shadow:0 18px 40px rgba(92,46,145,0.22) }

    /* ---------------- HERO ---------------- */
    .hero {
      min-height:78vh;
      display:grid;
      grid-template-columns: 1fr 480px;
      gap:40px;
      align-items:center;
      padding:120px 6% 60px;
    }

    .hero-left {
      max-width:820px;
      padding-right:10px;
    }

    .eyebrow {
      display:inline-block;
      background:var(--glass);
      color:var(--primary);
      border-radius:999px;
      padding:8px 12px;
      font-weight:700;
      margin-bottom:16px;
      letter-spacing:0.6px;
      font-size:13px;
      box-shadow: inset 0 -2px 0 rgba(92,46,145,0.08);
    }

    .hero-title {
      font-size:44px; line-height:1.02; margin-bottom:14px; font-weight:800;
      color:#0b1220;
    }
    .hero-lead {
      color:var(--muted); margin-bottom:26px; font-size:16px;
    }

    .hero-actions { display:flex; gap:14px; flex-wrap:wrap; align-items:center; }
    .btn {
      padding:12px 18px; border-radius:12px; font-weight:700; cursor:pointer; border:none; transition:var(--transition);
    }
    .btn-primary {
      background:var(--primary); color:#fff; box-shadow:0 10px 30px rgba(92,46,145,0.15);
    }
    .btn-ghost {
      background:transparent; border:1px solid rgba(12,18,30,0.06); color:#0b1220;
    }

    /* search panel */
    .search-panel {
      display:flex; gap:12px; margin-top:22px; align-items:center;
      background: #fff; padding:10px; border-radius:12px; box-shadow:0 8px 30px rgba(12,18,30,0.06);
      width:100%; max-width:680px;
    }
    .search-panel input, .search-panel select {
      border:0; outline:0; padding:12px; font-size:14px; background:transparent; width:100%;
    }
    .search-panel .search-btn {
      background:var(--primary); color:white; padding:10px 14px; border-radius:10px; cursor:pointer; font-weight:700;
    }

    /* hero-right card */
    .promo-card {
      background: linear-gradient(180deg, rgba(92,46,145,0.12), rgba(92,46,145,0.06));
      border-radius:18px; padding:22px; box-shadow:0 12px 40px rgba(12,18,30,0.06);
      height:100%;
    }
    .promo-title { font-weight:800; color:var(--primary); margin-bottom:8px; }
    .promo-sub { color:var(--muted); font-size:14px; margin-bottom:16px; }
    .promo-stats { display:flex; gap:12px; margin-top:12px; }
    .stat {
      background:rgba(255,255,255,0.9); border-radius:12px; padding:12px 14px; min-width:120px;
      box-shadow:0 8px 24px rgba(12,18,30,0.04);
    }
    .stat h4 { margin:0; font-size:18px; color:var(--primary); font-weight:800 }
    .stat p { margin:6px 0 0; color:var(--muted); font-size:13px }

    /* ---------------- Sections: packages, features, types ---------------- */
    .section { padding:72px 6%; }
    .section-head { display:flex; justify-content:space-between; align-items:end; gap:20px; margin-bottom:28px; }
    .section-title { font-size:26px; font-weight:800; color:#0b1220; }
    .section-sub { color:var(--muted); font-size:14px; }

    .grid {
      display:grid;
      gap:18px;
      grid-template-columns: repeat(auto-fit, minmax(240px,1fr));
    }

    .package-card {
      background:linear-gradient(180deg, #ffffff, #fbfcff);
      border-radius:14px; padding:16px; overflow:hidden;
      box-shadow: 0 18px 40px rgba(12,18,30,0.06);
      transition: transform var(--transition), box-shadow var(--transition);
      display:flex; flex-direction:column; gap:12px;
    }
    .package-card:hover { transform: translateY(-10px); box-shadow: 0 28px 60px rgba(12,18,30,0.10); }
    .pkg-image { height:160px; border-radius:10px; overflow:hidden; }
    .pkg-details h3{ margin:0; font-size:18px; color:#0b1220; font-weight:800 }
    .pkg-details p{ margin:6px 0 0; color:var(--muted); font-size:13px }
    .pkg-meta { display:flex; justify-content:space-between; align-items:center; margin-top:auto; gap:10px; }
    .price { font-weight:800; color:var(--primary); font-size:18px }
    .book-btn { background:var(--primary); color:#fff; border-radius:10px; padding:8px 12px; font-weight:700; cursor:pointer; border:none }

    /* Trip types (futuristic tiles) */
    .type-card {
      background: linear-gradient(180deg, rgba(92,46,145,0.06), rgba(92,46,145,0.03));
      border-radius:14px; padding:20px; display:flex; flex-direction:column; gap:10px;
      transition:transform var(--transition);
    }
    .type-card:hover{ transform:translateY(-8px); box-shadow: 0 20px 40px rgba(92,46,145,0.08) }
    .type-card h4 { color:var(--primary); margin:0; font-weight:800 }
    .type-card p { color:var(--muted); font-size:13px; margin:0 }

    /* Testimonials */
    .testi-wrap { display:flex; gap:20px; align-items:center; justify-content:center; margin-top:12px; }
    .testi-card {
      background:#fff; border-radius:14px; padding:18px; width:320px; box-shadow:0 12px 36px rgba(12,18,30,0.06); text-align:left;
    }
    .testi-text{ color:#0b1220; font-weight:600; margin-bottom:10px }
    .testi-author{ color:var(--muted); font-size:13px }

    /* ---------------- Footer ---------------- */
    footer {
      padding:36px 6%;
      margin-top:30px;
      border-top:1px solid rgba(12,18,30,0.04);
      display:flex; gap:20px; justify-content:space-between; align-items:center;
      background: linear-gradient(0deg, rgba(255,255,255,0.02), transparent);
      border-radius:12px;
    }
    .footer-left { color:var(--muted) }
    .socials a { margin-left:12px; color:var(--primary); font-weight:700; text-decoration:none }

    /* ---------------- Responsive ---------------- */
    @media (max-width:980px){
      .hero{ grid-template-columns: 1fr; padding-top:140px; gap:26px }
      .nav { padding:10px 5% }
      .brand .logo{ width:120px }
    }
    @media (max-width:540px){
      .nav-links{ display:none }
      .brand-title{ display:none }
      .hero-title{ font-size:28px }
      .promo-card{ display:none }
      .search-panel{ flex-direction:column; gap:8px }
      footer{ flex-direction:column; gap:12px; align-items:flex-start }
    }
    .socials a img{
        width:30px;
        height:30px;
        display: inline-block;
    }
    .socials a:hover {
        transform: translateY(-3px);
        opacity: 0.8;
        transition: all 0.3s ease;
    }

  </style>
</head>

<body>

  <!-- NAV -->
  <header class="nav" role="banner">
    <div class="nav-left">
      <a class="brand" href="#home" aria-label="Travo home">
        <!-- local logo path as requested -->
        <img class="logo" src="./Assets/travo-removebg-preview.png" alt="Travo logo" />
      </a>
    </div>

    <nav class="nav-links" aria-label="Primary navigation">
      <a href="#destinations">Destinations</a>
      <a href="#packages">Packages</a>
      <a href="#types">Trip Types</a>
      <a href="#testimonials">Testimonials</a>
      <a href="#contact">Contact</a>
    </nav>

    <div style="display:flex;gap:12px;align-items:center">
      <a class="cta" href="Login.jsp">Login</a>
      <a class="btn btn-ghost" href="Register.jsp">Register</a>
    </div>
  </header>

  <!-- HERO -->
  <main>
    <section class="hero" id="home" aria-labelledby="home-heading">
      <div class="hero-left">
        <span class="eyebrow">Plan • Book • Explore</span>
        <h1 id="home-heading" class="hero-title">Travel smarter. Travel bolder. Travel with <span style="color:var(--primary)">Travo</span>.</h1>
        <p class="hero-lead">Travo centralizes trip management for solo travelers, families, and agencies — personalized packages, automated booking and easy management for admins. Discover curated packages or build your own itinerary.</p>

        <div class="hero-actions">
          <button class="btn btn-primary" onclick="scrollTo('packages')">Explore Packages</button>
          <button class="btn btn-ghost" onclick="scrollTo('types')">See Trip Types</button>
        </div>

        <div class="search-panel" role="search" aria-label="Search packages">
          <input type="text" id="search-dest" placeholder="Search destination (e.g. Paris, Bali)" />
          <select id="search-type" aria-label="Trip type">
            <option value="">All types</option>
            <option value="solo">Solo</option>
            <option value="family">Family</option>
            <option value="agency">Agency</option>
          </select>
          <input type="date" id="search-date" />
          <button class="search-btn" onclick="mockSearch()">Search</button>
        </div>
      </div>

      <!-- PROMO / HIGHLIGHT CARD -->
      <aside class="promo-card" aria-hidden="false">
        <div>
          <div class="promo-title">Why travelers love Travo</div>
          <div class="promo-sub">Smart recommendations • Budget filters • Secure bookings</div>

          <div class="promo-stats">
            <div class="stat">
              <h4>12k+</h4>
              <p>Bookings/year</p>
            </div>
            <div class="stat">
              <h4>150+</h4>
              <p>Top destinations</p>
            </div>
            <div class="stat">
              <h4>98%</h4>
              <p>Customer satisfaction</p>
            </div>
          </div>

          <div style="margin-top:16px;">
            <small style="color:var(--muted)">Get started — it’s free to explore packages.</small>
          </div>
        </div>
      </aside>
    </section>

    <!-- DESTINATIONS -->
    <section class="section" id="destinations">
      <div class="section-head">
        <div>
          <h3 class="section-title">Featured Destinations</h3>
          <div class="section-sub">Hand-picked destinations with recommended packages</div>
        </div>
        <div><a class="btn btn-ghost" href="Register.html">View all</a></div>
      </div>

      <div class="grid">
        <div class="package-card">
          <div class="pkg-image">
            <img src="https://images.unsplash.com/photo-1505761671935-60b3a7427bad?w=1200&q=60&auto=format&fit=crop" alt="Paris" style="height:100%;object-fit:cover" />
          </div>
          <div class="pkg-details">
            <h3>Paris — The Romantic Escape</h3>
            <p>5 days • Flights + 4★ hotel • Guided city tour & Seine dinner</p>
          </div>
          <div class="pkg-meta">
            <div class="price">₹28,999</div>
            <button class="book-btn" onclick="openPackage('Paris')">Book</button>
          </div>
        </div>

        <div class="package-card">
          <div class="pkg-image">
            <img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200&q=60&auto=format&fit=crop" alt="Bali" style="height:100%;object-fit:cover" />
          </div>
          <div class="pkg-details">
            <h3>Bali — Tropical Relaxation</h3>
            <p>7 days • Beach resorts • Yoga & culture experiences</p>
          </div>
          <div class="pkg-meta">
            <div class="price">₹34,499</div>
            <button class="book-btn" onclick="openPackage('Bali')">Book</button>
          </div>
        </div>

        <div class="package-card">
          <div class="pkg-image">
            <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=60&auto=format&fit=crop" alt="Maldives" style="height:100%;object-fit:cover" />
          </div>
          <div class="pkg-details">
            <h3>Maldives — Overwater Luxury</h3>
            <p>4 days • Private villa • Snorkeling & spa</p>
          </div>
          <div class="pkg-meta">
            <div class="price">₹62,000</div>
            <button class="book-btn" onclick="openPackage('Maldives')">Book</button>
          </div>
        </div>

        <div class="package-card">
          <div class="pkg-image">
            <img src="https://images.unsplash.com/photo-1549880338-65ddcdfd017b?w=1200&q=60&auto=format&fit=crop" alt="Tokyo" style="height:100%;object-fit:cover" />
          </div>
          <div class="pkg-details">
            <h3>Tokyo — Neon & Tradition</h3>
            <p>6 days • City pass • Food tour & cultural nights</p>
          </div>
          <div class="pkg-meta">
            <div class="price">₹45,200</div>
            <button class="book-btn" onclick="openPackage('Tokyo')">Book</button>
          </div>
        </div>
      </div>
    </section>

    <!-- TRIP TYPES -->
    <section class="section" id="types">
      <div class="section-head">
        <div>
          <h3 class="section-title">Trip Types</h3>
          <div class="section-sub">Built-in templates to quickly create trips</div>
        </div>
        <div><a class="btn btn-ghost" href="Register.html">Open Trip Builder</a></div>
      </div>

      <div class="grid">
        <div class="type-card">
          <h4>Solo Trips</h4>
          <p>Personalized recommendations based on your interests — citywalks, adventure, food trails.</p>
          <small style="color:var(--muted)">Search & book in 2 clicks</small>
        </div>

        <div class="type-card">
          <h4>Family Trips</h4>
          <p>Family-size friendly packages with transport & accommodation options customized for you.</p>
          <small style="color:var(--muted)">Add family members in profile</small>
        </div>

        <div class="type-card">
          <h4>Agency Trips</h4>
          <p>Budget, Luxury, Adventure packages for agencies. Admin management for approvals and reports.</p>
          <small style="color:var(--muted)">Bulk booking & reporting</small>
        </div>

        <div class="type-card">
          <h4>Custom Packages</h4>
          <p>Create custom itineraries with day-by-day plan and add-ons like transfers, guides, and meals.</p>
          <small style="color:var(--muted)">Save & reuse templates</small>
        </div>
      </div>
    </section>

    <!-- FEATURES -->
    <section class="section" id="features" style="background:linear-gradient(180deg,#fff, #f7f9ff); border-top:1px solid rgba(12,18,30,0.02)">
      <div class="section-head">
        <div>
          <h3 class="section-title">Key Features</h3>
          <div class="section-sub">Everything you need to run a travel management system</div>
        </div>
        <div></div>
      </div>

      <div class="grid">
        <div class="package-card" style="padding:18px;">
          <h3 style="color:var(--primary)">Automated Booking Flow</h3>
          <p style="color:var(--muted)">Seamlessly insert bookings into database via BookPackageServlet and manage them from dashboard.</p>
        </div>

        <div class="package-card" style="padding:18px;">
          <h3 style="color:var(--primary)">Admin Dashboard & Reports</h3>
          <p style="color:var(--muted)">Total users, packages, bookings and analytics in one place with export support.</p>
        </div>

        <div class="package-card" style="padding:18px;">
          <h3 style="color:var(--primary)">Feedback & Reviews</h3>
          <p style="color:var(--muted)">Collect feedback after trips and surface top-rated packages to users.</p>
        </div>

        <div class="package-card" style="padding:18px;">
          <h3 style="color:var(--primary)">Profile & Bookings</h3>
          <p style="color:var(--muted)">Users can view/update profile and manage bookings (cancel/confirm) via portal.</p>
        </div>
      </div>
    </section>

    <!-- TESTIMONIALS -->
    <section class="section" id="testimonials">
      <div class="section-head">
        <div>
          <h3 class="section-title">What Travelers Say</h3>
          <div class="section-sub">Real feedback from our community</div>
        </div>
      </div>

      <div class="testi-wrap" id="testi-wrap">
        <div class="testi-card">
          <div class="testi-text">"Booked a last-minute Bali getaway — Travo's recommendations were spot on. Smooth checkout and amazing hotel."</div>
          <div class="testi-author">— Sanya R., Solo Traveler</div>
        </div>

        <div class="testi-card">
          <div class="testi-text">"Family trip planning was painless. The family-size filter helped match hotels with kid-friendly activities."</div>
          <div class="testi-author">— Kunal M., Family Organizer</div>
        </div>

        <div class="testi-card">
          <div class="testi-text">"Agency integrations and bulk booking feature saved us hours. Reports are clean and export-ready."</div>
          <div class="testi-author">— UrbanHarvest Travel (Agency)</div>
        </div>
      </div>
    </section>

    <!-- CTA + CONTACT -->
    <section class="section" id="contact" style="padding-bottom:120px;">
      <div class="section-head">
        <div>
          <h3 class="section-title">Ready to plan your next trip?</h3>
          <div class="section-sub">Contact us or create an account to start building trips.</div>
        </div>
        <div>
          <button class="btn btn-primary" onclick="scrollTo('register')">Create Account</button>
        </div>
      </div>

      <div style="display:flex;gap:24px;flex-wrap:wrap;">
        <form id="contactForm" style="min-width:320px; max-width:720px; background:#fff; padding:18px; border-radius:14px; box-shadow:0 18px 40px rgba(12,18,30,0.06)">
          <div style="display:flex; gap:12px; flex-wrap:wrap">
            <input name="name" placeholder="Your name" style="flex:1;padding:12px;border-radius:10px;border:1px solid rgba(12,18,30,0.04)" />
            <input name="email" placeholder="Email address" style="flex:1;padding:12px;border-radius:10px;border:1px solid rgba(12,18,30,0.04)" />
          </div>
          <textarea name="message" placeholder="How can we help?" rows="4" style="width:100%;margin-top:12px;padding:12px;border-radius:10px;border:1px solid rgba(12,18,30,0.04)"></textarea>
          <div style="display:flex; gap:10px; margin-top:12px;">
            <button class="btn btn-primary" type="button" onclick="submitContact()">Send Message</button>
            <button class="btn btn-ghost" type="reset">Reset</button>
          </div>
        </form>

        <div style="min-width:260px; max-width:320px; background:linear-gradient(180deg, rgba(92,46,145,0.06), transparent); padding:16px; border-radius:14px;">
          <h4 style="color:var(--primary); margin:0 0 6px">Office</h4>
          <p style="color:var(--muted); margin:0 0 12px">Bengaluru, India • travo@gmail.com</p>
          <h4 style="color:var(--primary); margin:0 0 6px">Support</h4>
          <p style="color:var(--muted); margin:0">Mon–Sat, 9am–9pm IST</p>
        </div>
      </div>
    </section>
  </main>

  <!-- FOOTER -->
  <footer>
    <div class="footer-left">
      <div style="display:flex;align-items:center;gap:10px">
        <img src="./Assets/travo-removebg-preview.png" alt="Travo logo small" style="width:110px" />
        <div style="margin-left:4px">
          <div style="font-weight:800;color:var(--primary)">Travo</div>
          <small style="color:var(--muted)">Travel Management System • © 2025</small>
        </div>
      </div>
    </div>

    <div style="display:flex;align-items:center;gap:12px">
      <div style="color:var(--muted);font-size:14px">Follow</div>
      <div class="socials">
        <a href="#" aria-label="Twitter"><img src="https://i.pinimg.com/736x/2f/b9/09/2fb909b74a854f0715e64dda5825990d.jpg" alt=""></a>
        <a href="#" aria-label="LinkedIn"><img src="https://i.pinimg.com/736x/cc/66/41/cc6641fa3397e8d3af4b34fedb1441a0.jpg" alt=""></a>
        <a href="#" aria-label="Instagram"><img src="https://static.vecteezy.com/system/resources/previews/018/930/415/non_2x/instagram-logo-instagram-icon-transparent-free-png.png" alt=""></a>
      </div>
    </div>
  </footer>

  <!-- SCRIPTS -->
  <script>
    // Developer-friendly helper selectors & tiny utilities
    const $ = (sel) => document.querySelector(sel);
    const $$ = (sel) => Array.from(document.querySelectorAll(sel));

    function scrollTo(id){
      const el = document.getElementById(id);
      if(el) el.scrollIntoView({behavior:'smooth', block:'start'});
    }

    // Mock interactions to keep landing page self-contained
    function mockSearch(){
      const dest = document.getElementById('search-dest').value || 'All destinations';
      const type = document.getElementById('search-type').value || 'All types';
      alert(`Searching for: ${dest} (${type}) — This is a demo search. Integrate with your SoloTripServlet / viewPackages.jsp to enable real results.`);
    }

    function openPackage(name){
      // For developers: implement package details -> bookPackage.jsp?name=...
      const url = `bookPackage.jsp?package=${encodeURIComponent(name)}`;
      // Use window.location to navigate in production
      alert(`Open package: ${name}\nRedirecting to: ${url}`);
      // window.location.href = url;
    }

    function submitContact(){
      // simple validation + simulated send
      const form = document.getElementById('contactForm');
      const name = form.name.value.trim();
      const email = form.email.value.trim();
      if(!name || !email){ alert('Please add name & email to contact us.'); return; }
      alert('Thanks ' + name + '! We received your message (demo). Integrate with backend mail endpoint to send real messages.');
      form.reset();
    }

    // Testimonials: simple auto-rotate
    (function rotateTestimonials(){
      const wrap = document.getElementById('testi-wrap');
      if(!wrap) return;
      let idx = 0;
      setInterval(() => {
        idx = (idx + 1) % wrap.children.length;
        // basic transform carousel
        wrap.style.transform = `translateX(-${idx * (wrap.children[0].offsetWidth + 20)}px)`;
        wrap.style.transition = 'transform 600ms cubic-bezier(.2,.9,.3,1)';
      }, 4000);
    })();

  </script>
</body>
</html>
