<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="com.exam_app.helper.ConnectionProvider, com.exam_app.entities.User" %>
<html>
<body>
 hi 
 
 <% 
    User user = (User)session.getAttribute("current_user");
    out.println(user.getFull_name());
 %>

</body>
</html>
