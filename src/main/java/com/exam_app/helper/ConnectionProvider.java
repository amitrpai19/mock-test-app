package com.exam_app.helper;
import java.sql.*;

public class ConnectionProvider {

    private static Connection conn=null;
    
    public static Connection connect() {
        
        try {
            if(conn==null) {
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/exam_app","postgres","amit");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
