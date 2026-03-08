package com.exam_app.entities;

public class MockTest {

    private int test_id;
    private int exam_id;
    private String test_name;
    private int test_duration;
    private int total_questions;

    public MockTest() {
    }       

    public MockTest(int test_id, int exam_id, String test_name, int test_duration, int total_questions) {
        this.test_id = test_id;
        this.exam_id = exam_id;
        this.test_name = test_name;
        this.test_duration = test_duration;
        this.total_questions = total_questions;
    }

    public int getTest_id() {
        return test_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public String getTest_name() {
        return test_name;
    }

    public int getTest_duration() {
        return test_duration;
    }

    public int getTotal_questions() {
        return total_questions;
    }

    
}
