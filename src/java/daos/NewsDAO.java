/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventDTO;
import dtos.NewsDTO;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import utils.MyConnection;

/**
 *
 * @author Admin
 */
public class NewsDAO {

    private Connection con = null;

    public List<NewsDTO> getListNews() {
        List<NewsDTO> listNews = new ArrayList<>();
        int id = 0;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.News;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                createTime = rs.getDate("create_time").toString();
                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                NewsDTO dto = new NewsDTO(id, name, status, createTime, content, author, view);
                listNews.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNews;
    }

    public boolean createtNews(NewsDTO news) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            if (news.getCreateTime() != null) {
                String sql = "INSERT INTO SWP391.News (`name`, `status`, `create_time`  , `content`, `author`, `view`) VALUES (?, ?,?, ?, ?,?);";
                PreparedStatement pr = con.prepareStatement(sql);
                int tmp = 0;
                if (news.isStatus()) {
                    tmp = 1;
                }
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date parsed = format.parse(news.getCreateTime());
                java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
                pr.setString(1, news.getName());
                pr.setInt(2, tmp);
                pr.setDate(3, sqlDate);
                pr.setString(4, news.getContent());
                pr.setString(5, news.getAuthor());
                pr.setInt(6, news.getView());
                check = pr.executeUpdate() > 0;
                return check;
            }
            String sql = "INSERT INTO SWP391.News (`name`, `status` , `content`, `author`, `view`) VALUES (?, ?,?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int tmp = 0;
            if (news.isStatus()) {
                tmp = 1;
            }
            pr.setString(1, news.getName());
            pr.setInt(2, tmp);
            pr.setString(3, news.getContent());
            pr.setString(4, news.getAuthor());
            pr.setInt(5, news.getView());

            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateNews(NewsDTO news) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            if (news.getCreateTime() != null) {
                String sql = "UPDATE SWP391.News SET `name` = ?, `status` = ?,"
                        + " `create_time` = ?, `content` = ?, `author` = ?, `view` = ? WHERE (`id` LIKE ?);";
                PreparedStatement pr = con.prepareStatement(sql);
                int tmp = 0;
                if (news.isStatus()) {
                    tmp = 1;
                }
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date parsed = format.parse(news.getCreateTime());
                java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
                pr.setString(1, news.getName());
                pr.setInt(2, tmp);
                pr.setDate(3, sqlDate);
                pr.setString(4, news.getContent());
                pr.setString(5, news.getAuthor());
                pr.setInt(6, news.getView());
                pr.setInt(7, news.getId());
                check = pr.executeUpdate() > 0;
                return check;
            }
            String sql = "UPDATE SWP391.News SET `name` = ?, `status` = ?,"
                    + "`content` = ?, `author` = ?, `view` = ? WHERE (`id` LIKE ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int tmp = 0;
            if (news.isStatus()) {
                tmp = 1;
            }
            pr.setString(1, news.getName());
            pr.setInt(2, tmp);
            pr.setString(3, news.getContent());
            pr.setString(4, news.getAuthor());
            pr.setInt(5, news.getView());
            pr.setInt(6, news.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteNews(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM SWP391.News WHERE (`id` LIKE ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // ------------------ User Page ---------------------------
    public List<NewsDTO> getList3NewNews() {
        List<NewsDTO> listNews = new ArrayList<>();
        int id = 0;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat formatCreateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
//            String sql = "SELECT * FROM SWP391.Events ORDER BY createDate DESC LIMIT 3;"; // thêm WHERE status = 1
            String sql = "SELECT Top 3* FROM SWP391.News WHERE status = 1 ORDER BY id DESC";  // SQLServer
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
//                createTime = rs.getDate("create_time").toString();
                Timestamp timeTmp = new Timestamp(rs.getDate("create_time").getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(timeTmp.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                timeTmp = new Timestamp(cal1.getTime().getTime());
                createTime = formatCreateTime.format(timeTmp.getTime()); // convert to string

                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                NewsDTO dto = new NewsDTO(id, name, status, createTime, content, author, view);
                listNews.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNews;
    }

    //--------------------- Get List 4 Latest News By 3 Tag_ID (category)
    public List<NewsDTO> getList4NewNewsByTag(String tagID) {
        List<NewsDTO> listNews = new ArrayList<>();
        int id = 0;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat formatCreateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
//            String sql = "SELECT * FROM SWP391.Events ORDER BY createDate DESC LIMIT 3;"; // thêm WHERE status = 1
//            String sql = "SELECT Top 3* FROM SWP391.News WHERE status = 1 ORDER BY id DESC";  // SQLServer
            String sql = "SELECT Top 4 * FROM SWP391.News where  id in (SELECT News_id FROM SWP391.News_Tags_has_News where News_Tags_idNews_Tags = " + tagID + " ) AND status = 1 ORDER BY id DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                // chưa get dc HH:mm:ss
                String creatDate1 = rs.getString("create_time");
                java.util.Date d1 = formatCreateTime.parse(creatDate1);
                Timestamp timeTmp = new Timestamp(d1.getTime());
//                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
//                cal1.setTimeInMillis(timeTmp.getTime());
//                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
//                timeTmp = new Timestamp(cal1.getTime().getTime());
                createTime = formatCreateTime.format(timeTmp.getTime()); // convert to string

                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                NewsDTO dto = new NewsDTO(id, name, status, createTime, content, author, view);
                listNews.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNews;
    }

    // Get All Latest News By 3 Tag_ID (category)
    public List<NewsDTO> getAllNewsByTag(String tagID) {
        List<NewsDTO> listNews = new ArrayList<>();
        int id = 0;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat formatCreateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
//            String sql = "SELECT * FROM SWP391.Events ORDER BY createDate DESC LIMIT 3;"; // thêm WHERE status = 1
//            String sql = "SELECT Top 3* FROM SWP391.News WHERE status = 1 ORDER BY id DESC";  // SQLServer
            String sql = "SELECT * FROM SWP391.News where  id in (SELECT News_id FROM SWP391.News_Tags_has_News where News_Tags_idNews_Tags = " + tagID + " ) AND status = 1 ORDER BY id DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                String createTimeTmp = rs.getString("create_time");
                Date dTmp = formatCreateTime.parse(createTimeTmp);

                Timestamp timeTmp = new Timestamp(dTmp.getTime());
//                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
//                cal1.setTimeInMillis(timeTmp.getTime());
//                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
//                timeTmp = new Timestamp(cal1.getTime().getTime());
                createTime = formatCreateTime.format(timeTmp.getTime()); // convert to string

                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                NewsDTO dto = new NewsDTO(id, name, status, createTime, content, author, view);
                listNews.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNews;
    }

    public NewsDTO getNewsByID(int idNews) { // + Count View
        NewsDTO dto = null;
        int id = idNews;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            // check ID có trong DB không
            String sql1 = "SELECT * FROM SWP391.News WHERE status = 1 AND id = " + id;
            Statement stmt1 = con.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            if(rs1.next()){ // có thì update view + 1
                countView(idNews);
            }
            
            // Sau đó get News mới nhất với View đã dc cập nhật
            SimpleDateFormat formatCreateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String sql = "SELECT * FROM SWP391.News WHERE status = 1 AND id = " + id;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                String createTimeTmp = rs.getString("create_time");
                Date dTmp = formatCreateTime.parse(createTimeTmp);
                Timestamp timeTmp = new Timestamp(dTmp.getTime());
//                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
//                cal1.setTimeInMillis(timeTmp.getTime());
//                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
//                timeTmp = new Timestamp(cal1.getTime().getTime());
                createTime = formatCreateTime.format(timeTmp.getTime()); // convert to string

                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                dto = new NewsDTO(id, name, status, createTime, content, author, view);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    // Lấy 4 Tin tức mới nhất ko cần tho Tag
    public List<NewsDTO> getList4NewNewsNoTag() {
        List<NewsDTO> listNews = new ArrayList<>();
        int id = 0;
        String name = null;
        boolean status = false;
        String createTime = null;
        String content = null;
        String author = null;
        int view = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat formatCreateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
            String sql = "SELECT Top 4 * FROM SWP391.News WHERE status = 1 ORDER BY id DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                String createTimeTmp = rs.getString("create_time");
                Date dTmp = formatCreateTime.parse(createTimeTmp);
                Timestamp timeTmp = new Timestamp(dTmp.getTime());
//                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
//                cal1.setTimeInMillis(timeTmp.getTime());
//                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
//                timeTmp = new Timestamp(cal1.getTime().getTime());
                createTime = formatCreateTime.format(timeTmp.getTime()); // convert to string

                content = rs.getString("content");
                author = rs.getString("author");
                view = rs.getInt("view");
                NewsDTO dto = new NewsDTO(id, name, status, createTime, content, author, view);
                listNews.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNews;
    }

    // Tăng lượt xem
    public boolean countView(int idNews) {
        boolean check = false;
        int view = 0;
        boolean checkView = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();

            String sql_1 = "SELECT [view] FROM [SWP391].[News] WHERE id = " + idNews;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql_1);
            if (rs.next()) {
                view = rs.getInt("view"); // Get View By ID
                checkView = true;
            }
            if (checkView) { // Update View By ID
                view++;
                String sql_2 = "UPDATE [SWP391].[News] SET [view] = " + view + " WHERE id = " + idNews;
                PreparedStatement pr = con.prepareStatement(sql_2);
                check = pr.executeUpdate() > 0;
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
