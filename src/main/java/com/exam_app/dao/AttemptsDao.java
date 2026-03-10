package com.exam_app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.exam_app.entities.Attempt;
import java.util.ArrayList;
public class AttemptsDao {

    private Connection conn=null;

    public AttemptsDao(Connection conn) {
        this.conn = conn;
    }

    public int countAttempts(String email) {
        int count = 0;
        try {
            String query = "SELECT COUNT(DISTINCT test_id) AS distinct_tests_attended FROM attempts WHERE email = ? ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }   

        return count;
    }   

    public int countAttemptsByExam(String email, String examname) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM attempts a JOIN mock_tests mt ON a.test_id = mt.test_id JOIN exams e ON mt.exam_id = e.exam_id WHERE a.email = ? AND e.exam_name = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, examname);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return count;
    }

    public float getHighestPercentage(String email, int examId) {
        float percentage = 0;
        try {
            String query = " SELECT MAX((a.score_achieved * 100.0) / (m.total_questions * e.correct_marks)) AS highest_percentage FROM  Attempts a JOIN " +
                           " Mock_Tests m ON a.test_id = m.test_id  JOIN Exams e ON m.exam_id = e.exam_id WHERE a.email = ? ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setInt(2, examId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                percentage = rs.getFloat(1);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return percentage;
    }

    public float getAvgPercentage(String email, int examId) {
        float percentage = 0;
        try {
            String query = " SELECT AVG((a.score_achieved * 100.0) / (m.total_questions * e.correct_marks)) AS avg_percentage FROM  Attempts a JOIN " +
            " Mock_Tests m ON a.test_id = m.test_id  JOIN Exams e ON m.exam_id = e.exam_id WHERE a.email = ? AND a.exam_id = ? ";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setInt(2, examId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                percentage = rs.getFloat(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return percentage;
    }

    public List<Attempt> getAllAttempts(String email) {
        List<Attempt> attempts = new ArrayList<>();
        try {
            String query = "SELECT mt.test_name,a.attempt_id,q.question_id,q.question_text, get_option_text(aa.selected_option,"+
                           "q.option_a, q.option_b, q.option_c, q.option_d ) AS selected_option,get_option_text(q.correct_option,q.option_a, q.option_b, q.option_c, q.option_d) AS correct_option "+
                           "FROM attempts a JOIN mock_tests mt ON a.test_id = mt.test_id JOIN attempt_answers aa ON a.attempt_id = aa.attempt_id JOIN questions q " +
                           "ON aa.question_id = q.question_id WHERE a.email = ? ORDER BY a.attempt_id, q.question_id";

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {

                Attempt currentAttempt = null;

                while (rs.next()) {
                    int attemptId = rs.getInt("attempt_id");
                    
                    if (currentAttempt == null || currentAttempt.getAttemptId() != attemptId) {
                        currentAttempt = new Attempt();
                        currentAttempt.setTestname(rs.getString("test_name"));
                        currentAttempt.setAttemptId(attemptId);
                        attempts.add(currentAttempt);
                    }
                    currentAttempt.addQuestion(rs.getString("question_text"), rs.getString("selected_option"), rs.getString("correct_option"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return attempts;        
    }

    public List<Attempt> getAttemptsByExam(String email, String examname) {
        List<Attempt> attempts = new ArrayList<>();
        try {

            String query = "SELECT mt.test_name,q.question_id, q.question_text, q.correct_option,aa.selected_option,a.attempt_id " + 
                            "FROM exams e JOIN mock_tests mt ON e.exam_id = mt.exam_id JOIN attempts a ON mt.test_id = a.test_id " + 
                            "JOIN attempt_answers aa ON a.attempt_id = aa.attempt_id JOIN questions q ON aa.question_id = q.question_id " + 
                            "WHERE e.exam_name = ? AND a.email = ? ORDER BY mt.test_name, q.question_id";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, examname);
            ResultSet rs = pstmt.executeQuery();
             while (rs.next()) {
                
                Attempt currentAttempt = null;
                int attemptId = rs.getInt("attempt_id");

                if (currentAttempt == null || currentAttempt.getAttemptId() != attemptId) {
                    currentAttempt = new Attempt();
                    currentAttempt.setTestname(rs.getString("test_name"));
                    currentAttempt.setAttemptId(attemptId);
                    attempts.add(currentAttempt);
                }
                currentAttempt.addQuestion(rs.getString("question_text"), rs.getString("selected_option"), rs.getString("correct_option"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return attempts;    
    }
}