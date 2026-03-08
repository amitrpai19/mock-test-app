package com.exam_app.entities;

import java.util.*;

public class Attempt {

    private int attemptId;
    private String testname;
    private List<String> questionTexts;
    private List<String> userAnswers;
    private List<String> correctAnswers;
    private int scoreAchieved;

    public Attempt() {
        questionTexts = new ArrayList<>();
        userAnswers = new ArrayList<>();
        correctAnswers = new ArrayList<>();
    }

    public Attempt(int attemptId, String testname, int scoreAchieved) {
        super();
        this.attemptId = attemptId;
        this.testname = testname;
        this.scoreAchieved = scoreAchieved;
    }

    public int getAttemptId() {
        return attemptId;
    }

    public void setAttemptId(int attemptId) {
        this.attemptId = attemptId;
    }

    public String getTestname() {
        return testname;
    }

    public void setTestname(String testname) {
        this.testname = testname;
    }

    public int getScoreAchieved() {
        return scoreAchieved;
    }

    public void setScoreAchieved(int scoreAchieved) {
        this.scoreAchieved = scoreAchieved;
    }

    public List<String> getQuestionTexts() {
        return questionTexts;
    }

    public List<String> getUserAnswers() {
        return userAnswers;
    }

    public List<String> getCorrectAnswers() {
        return correctAnswers;
    }

    public void addQuestion(String questionText, String userAnswer, String correctAnswer) {
        this.questionTexts.add(questionText);
        this.userAnswers.add(userAnswer);
        this.correctAnswers.add(correctAnswer);
    }
}
