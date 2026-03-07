<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="com.exam_app.entities.Message" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - My Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=T600vynXPqrq5wQD_fzq6UtdAZsgoC5pBTk_z9wT_-4b8wl9ufHL1HYc8ecJ9o5x2ZLAKF_rwGcZ79VrPSFH_FspzxQZjCU9Hh02Zr0BDt60AQEpg3C6FBOQ6F15K9e_fTUJUdJc5nzPNPNiWKMZyNANz63ZLy1Ma5kQl1tX8-Cr1RjkeAnnD27D-wYrWUINWMYno4ngAFTSaUEgSGqqqk0zgmOHiyX-wBuRUmtjnGES7Wu5ruKAL6lLySTJBnxFTgK6Thgijaroo2caeLdBh0uGXoq0B_tagZl38jHm0rtOzSsyddh593qrmbMM8uRRfzv23zVTa_1D7wkGEhO9cXhdYAoyfbicJXFowAg57fNQNzPxy1xs7G0Rio2IcK4PG-csyKOa_FTaI_KpDn4OYP2tXQn9AIJ5NdDGdG1tNlM58z9ys5WiNS-aphfKVJbaXMZMQYYCu7l4_8pXjA9L_Ag63BPsdTCI3E-nDFVxwoDflx5E9V1Wk6ktfW2DrkGoCyTbe7xm722glQmsldxAmwzeulee3qwsScJXvTgXygnsOSoNdo6jb8631j8VwuIwxV9PEIceyJkRYyEFo-3aQjZuUp7IRO7loGpy9vbsQ5hgWLp7yW8pWLdpfV_QBrLr43gpk9GZ2Thqj7rxyWBorBvfQ2hkisotyu-jrqM1EnCjnU_E2RAa8KA1nZVujiMG_y4qrAwbgVvPKCCwty005lSK5TLIfwAmQlTriJnsa1Aar9nvfoohXflesVljfd6qW3foeYVgQd2ndwqiBq4hySpDntI7LG3Owm25dnVkd_W9KyZhSDBl4jQAzX3XCTEBq0JIRgzRvL_vRLuXeWmupox8Qbbh1-QxswTRhENkUSRg6jhMhccYeM0b7bJ1euG99uOO7kLpeT45oHhYabYxshk6evlvjqNbgAWTu8QVzeW8hRekQUbESMc6Ez6kMJWTI4tr60KgeTOx6shyRGKumxtksbK4OpzOG6FRUW33NZZhzCXdAdZt9P4oOWbRd4IdrZVDJZzXd4RI9hWA4_E-3FmpAfwIyLPt3-XgVn9d9htyL_Ipla1qBtLthJzU_59b0sg6uYuDJ9GgPjoFhSHmHCEVuKVXAWEVD2kskqux3E-PcGMJENTnuGugosd-AFo8CGv1--xJu_sCVbu4epjwFRCCTUYht7pggV5596A-yHuEU-BxL_OfI-bI4kncWfE_bIpony8wDsp7EslAcNEtu_lMWkx6nqJsdStzqQyKaH8J0NJrAdkJEa5tkf-A_uIfjm_cYnvGo7gKFoea89UkEMe1NEVU-wcyvVQOh1yAcDgLMBNMm1w7SfE8IuMzLKnuAoJcRf1wBuxReVG0dZYvBiNNkQ-KwqGLW_uak3P8-DptXvSM_9Wl0q4RVPkW-8BfzmJyBqm9hDOuIMeDW0M7ltBl3itE_SZnFax_fwrdT97S9dC23_8s4BqqBs4-3Mulx_zqPG6htNKG4XZvGVm0Vj5Xuf4qGg-6ko_ifzGI8klus8plvwsdC9h-mv_naQ-LqsE_3KDHSJ_tt982cBxbSluqqGYx-rmqUSm7WQS3bSndfWRAtk4-czv1YcXHEy7M" nonce="c4e185260ba3ddf9f795c4c8c51fc730" charset="UTF-8"></script><link rel="stylesheet" crossorigin="anonymous" href="https://gc.kis.v2.scr.kaspersky-labs.com/E3E8934C-235A-4B0E-825A-35A08381A191/abn/main.css?attr=aHR0cHM6Ly9tYWlsLWF0dGFjaG1lbnQuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2F0dGFjaG1lbnQvdS8wLz91aT0yJmlrPTk1OWI2ZTYwMmMmYXR0aWQ9MC4xJnBlcm1tc2dpZD1tc2ctYTpyODEwNjI0MjM3MTkyNTM1NTI4MCZ2aWV3PWF0dCZ6dyZkaXNwPXNhZmUmc2FkZGJhdD1BTkdqZEotc2FocG9BZ18tTU83MnNSb3ZWbjZIVUVGSVpveHhOV3l3R0o1ekJxVU5aOG1oOXFaNUZWTnhIX1Ftb1A5ZElxdnpqNnI2N1lqaVI1b3BzUnBtZWI2emQxaW5DVHBfcUZhTWwza2lwZVk5eVlwQlBueVJ3ZzJqUnl5WXdYXzhvdi00dnJCLWpGcHhzX1phd3h4TkZ6MXZsRnFHOXJJNXZOQ0hBeWl4Y1lLaTFkdU5yZGlnWXpITlRkdGxQempmVXc4c2d4THQwUEVlYndFamxYTjNUME83b2pvZkEzUkFyTFhfQ0VsNjZISkN4Vk0zZ2pMdmd6QTNieEtzZm9IZlVWMG5SOU55M01LVjJBWFROYTVtdGFrWnNPdkVXRkJod3dGZ3d6S28wUjR3bC1QSTlvcTVHRXlJdVY4anBMU3Qxdl8xUVk0anlZS0VOZ1FCbUt5d1BpcUtaanpoeDZBTHdTWl9mS2JRQmh3UmR4eTljT2Y1eUhjLUtJRFFHWjEtelJLa1lBa3BobTBXRVFGMXVkOTZLcG01REw3aENFOW12ZWlMNkk0b2lZeHdfc1lIRnlxM3pBWndqVllfYi00a2dDbmpXMXRLTXVFUXVlMUVxUi1IWXJMalR1TC1yX2VaN1dQOE5SaThXRjFGV256UmRJZHVrU0x4Rm1USDdwMjJkTjk5R2ZoNm9Db200Z3lBdkh6czlXal9tekwwMVVVQzhlMWJVck5MUml4NEloM2hoQUJ2Mm1ENXg1UnljME5SZnlZQy1PZnpPQXRtMWxERUNnbXdyV3JaZnItcG8wUTFTNWdSX0FEVnlEMk9MSmlTek84d0ZjZkpHbGhZNFNpZ2ZYTk5meDRCQl94YTcyUkFVdDROdWtmc3BnRFlxTlpRTm56ZmVySEMtZ2RGeVprNUFIYlNjcUg5V1kwUEpHN21SOFFHbmRVSnJzTHJNbVV2OFlSX3lWY01tVm4xRGJ0N09TV1pXN2hFVndpY1BfanFoRy1xRkNOblBKbDRwYkM4bkMxRWEtWUd5aTdZVE03WnlwWmFrTzNFM1BrMmMyOEM3NXRXZkpXVDFwQkhjcTdtdTF6RUVKTXhJb1ZWT0NkNzU5ajJJcGFlU1V5RTJ6SzlJWlZ3azRlb19ydlpmdDZQNjA0Wml0X3RCLVQtdWJ0cE1mZzRTbEVDczNQbWFRTE9rT1hHcHR6QjBBTXNVUUd1RHh4UnFlWHRmR0NYTDFUQ3YwQVhkUW9zLVRDV2poZFZTV010TXBEZzRiU3FraVBjbnNwVk50NGR0eDE2eVNJUjFPWTg4c21OYndWY2QwbFY0YUM3NUE3UzQxMlE3Q25LWC1rVFhxYVR4TGc"/><style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .card { border-radius: 1rem; border: none; }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="card shadow-lg">
                <div class="card-body p-5">
                    <h2 class="text-center mb-4 fw-bold">Login</h2>
                    <% 
                        Message msg = (Message)session.getAttribute("msg");
                        if(msg!=null) {

                    %>
                    <div class="alert <%= msg.getCssClass() %>" role="alert">
                            <%= msg.getContent() %>
                    </div>  
                    <%    

                        session.removeAttribute("msg");
                        }
                                   
                    %>
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" name="email" class="form-control" placeholder="Your Email" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Your password" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Login</button>
                        </div>
                    </form>
                    <hr class="my-4">

                    <div class="text-center">
                        <p class="small mb-1">Don't have an account?</p>
                        <a href="signup.jsp" class="btn btn-outline-primary btn-sm">Sign up now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>