/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.NewsNewsTagDTO;
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
public class NewsNewsTagDAO {

    Connection con = null;

    public List<NewsNewsTagDTO> getListNewsNewsTag() {
        List<NewsNewsTagDTO> listNewsNewsTag = new ArrayList<>();
        int id = 0;
        int newTagId = 0;
        int newId = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.News_Tags_has_News;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                newTagId = rs.getInt("News_Tags_idNews_Tags");
                newId = rs.getInt("News_id");
                NewsNewsTagDTO dto = new NewsNewsTagDTO(id, newTagId, newId);
                listNewsNewsTag.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNewsNewsTag;
    }

    public boolean createtNewsNewsTag(NewsNewsTagDTO newsNewsTag) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.News_Tags_has_News (News_Tags_idNews_Tags, News_id) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, newsNewsTag.getNewTagId());
            pr.setInt(2, newsNewsTag.getNewId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateNewsNewsTag(NewsNewsTagDTO newsNewsTag) {
        boolean check = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.News_Tags_has_News SET News_Tags_idNews_Tags = ?, News_id = ? WHERE (id = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, newsNewsTag.getNewTagId());
            pr.setInt(2, newsNewsTag.getNewId());
            pr.setInt(3, newsNewsTag.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteNewsNewsTag(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`News_Tags_has_News` WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // ----------------- User Page -----------------
    // Lấy Tag theo NewsID để làm Navigation trong NewsDetail.jsp
    public NewsNewsTagDTO getTagByNewsID(int idNews) {
        NewsNewsTagDTO dto = null;
        int id = 0;
        int newTagId = 0;
        int newId = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.News_Tags_has_News WHERE News_id = " + idNews;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                id = rs.getInt("id");
                newTagId = rs.getInt("News_Tags_idNews_Tags");
                newId = rs.getInt("News_id");
                dto = new NewsNewsTagDTO(id, newTagId, newId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
