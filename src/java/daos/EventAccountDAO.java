/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventAccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import utils.MyConnection;

/**
 *
 * @author Admin
 */
public class EventAccountDAO {

    Connection con = null;

    public List<EventAccountDTO> getListEventAccount(int userID) {
        List<EventAccountDTO> listEventAccount = new ArrayList<>();
        int id = 0;
        int eventId = 0;
        int accountId = 0;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events_has_Account WHERE Account_id = " + userID;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                eventId = rs.getInt("Events_id");
                accountId = rs.getInt("Account_id");
                int tmp = rs.getInt("status");
                if (tmp == 1) {
                    status = true;
                } else {
                    status = false;
                }
                EventAccountDTO dto = new EventAccountDTO(id, eventId, accountId, status);
                listEventAccount.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEventAccount;
    }

    public List<EventAccountDTO> getListEventAccount_Admin() {
        List<EventAccountDTO> listEventAccount = new ArrayList<>();
        int id = 0;
        int eventId = 0;
        int accountId = 0;
        boolean status = false;
        try {

            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events_has_Account";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                eventId = rs.getInt("Events_id");
                accountId = rs.getInt("Account_id");
                int tmp = rs.getInt("status");
                if (tmp == 1) {
                    status = true;
                } else {
                    status = false;
                }
                EventAccountDTO dto = new EventAccountDTO(id, eventId, accountId, status);
                listEventAccount.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEventAccount;
    }
    
    public boolean createtEventAccount(EventAccountDTO eventAccount) {
        boolean check = false;
        int tmp = 0;
        if (eventAccount.isStatus()) {
            tmp = 1;
        }
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Events_has_Account (Events_id, Account_id, status) VALUES (?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, eventAccount.getEventId());
            pr.setInt(2, eventAccount.getAccountId());
            pr.setInt(3, tmp);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateEventAccount(EventAccountDTO eventAccount) {
        boolean check = false;
        int status = -1;
        if (eventAccount.isStatus()) {
            status = 1;
        }else{
            status = 0;
        }
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Events_has_Account SET status = ? WHERE (Events_id = ? AND Account_id = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, status);
            pr.setInt(2, eventAccount.getEventId());
            pr.setInt(3, eventAccount.getAccountId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteEventAccount(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Events_has_Account` WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // ---------------- User Page -----------------------
    // Tìm Event Has Account theo UserID
    public List<EventAccountDTO> getListEventHasAccountByUserID(int userID) {
        List<EventAccountDTO> list = new ArrayList<>();
        int id = 0;
        int eventId = 0;
        int accountId = 0;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events_has_Account WHERE Account_id = " + userID ;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                eventId = rs.getInt("Events_id");
                accountId = rs.getInt("Account_id");
                if (rs.getInt("status") == 1) {
                    status = true;
                }
                EventAccountDTO dto = new EventAccountDTO(id, eventId, accountId, status);
                list.add(dto);
                status = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Check Event_id có trong tbl chưa
    public boolean checkEventID(int userID, int eventID) {
        boolean check = false;
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events_has_Account WHERE Account_id = "+userID+" AND Events_id = "+eventID;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
            check = false;
            e.printStackTrace();
        }
        return check;
    }
    
}
