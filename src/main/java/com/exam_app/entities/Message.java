package com.exam_app.entities;

public class Message {

    private String content;
    private String cssClass;
    
    public Message(String content, String cssClass) {
        this.content = content;
        this.cssClass = cssClass;
    }

    public Message() {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
    
}
