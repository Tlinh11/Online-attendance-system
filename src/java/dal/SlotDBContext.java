/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.TimeSlot;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author -MSI-
 */
public class SlotDBContext extends DBContext{

   
    public ArrayList<TimeSlot> list() {
            ArrayList<TimeSlot> slots =new ArrayList<>();
        try {
            String sql="select id,[description] from timeslot";
            PreparedStatement stm =connection.prepareStatement(sql);
            ResultSet rs= stm.executeQuery();
            while(rs.next()){
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("id"));
                t.setDescription(rs.getString("description"));
                slots.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  slots;
    }
    
}
