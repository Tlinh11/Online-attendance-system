/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Classes {
    private int id;
    private String Name;
    private Date StartDate;
    private Date EndDate;

    public Classes() {
    }

    public Classes(int id, String Name, Date StartDate, Date EndDate) {
        this.id = id;
        this.Name = Name;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public void setStartDate(Date StartDate) {
        this.StartDate = StartDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public void setEndDate(Date EndDate) {
        this.EndDate = EndDate;
    }

    @Override
    public String toString() {
        return "Classes{" + "id=" + id + ", Name=" + Name + ", StartDate=" + StartDate + ", EndDate=" + EndDate + '}';
    }
    
    
}
