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
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import utils.MyConnection;

public class AccountDAO {

    private Connection con = null;

    public String checkLogin(String email) {
        try {

            // SQLServer
            Connection con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Account WHERE email LIKE '" + email + "';";
            PreparedStatement pr = con.prepareStatement(sql);
//            pr.setString(1, email.trim());
            ResultSet rs = pr.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    if(rs.getInt("Account_Status_idAccount_Status") == 6){
                        return "Blocked";
                    }
                    else if (rs.getInt("isAdmin") == 1) {
                        String sql2 = "UPDATE SWP391.Account SET Account_Status_idAccount_Status = 4 WHERE email LIKE ?";
                        PreparedStatement pr2 = con.prepareStatement(sql2);
                        pr2.setString(1, rs.getString("email"));
                        pr2.executeUpdate();
                        return "Admin";
                    } else {
                        String sql2 = "UPDATE SWP391.Account SET Account_Status_idAccount_Status = 4 WHERE email LIKE ?";
                        PreparedStatement pr2 = con.prepareStatement(sql2);
                        pr2.setString(1, rs.getString("email"));
                        pr2.executeUpdate();
                        return "User";
                    }
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
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Account (email, Account_Status_idAccount_Status, name, phone_number, isAdmin) VALUES (?, ?, ?, ?, ?);";
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

    public int getUserID(String email) {
//        int userID = -1;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT id FROM SWP391.Account WHERE email LIKE '" + email + "';";
//            PreparedStatement pr = con.prepareStatement(sql);
//            ResultSet rs = pr.executeQuery(sql);
//            if (rs.next()) {
//                userID = rs.getInt("id");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return userID;

        //SQLserver
        int userID = -1;
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT id FROM SWP391.Account WHERE email LIKE '%" + email + "%';";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                userID = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userID;
    }

    public String getUserName(String email) {
//        String userName = "";
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT name FROM SWP391.Account WHERE email LIKE '" + email + "';";
//            PreparedStatement pr = con.prepareStatement(sql);
//            ResultSet rs = pr.executeQuery(sql);
//            if (rs.next()) {
//                userName = rs.getString("name");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return userName;

        String userName = "";
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT name FROM SWP391.Account WHERE email LIKE '" + email + "';";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                userName = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userName;
    }
    
    public AccountDTO getAccountByEmail(String emailStr) {
        AccountDTO dto = null;
        
        int userID = 0;
        String email = null;
        int accountStatus = 0;
        String name = null;
        String phone = null;
        boolean isAdmin = false;
        
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Account WHERE email LIKE '" + emailStr + "';";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                userID = rs.getInt("id");
                email = rs.getString("email");
                accountStatus = rs.getInt("Account_Status_idAccount_Status");
                name = rs.getString("name");
                phone = rs.getString("phone_number");
                if(rs.getInt("isAdmin") == 1){
                    isAdmin = true;
                }else{
                    isAdmin = false;
                }
                dto = new AccountDTO(userID, email, accountStatus, name, phone, isAdmin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    public boolean updateStatus(int id, int status){
        boolean check = false;
        
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Account SET Account_Status_idAccount_Status = "+status+" WHERE id ="+id;
            PreparedStatement pr = con.prepareStatement(sql);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    public List<AccountDTO> getAllAccountUser() {
        List<AccountDTO> list = new ArrayList<>();
        AccountDTO dto = null;
        int userID = 0;
        String email = null;
        int accountStatus = 0;
        String name = null;
        String phone = null;
        boolean isAdmin = false;
        
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Account WHERE isAdmin = 0 ";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                userID = rs.getInt("id");
                email = rs.getString("email");
                accountStatus = rs.getInt("Account_Status_idAccount_Status");
                name = rs.getString("name");
                phone = rs.getString("phone_number");
                if(rs.getInt("isAdmin") == 1){
                    isAdmin = true;
                }else{
                    isAdmin = false;
                }
                dto = new AccountDTO(userID, email, accountStatus, name, phone, isAdmin);
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public AccountDTO getAccountByID(int id) {
        AccountDTO dto = null;
        int userID = 0;
        String email = null;
        int accountStatus = 0;
        String name = null;
        String phone = null;
        boolean isAdmin = false;
        
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Account WHERE isAdmin = 0 AND id = "+id;
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                userID = rs.getInt("id");
                email = rs.getString("email");
                accountStatus = rs.getInt("Account_Status_idAccount_Status");
                name = rs.getString("name");
                phone = rs.getString("phone_number");
                if(rs.getInt("isAdmin") == 1){
                    isAdmin = true;
                }else{
                    isAdmin = false;
                }
                dto = new AccountDTO(userID, email, accountStatus, name, phone, isAdmin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
