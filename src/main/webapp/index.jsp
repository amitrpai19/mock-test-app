<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Simple Exam - Practice for the Future</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=Iq-tJgu48akY-lm-hVw49xEsP-zt71_XZ9b5q9oRrOj5fFjc660Wvl36fS-MKfemr8Al43ZtzvkUctkOAgD3hp43gyoC7xbfAZO_56iD7SgYribxwxILYIjxJI2m1eG4eXyoxL5dq2Up3IXNaBEDvu5mtllJ-Tg9DyFZAxdpOphbU-FzSA22QLt8qyZpyUbijfQNLm2ob5ka8eMJEt34wjZzR-0KZv-pz3M5wBuHFG27bWsTZe1ueKbBqrbC2ClY42lpTCSt7D8sWUzlBjQG3YnDhMiAFJAjyvlen_HmakxodlhwowZB5vr7cu6rLPbx0fhlpyw0AvxzughJ3jehx-zjisq8Bm5kBW2_tYOl0bPF92VbzlycyXgNHcVY8PnFp8OsWl039c11AZRSsDCDIFD0h_i0bT5-fyHoFSIfinna_HGP_jUaU4E1c_OEUgGWAr3m0jsO7XSG8rRx8dDeFChyyZC7c806y5DZz1B5QZxM_A9QzkSM-RulIb-VAS6UIa2ZpnzhECDGp8NKuMLF6iddDhjHkTUQxE3Wj8ldLEzaz9wWTGmqsv7VlzuTwzWTIrNT91qVf97cSVhpTwo70NeOnl6bd00HBOYH1l7hAxU9ybs87eBj-XyZf44Dik4mSoxRP0pFmGdLKhdroGx2ocDHeIilxRKiInJuskmYzdbm09Vl_h-pk0kKUrgdZGzXZoCnoe3bWO1_rQe2zXSXTSRjxkE8lUfSRUTrAHLts0i8JfbJeYpevJE79a7Xhoztz4NAFXS7sgQExMfFmWDdjmMVxW8P4xfIRvVLtTKZbIlypSrwhBM0bSa0T3BROO2IShHN7Dlo3Pv2eQJI3Vh_2uthp27a7t1vBq6lTmQK3teWL-EYce6sl9rUCjbSuuI8rOeTv5ERHq-5z9wHu7N48e-BZbPXYy_ucCjgODqOs20ELAx4jlpZ_D1FVG0Ah_KjRKife0QkdPRpAG88sAgd8_M8ar3-wpklUM6Ax0DM1KFZE_WhUKezsOHFDpcJr_PQSAD4DeiXVFeO-mcPD23_ZR1Wf9RPqwXW0bR8G37nwZD_Ccyd115copAUXzsrg20LSfGrF3DWXj3cgixKDYGYxKof-dwzmOqWuKKAHVfEymy7wVk5zqCOx8eaflXSlqWzAaTGeC7f0_gmcTrgWZJQVIXuoPNvJE6QcQS0TSoa70iUzN3SIijHXKwCuQaeIm1wShv7zutETz07OYKVunUg4-Aim8Ls5nkPV8XiFkjmUBvMwyyIzP2UbEBTNRDqXImaSyG9DlkarKu7pi5c9yD_9HMGwazOhDdZGx-jTeATEYoa5X_jvLwvHr3esFU6dbdMB_tYr-L0YV0lggrvnvMoTE2ZIRFAmQ-AH0SQK7j06vco_1Sg_Bo8xj2AEZg9VEjmnEKK0Kd7tu02dJjA4QlPhDoRtcPyC-l2S5o2HXURtMdYNuIthKuyj42X0d0YUxnw8EutK5JIRTMbMDprjapCTKBGyb_aKLOajskVvWOpZl-ccHRA94Z96TNGAT58gPPmJSXJQ9gwLkXA5E0VHHVNcQ4xyFZ6QPAC9IwlpFppFfMLXSY0jLeJIO9y0eNXmSjn1ebHIT2edBVoxyHghADYProBzVmT4_tt919KMtllocM" nonce="72919cd69e20362679c1a7df621d21cc" charset="UTF-8"></script><link rel="stylesheet" crossorigin="anonymous" href="https://gc.kis.v2.scr.kaspersky-labs.com/E3E8934C-235A-4B0E-825A-35A08381A191/abn/main.css?attr=aHR0cHM6Ly9tYWlsLWF0dGFjaG1lbnQuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2F0dGFjaG1lbnQvdS8wLz91aT0yJmlrPTk1OWI2ZTYwMmMmYXR0aWQ9MC4xJnBlcm1tc2dpZD1tc2ctYTpyMzk3MTIwMDUxNjI1NjcwODIyMCZ2aWV3PWF0dCZkaXNwPXNhZmUmcmVhbGF0dGlkPTE5Y2Q4MjkwNzg1YTBhMmE3NjcxJnp3JnNhZGRiYXQ9QU5HamRKOF9SeFAwWmVhRV95UG1ac3VEUnduSFVocnhTeDM0RGY4ak1lUGR1OXZUeHlYUFR3U29JRlhkODFpdmhkb1VhdC1Kd1h6OFMtdFQxUnFtN3loUC1DQ3pkVlRGMDNpb01NUzlJb0UzVGIxeDNJS0RHbHQtR0syRlo3azVKSmZ3dXhXdXJzbHFBcEp2NzlZbUtCLUpTZTJDcVotY185NlBRVjY5V0paQzdhQ1VIbW9ReERRVmJPeFNVdnN4blhIbzV4aFF5aUI2TXJzWGgwWWFxTDMydlRMUHZwMVh6dzBwX1VnZWx0aTlUXzZWQjNHaUNfNG52anhVYXdjNENDUENqSHJxT084VVc5SnIzR25mREkzNXZ0MDRGejI4dEVHci14YTUzVUdaeXc1WERwX0dhcWRHOXVCQ2pocXFEZzJoZE5FaTg0TkFUV0dJQ2o1X3lOZUVteWJIdnNPMkUtTnNSODJqUngybWVOSDdfdnVIWklxYzlEaWdLdDRHeGNmREhma3lvdzBoRkJfd0RJX3k2cFF5dGIwbUUtd0RYOU5fbzFrdHVEQkE2Y0RUUzI2eHlKYlE0OHVGMlNGeHVuQ2VhSzBuVXBTZGNDQlVGa3RmRDMtandrUnBOYVhQbVJmc3pvUzVpcTlRdVQxalRHM1B5T0hYcTRxeUllV0RZWC1nd2xTMXVvS1EtdHJrYTNOTUNCUDVrNXFmSjd3NzVUang2VUVQUFRQRWNNRXN5S3dRWUl1OVBWZkxDZHI0aGhzSjlLZWJteDRRMkUxcWtodXdrUGZpRnhNWGt1NF9hci1IV1hBcWg4NWtUbTE4RHlkbU5iNmpNSkVkRHFYOHNyMjd4YXZwT3BncFR4WG4yd0c0X2ZMX29hQndzYTZPclVfb0dVRHFWZTZoaW10X09OV051aE1Cay05akxpWGNpX2YxOF9Dd1FJQ2lweEx3cXYzUVl1TGFzVkx1T1UxNFV0cjNCQ01kbDFDeUNTaXJLMkdPYWNCZkVHUlZoRU9sWkxmUkl1NUlNbUJrSHBDekFwUG1OQlh2WUhhRXEzU3RaeWtKYjhXWlN4UzRRZUpnOTFwUFdraU9JTmxfRjBGNzFZSF8tTU5URDFGT3BqN1B5Z2pudXJjaG40Z3ZFNjQtaFJITm4wVzlwT0lSU01IOF9HaFp3OUlPeGR5TFozOC1tZFF6Q0xJeGg3ZEtpSEFSNU42RDdBcndqZTJFM2ZfWnE5akEzTmh3OGRZb2FEVzI4bnlYNFpxcTBxRExaWnloTjY0dk01Y2syTzFvNjFrcjFzNTd2UzQ1aXdMMkNyNFU0VmR5VjhWbHZDNFpoM3hIa1VxQ3o3d3VpTmtvQmhB"/><style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #fcfcfc;
            color: #2d3436;
        }

        /* Branding Colors */
        .text-se-teal { color: #006064; }
        .bg-se-teal { background-color: #006064; }
        
        .btn-se-teal { 
            background-color: #006064; 
            color: white; 
            border: none;
            transition: transform 0.2s, background-color 0.2s;
        }
        .btn-se-teal:hover { 
            background-color: #004d40; 
            color: white;
            transform: translateY(-2px);
        }

        /* Navbar & Motto Styling */
        .navbar {
            padding: 1.5rem 0;
            background: white;
            border-bottom: 1px solid #eee;
        }
        .logo-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .logo-img {
            max-height: 60px;
            width: auto;
        }
        .site-motto {
            font-size: 0.85rem;
            color: #636e72;
            margin-top: 5px;
            font-style: italic;
            max-width: 400px;
        }

        /* Hero Section */
        .hero-section {
            padding: 100px 0;
            background: linear-gradient(180deg, #ffffff 0%, #f1f2f6 100%);
        }
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            letter-spacing: -1px;
        }

        /* Feature Cards */
        .feature-card {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
            background: white;
        }
        .feature-card:hover {
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transform: translateY(-5px);
        }
        .feature-icon {
            width: 60px;
            height: 60px;
            background: #e0f2f1;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
    </style>
  </head>
  <body>

    <nav class="navbar sticky-top">
      <div class="container">
        <div class="logo-container">
          <a class="navbar-brand m-0 p-0" href="index.jsp">
            <img src="logo.jpg" alt="Simple Exam Logo" class="logo-img">
          </a>
          <div class="site-motto">
            Start with a <span class="text-se-teal fw-bold">SIMPLE EXAM</span>, finish as a leading <span class="text-se-teal fw-bold">EXAMPLE</span> for the future.
          </div>
        </div>

        <div class="ms-auto">
          <a href="login.jsp" class="btn btn-se-teal rounded-pill px-4 py-2 fw-semibold">Login</a>
        </div>
      </div>
    </nav>

    <header class="hero-section text-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <h1 class="hero-title mb-4">Master Your Future with <span class="text-se-teal">Precision.</span></h1>
            <p class="lead text-muted mb-5 fs-4">
              The most intuitive exam practice platform designed to help students transition from learning to leading.
            </p>
            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
              <a href="signup.jsp" class="btn btn-se-teal btn-lg px-5 py-3 rounded-pill fw-bold">Create Account Now</a>
            </div>
          </div>
        </div>
      </div>
    </header>

    <section class="py-5">
      <div class="container py-5">
        <div class="row g-4 text-center">
          <div class="col-md-4">
            <div class="feature-card p-5 h-100 shadow-sm">
              <div class="feature-icon mx-auto text-se-teal">📝</div>
              <h3 class="h5 fw-bold">Simulated Exams</h3>
              <p class="text-muted mb-0">Experience real test environments with our carefully curated question banks.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="feature-card p-5 h-100 shadow-sm">
              <div class="feature-icon mx-auto text-se-teal">📊</div>
              <h3 class="h5 fw-bold">Insightful Analytics</h3>
              <p class="text-muted mb-0">Track your progress and see exactly where you need to improve.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="feature-card p-5 h-100 shadow-sm">
              <div class="feature-icon mx-auto text-se-teal">⚡</div>
              <h3 class="h5 fw-bold">Instant Results</h3>
              <p class="text-muted mb-0">No waiting. Get immediate feedback on your answers to learn faster.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="py-5 bg-white border-top">
        <div class="container text-center py-4">
            <h2 class="fw-bold mb-4">Ready to set the example?</h2>
            <a href="signup.html" class="btn btn-outline-dark btn-lg rounded-pill px-5">Join Simple Exam Today</a>
        </div>
    </section>

    <footer class="py-5 bg-dark text-white">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6 text-center text-md-start">
            <p class="mb-0 opacity-75">&copy; 2026 Simple Exam. Built for future leaders.</p>
          </div>
          <div class="col-md-6 text-center text-md-end">
            <a href="#" class="text-white-50 text-decoration-none me-3">Privacy Policy</a>
            <a href="#" class="text-white-50 text-decoration-none">Terms of Service</a>
          </div>
        </div>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
