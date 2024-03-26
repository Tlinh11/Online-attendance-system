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
public class Admin {
    private BigInteger id;
    private String email;

    public Admin() {
    }

    public Admin(BigInteger id, String email) {
        this.id = id;
        this.email = email;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Admin{" + "id=" + id + ", email=" + email + '}';
    }
    
    
}
