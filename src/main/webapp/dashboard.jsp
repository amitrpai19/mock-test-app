<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam_app.entities.User" %>
<%@ page import="com.exam_app.dao.AttemptsDao" %>
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
    </style>
</head>
<%

   User user=(User)session.getAttribute("currentUser");
   if(user==null) {
       response.sendRedirect("login.jsp");
   } else {

        AttemptsDao attemptsDao=new AttemptsDao();
        int totalAttempts=attemptsDao.getTotalAttemptsByUser(user.getId());
        float highestPercentage=attemptsDao.getHighestPercentage(user.getEmail(), 1);
        float avgPercentage=attemptsDao.getAvgPercentage(user.getEmail(), 1);
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
                        <p class="fs-4"><%= totalAttempts %></p>
                    </div>

                    <div class="col-md-3">
                        <h5>Highest Percentage</h5>
                        <p class="fs-4"><%= highestPercentage %></p>
                    </div>

                    <div class="col-md-3">
                        <h5>Average</h5>
                        <p class="fs-4"><%= avgPercentage %></p>
                    </div>

                </div>
            </div>

            <div class="accordion" id="examAccordion">

                <div class="accordion-item">

                    <h2 class="accordion-header">

                        <button
                            class="accordion-button collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#exam1">

                            Java Mock Test 1

                        </button>

                    </h2>


                    <div
                        id="exam1"
                        class="accordion-collapse collapse"
                        data-bs-parent="#examAccordion">

                        <div class="accordion-body">


                            <!-- Question Grid -->

                            <div class="question-grid">

                                <div class="qbox correct" onclick="showQuestion('exam1',1)"></div>
                                <div class="qbox wrong" onclick="showQuestion('exam1',2)"></div>
                                <div class="qbox correct" onclick="showQuestion('exam1',3)"></div>
                                <div class="qbox unattempted" onclick="showQuestion('exam1',4)"></div>
                                <div class="qbox wrong" onclick="showQuestion('exam1',5)"></div>
                                <div class="qbox correct" onclick="showQuestion('exam1',6)"></div>
                                <div class="qbox correct" onclick="showQuestion('exam1',7)"></div>
                                <div class="qbox wrong" onclick="showQuestion('exam1',8)"></div>
                                <div class="qbox unattempted" onclick="showQuestion('exam1',9)"></div>
                                <div class="qbox correct" onclick="showQuestion('exam1',10)"></div>

                            </div>

                            <!-- Question Display -->
                            <div
                                id="exam1-question"
                                class="question-display">

                                Click a question square to view the question.

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

<script>

    const examData = {

        exam1: {

            1: {
                q: "What is JVM?",
                opt: "Selected Option: A"
            },

            2: {
                q: "Which keyword is used for inheritance?",
                opt: "Selected Option: extends"
            },

            3: {
                q: "Which collection is synchronized?",
                opt: "Selected Option: Vector"
            },

            4: {
                q: "What is polymorphism?",
                opt: "Not Attempted"
            },

            5: {
                q: "What is JDK?",
                opt: "Selected Option: Java Development Kit"
            }

        }

    };


    function showQuestion(examId, qno) {
        let q = examData[examId][qno];
        document.getElementById(examId + "-question").innerHTML =
            "<h5>Question " + qno + "</h5>" +
            "<p>" + q.q + "</p>" +
            "<b>" + q.opt + "</b>";
    }

</script>
</body>
</html>