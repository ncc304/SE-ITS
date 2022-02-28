/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.NewsVideoDTO;
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
public class NewsVideoDAO {
    public List<NewsVideoDTO> getListNewsVideo() {
        List<NewsVideoDTO> listNewsVideo = new ArrayList<>();
        int id = 0;
        String link = null;
        int newsId = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.News_Videos;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idNews_Videos");
                link = rs.getString("link");
                newsId = rs.getInt("News_id");
                NewsVideoDTO dto = new NewsVideoDTO(id, link, newsId);
                listNewsVideo.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNewsVideo;
    }

    public boolean createtNewsVideo(NewsVideoDTO newsVideo) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`News_Videos` (`link`, `News_id`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, newsVideo.getLink());
            pr.setInt(2, newsVideo.getNewId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateNewsVideo(NewsVideoDTO newsVideo) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`News_Videos` SET `link` = ?, `News_id` = ? WHERE (`idNews_Videos` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, newsVideo.getLink());
            pr.setInt(2, newsVideo.getNewId());
            pr.setInt(3, newsVideo.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteNewsVideo(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`News_Videos` WHERE (`idNews_Videos` = ?);";
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
