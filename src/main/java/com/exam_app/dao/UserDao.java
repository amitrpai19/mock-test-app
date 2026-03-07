package com.exam_app.dao;
import java.sql.*;
import com.exam_app.entities.User;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean addUser(User user) {
        
        boolean f=false;
        try {
            String query ="insert into users (full_name,email,password_hash) values (?,?,?)";
            PreparedStatement pstmt=this.conn.prepareStatement(query);
            pstmt.setString(1, user.getFull_name());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword_hash());

            pstmt.executeUpdate();
            f=true;
        } catch (SQLException e) {
           e.printStackTrace();
        }

        return f;
    }

    public boolean userExists(String email) {
    boolean exists = false;
    String query = "SELECT 1 FROM users WHERE email = ?";

    try (PreparedStatement stmt = this.conn.prepareStatement(query)) {
        
        stmt.setString(1, email);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                exists = true;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return exists;
}

    public User validate(String email, String password) {

        User user = null;
        try {
            
            String query="select * from users where email = ? and password_hash = ?";
            PreparedStatement pstmt =this.conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs=pstmt.executeQuery();
            if(rs.next()) {

                user=new User();
                String name=rs.getString("full_name");
                user.setEmail(email);
                user.setFull_name(name);
                user.setPassword_hash(password);
            }
                
        } catch (Exception e) {
            
            e.printStackTrace();
        }

        return user;
    }
}
