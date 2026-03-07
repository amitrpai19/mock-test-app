package com.exam_app.servlets;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam_app.dao.UserDao;
import com.exam_app.entities.Message;
import com.exam_app.entities.User;
import com.exam_app.helper.ConnectionProvider;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    public void doPost(HttpServletRequest request,HttpServletResponse response) {

        try (PrintWriter out = response.getWriter()) {
            
            String name=request.getParameter("full_name");
            String email=request.getParameter("email").toLowerCase();
            String new_pass=request.getParameter("new_password");
            String confirm_pass=request.getParameter("confirm_password");

            UserDao dao=new UserDao(ConnectionProvider.connect());
            HttpSession session=request.getSession();
            Message msg=new Message();
            
            if(dao.userExists(email)) {

                msg.setCssClass("alert-danger");
                msg.setContent("Email already registered");
                session.setAttribute("msg", msg);
                response.sendRedirect("signup.jsp");

            } else if(!new_pass.equals(confirm_pass))  {

                msg.setCssClass("alert-danger");
                msg.setContent("Those passwords didn't match. Try again.");
                session.setAttribute("msg", msg);
                response.sendRedirect("signup.jsp");

            } else {
          
                User user=new User(name,email,confirm_pass);
                if(dao.addUser(user)) {

                    msg.setContent("Successfully Registered!");
                    msg.setCssClass("alert-success");
                    session.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");

                } else {

                    response.sendRedirect("error.jsp");
                }
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
