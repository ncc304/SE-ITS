/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.NewsImageDTO;
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
public class NewsImageDAO {
    Connection con = null;
    public List<NewsImageDTO> getListNewsImage() {
        List<NewsImageDTO> listNewsImage = new ArrayList<>();
        int id = 0;
        String link = null;
        int newsId = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.News_Images;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idNews_Images");
                link = rs.getString("link");
                newsId = rs.getInt("News_id");
                NewsImageDTO dto = new NewsImageDTO(id, link, newsId);
                listNewsImage.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNewsImage;
    }

    public boolean createtNewsImage(NewsImageDTO newsImage) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`News_Images` (`link`, `News_id`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, newsImage.getLink());
            pr.setInt(2, newsImage.getNewId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateNewsImage(NewsImageDTO newsImage) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`News_Images` SET `link` = ?, `News_id` = ? WHERE (`idNews_Images` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, newsImage.getLink());
            pr.setInt(2, newsImage.getNewId());
            pr.setInt(3, newsImage.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteNewsImage(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`News_Images` WHERE (`idNews_Images` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    public List<NewsImageDTO> getListNewsImageDesc() {
        List<NewsImageDTO> listNewsImage = new ArrayList<>();
        int id = 0;
        String link = null;
        int newsId = 0;
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
            String sql = "SELECT * FROM SWP391.News_Images ORDER BY idNews_Images DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idNews_Images");
                link = rs.getString("link");
                newsId = rs.getInt("News_id");
                NewsImageDTO dto = new NewsImageDTO(id, link, newsId);
                listNewsImage.add(dto);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return listNewsImage;
    }
}
