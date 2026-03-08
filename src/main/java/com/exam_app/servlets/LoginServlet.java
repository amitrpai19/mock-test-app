package com.exam_app.servlets;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam_app.dao.UserDao;
import com.exam_app.entities.Message;
import com.exam_app.entities.User;
import com.exam_app.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request,HttpServletResponse response) {

        User u=null;
        try {
            
            String email=request.getParameter("email").toLowerCase();
            String pass=request.getParameter("password");
            UserDao dao=new UserDao(ConnectionProvider.connect());

            HttpSession session=request.getSession();
            if((u=dao.validate(email,pass))!=null) {
                
                session.setAttribute("currentUser", u);
                response.sendRedirect("dashboard.jsp");
            }
            else {
                Message msg=new Message("Invalid Details! Try Again...",  "alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("login.jsp");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
