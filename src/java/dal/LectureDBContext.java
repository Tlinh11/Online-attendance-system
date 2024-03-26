/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Lecture;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Session;

/**
 *
 * @author -MSI-
 */
public class LectureDBContext extends DBContext {

    public ArrayList<Lecture> getTeacherForSearch(String lectureInfo) {
        ArrayList<Lecture> teachers = new ArrayList<>();
        try {
            String sql = "select id,name,dob,email,username from lecture where username like ? or id  like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + lectureInfo + "%");
            stm.setString(2, "%" + lectureInfo + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecture t = new Lecture();
                t.setId(rs.getString("id"));
                t.setName(rs.getString("name"));
                t.setDob(rs.getDate("dob"));
                t.setEmail(rs.getString("email"));
                t.setUsername(rs.getString("username"));
                teachers.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return teachers;
    }

    public void updateLectureAfterEdit(String oldID, String newid, String name, String dob, String email, String username) {
        try {
            String sql = "update lecture\n"
                    + "set id = ? ,name= ? ,dob = ?  ,email = ? ,userName = ? \n"
                    + "where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newid);
            stm.setString(2, name);
            stm.setDate(3, java.sql.Date.valueOf(dob));
            stm.setString(4, email);
            stm.setString(5, username);
            stm.setString(6, oldID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Lecture> getTeacherChangeSchedule(String date, int slotid) {
        ArrayList<Lecture> teachers = new ArrayList<>();
        try {
            String sql = "SELECT l.id, l.name\n"
                    + "FROM Lecture l\n"
                    + "WHERE l.id NOT IN (\n"
                    + "    SELECT s.lectureid\n"
                    + "    FROM [Group] g\n"
                    + "    INNER JOIN [Session] s ON g.id = s.group_id\n"
                    + "    WHERE s.date = ? -- Ngày cụ thể\n"
                    + "    AND g.timeSlotID = ? -- Slot thời gian cụ thể\n"
                    + ")";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, java.sql.Date.valueOf(date));
            stm.setInt(2, slotid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecture t = new Lecture();
                t.setId(rs.getString("id"));
                t.setName(rs.getString("name"));
                teachers.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return teachers;
    }

    public Lecture getLectureByID(String id) {
        Lecture t = null;
        try {
            String sql = "select * from lecture where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                t = new Lecture();
                t.setId(rs.getString("id"));
                t.setName(rs.getString("name"));
                t.setDob(rs.getDate("dob"));
                t.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
        }
        return t;
    }
  

    public void updateLectureChange(String lid, int sid) {
        try {
            String sql = "update [Session]\n"
                    + "  set lectureid = ?\n"
                    + "  where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            stm.setInt(2, sid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LectureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

      public Lecture getLectureByUserName(String email) {
        Lecture t = null;
        try {
            String sql = "select * from lecture where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                t = new Lecture();
                t.setId(rs.getString("id"));
                t.setName(rs.getString("name"));
                t.setDob(rs.getDate("dob"));
                t.setEmail(rs.getString("email"));
                t.setUsername(rs.getString("username"));
            }
        } catch (SQLException e) {
        }
        return t;
    }
  
}
