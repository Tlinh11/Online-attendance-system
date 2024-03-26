/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author -MSI-
 */
public class AccountDBContext extends DBContext {

    public Account getAccount(String username, String password) {
        Account a = null;
        try {
            String sql = "SELECT username, [password],email  rolid FROM account\n"
                    + "WHERE username LIKE ? AND [password] LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                a = new Account();
                a.setUsername(username);
                a.setPassword(password);
                a.setRole(rs.getString("rolid"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public Account getAccountByEmail(String email) {
        Account a = null;
        try {
            String sql = "SELECT username, [password], rolid FROM account\n"
                    + "WHERE email LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                a = new Account();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setRole(rs.getString("rolid"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
   
}
