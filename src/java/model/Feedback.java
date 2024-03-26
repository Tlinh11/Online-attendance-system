/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class Feedback {
    private int id;
    private String content;
    private Date date;
    private String studentId;
    private String lectureId;
    private Lecture lecture;
    private Student st;
    public Feedback() {
    }

    public Feedback(int id, String content, Date date, String studentId, String lectureId, Lecture lecture, Student st) {
        this.id = id;
        this.content = content;
        this.date = date;
        this.studentId = studentId;
        this.lectureId = lectureId;
        this.lecture = lecture;
        this.st = st;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getLectureId() {
        return lectureId;
    }

    public void setLectureId(String lectureId) {
        this.lectureId = lectureId;
    }

    public Lecture getLecture() {
        return lecture;
    }

    public void setLecture(Lecture lecture) {
        this.lecture = lecture;
    }

    public Student getSt() {
        return st;
    }

    public void setSt(Student st) {
        this.st = st;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", content=" + content + ", date=" + date + ", studentId=" + studentId + ", lectureId=" + lectureId + ", lecture=" + lecture + ", st=" + st + '}';
    }

    
}
