/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoct
 */
public class TrainingDepartment {
    private String id;
    private int phone;
    private String email;

    public TrainingDepartment() {
    }

    public TrainingDepartment(String id, int phone, String email) {
        this.id = id;
        this.phone = phone;
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "TrainigDepartment{" + "id=" + id + ", phone=" + phone + ", email=" + email + '}';
    }

    
}
