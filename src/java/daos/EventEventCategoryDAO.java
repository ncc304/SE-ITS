/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventEventCategoryDTO;
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
public class EventEventCategoryDAO {
    public List<EventEventCategoryDTO> getListEventEventCategory() {
        List<EventEventCategoryDTO> listEventEventCategory = new ArrayList<>();
        int id = 0;
        int eventId = 0;
        int eventCategoryId = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Event_Category_has_Events;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                eventId = rs.getInt("Events_id");
                eventCategoryId = rs.getInt("Event_Category_id");               
                EventEventCategoryDTO dto = new EventEventCategoryDTO(id, eventId, eventCategoryId);
                listEventEventCategory.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEventEventCategory;
    }

    public boolean createtEventEventCategory(EventEventCategoryDTO eventEventCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`Event_Category_has_Events` (`Event_Category_id`, `Events_id`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, eventEventCategory.getEventCategoryId());
            pr.setInt(2, eventEventCategory.getEventId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateEventEventCategory(EventEventCategoryDTO eventEventCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`Event_Category_has_Events` SET `Event_Category_id` = ?, `Events_id` = ? WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, eventEventCategory.getEventCategoryId());
            pr.setInt(2, eventEventCategory.getEventId());
            pr.setInt(3, eventEventCategory.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteEventEventCategory(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Event_Category_has_Events` WHERE (`id` = ?);";
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
