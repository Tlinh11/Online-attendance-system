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
public class Parent {
    private BigInteger id;
    private String name;
    private String add;
    private String email;
    private String pass;
    private String userName;
    private String job;
    private String placeOfWork;

    public Parent() {
    }

    public Parent(BigInteger id, String name, String add, String email, String pass, String userName, String job, String placeOfWork) {
        this.id = id;
        this.name = name;
        this.add = add;
        this.email = email;
        this.pass = pass;
        this.userName = userName;
        this.job = job;
        this.placeOfWork = placeOfWork;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getPlaceOfWork() {
        return placeOfWork;
    }

    public void setPlaceOfWork(String placeOfWork) {
        this.placeOfWork = placeOfWork;
    }

    @Override
    public String toString() {
        return "Parent{" + "id=" + id + ", name=" + name + ", add=" + add + ", email=" + email + ", pass=" + pass + ", userName=" + userName + ", job=" + job + ", placeOfWork=" + placeOfWork + '}';
    }
    
    
    
}
