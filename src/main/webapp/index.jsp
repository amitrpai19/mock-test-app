<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="com.exam_app.helper.ConnectionProvider" %>
<html>
<body>
<h2>Hello World!</h2>
<% 
Connection con=ConnectionProvider.connect();
%>

<h1><%= con %></h1>
</body>
</html>
