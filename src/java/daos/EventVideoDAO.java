/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventVideoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class EventVideoDAO {
    public List<EventVideoDTO> getListEventVideo() {
        List<EventVideoDTO> listEventVideo = new ArrayList<>();
        int id = 0;
        String link = null;
        int eventId = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Event_Videos;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idEvent_Videos");
                link = rs.getString("link");
                eventId = rs.getInt("Events_id");
                EventVideoDTO dto = new EventVideoDTO(id, link, eventId);
                listEventVideo.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEventVideo;
    }

    public boolean createtEventVideo(EventVideoDTO eventVideo) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO SWP391.Event_Videos (`link`, `Events_id`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, eventVideo.getLink());
            pr.setInt(2, eventVideo.getEventsId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateEventVideo(EventVideoDTO eventVideo) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE SWP391.Event_Videos SET `link` = ?, `Events_id` = ? WHERE (`idEvent_Videos` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, eventVideo.getLink());
            pr.setInt(2, eventVideo.getEventsId());
            pr.setInt(3, eventVideo.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteEventVideo(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM SWP391.Event_Videos WHERE (`idEvent_Videos` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
}
