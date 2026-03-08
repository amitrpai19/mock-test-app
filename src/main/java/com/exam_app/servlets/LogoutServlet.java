package com.exam_app.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response) {

        try {
            HttpSession session=request.getSession();
            session.removeAttribute("currentUser");
            session.invalidate();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
