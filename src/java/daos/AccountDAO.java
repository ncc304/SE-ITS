/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

/**
 *
 * @author Admin
 */
import dtos.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class AccountDAO {

    public String checkLogin(String email) {
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Account WHERE email LIKE '"+email+"';";
            PreparedStatement pr = con.prepareStatement(sql);
//            pr.setString(1, email.trim());
            ResultSet rs = pr.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("isAdmin") == 1) {
                    String sql2 = "UPDATE SWP391.Account SET Account_Status_idAccount_Status = \"2\" WHERE email LIKE ?";
                    PreparedStatement pr2 = con.prepareStatement(sql2);
                    pr2.setString(1, rs.getString(2));
                    pr2.executeUpdate();
                    return "Admin";
                } else {
                    String sql2 = "UPDATE SWP391.Account SET Account_Status_idAccount_Status = \"2\" WHERE email LIKE ?";
                    PreparedStatement pr2 = con.prepareStatement(sql2);
                    pr2.setString(1, rs.getString(2));
                    pr2.executeUpdate();
                    return "User";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Login Fail";
    }

    public boolean addAccountRegisEvent(AccountDTO account) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`Account` (`email`, `Account_Status_idAccount_Status`, `name`, `phone_number`, `isAdmin`) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int tmp = 0;
            if (account.isIsAdmin()) {
                tmp = 1;
            }
            pr.setString(1, account.getEmail());
            pr.setInt(2, account.getStatusId());
            pr.setString(3, account.getName());
            pr.setString(4, account.getPhoneNumber());
            pr.setInt(5, tmp);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
