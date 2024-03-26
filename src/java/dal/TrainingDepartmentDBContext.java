/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import model.TrainingDepartment;

/**
 *
 * @author Tlinh
 */
public class TrainingDepartmentDBContext extends DBContext {
    public TrainingDepartment getInfoTrainingDepartment(String email){
        TrainingDepartment s =null;
        try {
            String sql =  "select * from TrainingDepartment where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                s= new TrainingDepartment();
                s.setId(rs.getString("idTrainingDepartment"));
                s.setPhone(rs.getInt("PhoneNumber"));
                s.setEmail(rs.getString("Email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
        
    }
}
