/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventsImageDTO;
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
public class EventImageDAO {
    private Connection con = null;
    
    public List<EventsImageDTO> getListEventsImage() {
        List<EventsImageDTO> listEventsImage = new ArrayList<>();
        int id = 0;
        String link = null;
        int eventId = 0;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT * FROM SWP391.Event_Images;";
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                id = rs.getInt("idEvent_Images");
//                link = rs.getString("link");
//                eventId = rs.getInt("Events_id");
//                EventsImageDTO dto = new EventsImageDTO(id, link, eventId);
//                listEventsImage.add(dto);
//            }
//        }
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Event_Images;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idEvent_Images");
                link = rs.getString("link");
                eventId = rs.getInt("Events_id");
                EventsImageDTO dto = new EventsImageDTO(id, link, eventId);
                listEventsImage.add(dto);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return listEventsImage;
    }

    public boolean createtEventsImage(EventsImageDTO eventImage) {
        boolean check = false;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "INSERT INTO SWP391.Event_Images (`link`, `Events_id`) VALUES (?, ?);";
//            PreparedStatement pr = con.prepareStatement(sql);
//            pr.setString(1, eventImage.getLink());
//            pr.setInt(2, eventImage.getEventId());
//            check = pr.executeUpdate() > 0;
//        } 
        ////////// SQLServer
        try {
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Event_Images (link, Events_id) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, eventImage.getLink());
            pr.setInt(2, eventImage.getEventId());
            check = pr.executeUpdate() > 0;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateEventsImage(EventsImageDTO eventImage) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE SWP391.Event_Images SET `link` = ?, `Events_id` = ? WHERE (`idEvent_Images` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, eventImage.getLink());
            pr.setInt(2, eventImage.getEventId());
            pr.setInt(3, eventImage.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteEventsImage(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM SWP391.Event_Images WHERE (`idEvent_Images` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
   
    
    
    public List<EventsImageDTO> getListEventsImageDesc() {
        List<EventsImageDTO> listEventsImage = new ArrayList<>();
        int id = 0;
        String link = null;
        int eventId = 0;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT * FROM SWP391.Event_Images;";
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                id = rs.getInt("idEvent_Images");
//                link = rs.getString("link");
//                eventId = rs.getInt("Events_id");
//                EventsImageDTO dto = new EventsImageDTO(id, link, eventId);
//                listEventsImage.add(dto);
//            }
//        }
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Event_Images ORDER BY idEvent_Images DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idEvent_Images");
                link = rs.getString("link");
                eventId = rs.getInt("Events_id");
                EventsImageDTO dto = new EventsImageDTO(id, link, eventId);
                listEventsImage.add(dto);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return listEventsImage;
    }
}
