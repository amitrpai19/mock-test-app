<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.exam_app.entities.Message" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - My Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .card { 
            border-radius: 1rem; 
            border: none; 
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="card shadow-lg">
                <div class="card-body p-5">
                    <h2 class="text-center mb-4 fw-bold text-success">Register</h2>
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
                    <form id="reg-form" action="SignupServlet" method="POST">
                         <div class="mb-3">
                            <label class="form-label">Enter Name</label>
                            <input type="text" name="full_name" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Enter Email ID</label>
                            <input type="text" name="email" class="form-control" placeholder="Email ID" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">New Password</label>
                            <input type="password" name="new_password" class="form-control" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Confirm Password</label>
                            <input type="password" name="confirm_password" class="form-control" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg">Create Account</button>
                        </div>
                    </form>
                    <hr class="my-4">

                    <div class="text-center">
                        <p class="small mb-1">Already have an account?</p>
                        <a href="login.jsp" class="btn btn-outline-success btn-sm">Login now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script>
$(document).ready(function() {
    console.log("Page loaded and ready.");

    $('#reg-form').on('submit', function(event) {
        // Stop the page from refreshing
        event.preventDefault();

        // Basic Password Validation
        let pass = $("input[name='new_password']").val();
        let confirmPass = $("input[name='confirm_password']").val();

        if (pass !== confirmPass) {
            alert("Passwords do not match!");
            return;
        }

        // Get form data
        let formData = $(this).serialize();

        // AJAX Call
        $.ajax({
            url: "SignupServlet", // The URL of your servlet
            type: "POST",
            data: formData,
            success: function(response) {
                // This runs if the servlet returns a 200 OK status
                console.log("Success:", response);
                alert("Registration Successful!");
                // Optionally redirect: window.location.href = "login.jsp";
            },
            error: function(xhr, status, error) {
                // This runs if there is a server error (e.g., 500 or 404)
                console.error("Error:", error);
                alert("Something went wrong. Please try again.");
            }
        });
    });
}); 
</script> -->
</body>
</html>