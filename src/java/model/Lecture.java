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
public class Lecture {
    private String id;
    private String name;
    private Date dob;
    private String email;
    private String username;
    

    public Lecture() {
    }

    public Lecture(String id, String name, Date dob, String email, String username) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.email = email;
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Lecture{" + "id=" + id + ", name=" + name + ", dob=" + dob + ", email=" + email + ", username=" + username + '}';
    }

}
