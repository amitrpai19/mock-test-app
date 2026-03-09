<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.exam_app.entities.User" %>
<%@ page import="com.exam_app.dao.AttemptsDao" %>
<%@ page import="com.exam_app.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.exam_app.entities.Attempt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
        }

        .sidebar {
            height: 100vh;
            background: #212529;
            color: white;
            padding-top: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background: #712cf0;
        }

        .main {
            padding: 30px;
        }

        .question-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-top: 15px;
        }

        .qbox {
            width: 22px;
            height: 22px;
            border-radius: 4px;
            cursor: pointer;
        }

        .correct {
            background: #28a745;
        }

        .wrong {
            background: #dc3545;
        }

        .unattempted {
            background: #d3d3d3;
        }

        .qbox:hover {
            transform: scale(1.1);
        }

        .question-display {
            margin-top: 20px;
            padding: 15px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .scrollable-history {
            max-height: 500px; /* You can adjust this height to fit your screen nicely */
            overflow-y: auto;
            padding-right: 10px; /* Adds a little space so the scrollbar doesn't overlap text */
        }
        
        /* Optional: Makes the scrollbar look slightly cleaner in webkit browsers (Chrome/Edge/Safari) */
        .scrollable-history::-webkit-scrollbar {
            width: 6px;
        }
        .scrollable-history::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<%

   User user=(User)session.getAttribute("currentUser");
   if(user==null) {
       response.sendRedirect("login.jsp");
   } else {

        AttemptsDao attemptsDao=new AttemptsDao(ConnectionProvider.connect());
        //int totalAttempts=attemptsDao.countAttempts(user.getEmail());
       // float highestPercentage=attemptsDao.getHighestPercentage(user.getEmail(), 1);
       // float avgPercentage=attemptsDao.getAvgPercentage(user.getEmail(), 1);
        List<Attempt> attempts = attemptsDao.getAllAttempts(user.getEmail());
        request.setAttribute("attempts", attempts); 
   }

%>

<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="navbar.jsp" %>
            <div class="col-md-10 main">

            <!-- Statistics Card -->

            <div class="card shadow p-4 mb-4">

                <h4>User Statistics</h4>

                <div class="row text-center mt-3">

                    <div class="col-md-3">
                        <h5>Attempted</h5>
                        <p class="fs-4">10</p>
                    </div>

                    <div class="col-md-3">
                        <h5>Highest Percentage</h5>
                        <p class="fs-4">85.0</p>
                    </div>

                    <div class="col-md-3">
                        <h5>Average</h5>
                        <p class="fs-4">75.0</p>
                    </div>

                </div>
            </div>

            <div class="card shadow p-4 mb-4">
                <h4 class="mb-4">Exam Attempts History</h4>
                
                <div class="scrollable-history">
                    <div class="accordion" id="examAccordion">
                        <c:forEach var="attempt" items="${attempts}">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#attempt${attempt.attemptId}">
                                        ${attempt.testname} 
                                    </button>
                                </h2>
                                <div id="attempt${attempt.attemptId}" class="accordion-collapse collapse" data-bs-parent="#examAccordion">
                                    <div class="accordion-body">
                                        <div class="question-grid">
                                            <c:forEach var="question" items="${attempt.questionTexts}" varStatus="status">
                                                <c:set var="userAns" value="${attempt.userAnswers[status.index]}" />
                                                <c:set var="correctAns" value="${attempt.correctAnswers[status.index]}" />
                                                <c:set var="boxClass">
                                                    <c:choose>
                                                        <c:when test="${userAns eq correctAns and not empty userAns}">correct</c:when>
                                                        <c:when test="${empty userAns or userAns eq 'Not Attempted'}">unattempted</c:when>
                                                        <c:otherwise>wrong</c:otherwise>
                                                    </c:choose>
                                                </c:set>
                                                <div class="qbox ${boxClass}" onclick="showQuestion('attempt${attempt.attemptId}', ${status.index + 1})"></div>
                                            </c:forEach>
                                        </div>
                                        <div id="attempt${attempt.attemptId}-question" class="question-display">
                                            Click a question square to view the question.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div> </div>
            
        </div>
    </div>
</div>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

<script>
    const examData = {};
    <%
    List<Attempt> attemptsList = (List<Attempt>) request.getAttribute("attempts");
    if (attemptsList != null) {
        for (Attempt currentAttempt : attemptsList) {
            out.print("examData['attempt" + currentAttempt.getAttemptId() + "'] = {");
            List<String> questions = currentAttempt.getQuestionTexts();
            List<String> answers = currentAttempt.getUserAnswers();
            List<String> correctAnswers = currentAttempt.getCorrectAnswers(); // Fetch correct answers

            for (int i = 0; i < questions.size(); i++) {
                String q = questions.get(i).replace("\"", "\\\"").replace("\n", "\\n");
                String opt = answers.get(i) != null ? answers.get(i).replace("\"", "\\\"") : "Not Attempted";
                // Escape the correct answer string just like the others
                String correctOpt = correctAnswers.get(i) != null ? correctAnswers.get(i).replace("\"", "\\\"") : "N/A"; 
                
                // Add the 'correct' property to our JSON object
                out.print((i+1) + ": { q: \"" + q + "\", opt: \"" + opt + "\", correct: \"" + correctOpt + "\" }");
                if (i < questions.size() - 1) out.print(",");
            }
            out.println("};");
        }
    }
    %>

    function showQuestion(examId, qno) {
        let q = examData[examId][qno];
        
        // Optional: Let's add some bootstrap text colors based on whether they got it right or wrong
        let userAnsColor = "text-danger"; // Default to red (wrong)
        if (q.opt === q.correct) {
            userAnsColor = "text-success"; // Green if correct
        } else if (q.opt === "Not Attempted") {
            userAnsColor = "text-secondary"; // Gray if unattempted
        }

        // Update the HTML inside the display div
        document.getElementById(examId + "-question").innerHTML =
            "<h5>Question " + qno + "</h5>" +
            "<p class='mb-3'>" + q.q + "</p>" +
            "<p class='mb-1 " + userAnsColor + "'><b>Your Answer:</b> " + q.opt + "</p>" +
            "<p class='text-success'><b>Correct Answer:</b> " + q.correct + "</p>";
    }
</script>
</body>
</html>