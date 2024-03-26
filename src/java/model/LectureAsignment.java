/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;

/**
 *
 * @author admin
 */
public class LectureAsignment {
    private BigInteger idLectureAs;
    private BigInteger lectureId;
    private BigInteger classId;

    public LectureAsignment() {
    }

    public LectureAsignment(BigInteger idLectureAs, BigInteger lectureId, BigInteger classId) {
        this.idLectureAs = idLectureAs;
        this.lectureId = lectureId;
        this.classId = classId;
    }

    public BigInteger getIdLectureAs() {
        return idLectureAs;
    }

    public void setIdLectureAs(BigInteger idLectureAs) {
        this.idLectureAs = idLectureAs;
    }

    public BigInteger getLectureId() {
        return lectureId;
    }

    public void setLectureId(BigInteger lectureId) {
        this.lectureId = lectureId;
    }

    public BigInteger getClassId() {
        return classId;
    }

    public void setClassId(BigInteger classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "LectureAsignment{" + "idLectureAs=" + idLectureAs + ", lectureId=" + lectureId + ", classId=" + classId + '}';
    }
    
    
}
