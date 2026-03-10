<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            max-height: 500px; 
            overflow-y: auto;
            padding-right: 10px; 
        }
        
        .scrollable-history::-webkit-scrollbar {
            width: 6px;
        }
        .scrollable-history::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 4px;
        }
</style>
<div class="col-md-2 sidebar">

    <h4 class="text-center mb-4">Mock Test</h4>

    <a href="dashboard.jsp">Dashboard</a>
    <a href="startTest.jsp">Exams</a>
    <a href="results.jsp">Subjects</a>
    <a href="LogoutServlet">Logout</a>

</div>