/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.EventDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import utils.MyConnection;

/**
 *
 * @author Admin
 */
public class EventsDAO {

    private Connection con = null;

    public List<EventDTO> getListEvent() {
        List<EventDTO> listEvent = new ArrayList<>();
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT * FROM SWP391.Events;";
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                id = rs.getInt("id");
//                name = rs.getString("name");
//                if (rs.getInt("status") == 0) {
//                    status = false;
//                } else {
//                    status = true;
//                }
//                startDate = rs.getString("startDate");
//                endDate = rs.getString("endDate");
//                description = rs.getString("description");
//                owner = rs.getString("owner");
//                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner);
//                listEvent.add(dto);
//            }
//        } 
        /////////// SQLServer
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events;";
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
                startDate = rs.getString("startDate");
                endDate = rs.getString("endDate");
                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");
//                createDate = rs.getString("createDate");

                Timestamp createDate1 = new Timestamp(rs.getDate("createDate").getTime());
                Calendar cal = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal.setTimeInMillis(createDate1.getTime());
                cal.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                createDate1 = new Timestamp(cal.getTime().getTime());
                // chuyển TimeStamp thành String
//                createDate = createDate1.toString();   // format: 2022-01-01 00:00:00.0   
                SimpleDateFormat formatCreateDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                createDate = formatCreateDate.format(createDate1.getTime());

                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }

    public boolean createtEvent(EventDTO events) {
        boolean check = false;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            if (events.getEndDate() == null || events.getStartDate() == null) {
//                return check;
//            }
//            String sql = "INSERT INTO SWP391.Events (`name`, `startDate`, `endDate`, `status`, `description`, `owner`) VALUES (?, ?, ?, ?, ?, ?);";
//            PreparedStatement pr = con.prepareStatement(sql);
//            int tmp = 0;
//            if (events.isStatus()) {
//                tmp = 1;
//            }
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
//            Date parsed1 = format.parse(events.getEndDate());
////            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
//            java.sql.Timestamp sqlDate1 = new java.sql.Timestamp(parsed1.getTime());
//            Date parsed2 = format.parse(events.getStartDate());
////            java.sql.Date sqlDate2 = new java.sql.Date(parsed2.getTime());
//            java.sql.Timestamp sqlDate2 = new java.sql.Timestamp(parsed2.getTime());
//            pr.setString(1, events.getName());
//            pr.setTimestamp(2, sqlDate2);
//            pr.setTimestamp(3, sqlDate1);
//            pr.setInt(4, tmp);
//            pr.setString(5, events.getDescription());
//            pr.setString(6, events.getOwner());
//            check = pr.executeUpdate() > 0;
//        } 

        ////////// SQLServer
        try {
            con = MyConnection.getConnection();
            if (events.getEndDate() == null || events.getStartDate() == null) {
                return check;
            }
            String sql = "INSERT INTO SWP391.Events (name, startDate, endDate, status, description, owner, type, createDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int tmp = 0;
            if (events.isStatus()) {
                tmp = 1;
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            SimpleDateFormat formatCreateDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parsed1 = format.parse(events.getEndDate());
//            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
            java.sql.Timestamp sqlDate1 = new java.sql.Timestamp(parsed1.getTime());
            Date parsed2 = format.parse(events.getStartDate());
//            java.sql.Date sqlDate2 = new java.sql.Date(parsed2.getTime());
            java.sql.Timestamp sqlDate2 = new java.sql.Timestamp(parsed2.getTime());
            Date parsed3 = formatCreateDate.parse(events.getCreateDate());
            java.sql.Date sqlDate3 = new java.sql.Date(parsed3.getTime());

            pr.setString(1, events.getName());
            pr.setTimestamp(2, sqlDate2);
            pr.setTimestamp(3, sqlDate1);
            pr.setInt(4, tmp);
            pr.setString(5, events.getDescription());
            pr.setString(6, events.getOwner());
            pr.setString(7, events.getType());
            pr.setDate(8, sqlDate3);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateEvent(EventDTO events) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            if (events.getEndDate() == null || events.getStartDate() == null) {
                return check;
            }
//            String sql = "UPDATE SWP391.Events SET `name` = ?, `startDate` = ?, `endDate` = ?, `status` = ?, `description` = ?, `owner` = ? WHERE (`id` = ?);";
            String sql = "UPDATE SWP391.Events SET name = ?, startDate = ?, endDate = ?, status = ?, description = ?, type = ? WHERE (id = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int tmp = 0;
            if (events.isStatus()) {
                tmp = 1;
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed1 = format.parse(events.getEndDate());
            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
            Date parsed2 = format.parse(events.getStartDate());
            java.sql.Date sqlDate2 = new java.sql.Date(parsed1.getTime());
            pr.setString(1, events.getName());
            pr.setDate(2, sqlDate2);
            pr.setDate(3, sqlDate1);
            pr.setInt(4, tmp);
            pr.setString(5, events.getDescription());
            pr.setString(6, events.getOwner());
            pr.setInt(7, events.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean unableEvent(int id) {
        boolean check = false;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            
//            String sql = "UPDATE SWP391.Events SET `status` = ? WHERE (`id` = ?);";
//            PreparedStatement pr = con.prepareStatement(sql);
//            
//            pr.setInt(1, 0);
//            pr.setInt(2, id);
//            check = pr.executeUpdate() > 0;
//        } 
        /////////SQLServer
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Events SET status = ? WHERE (id = ?);";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setInt(1, 0);
            pr.setInt(2, id);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteEvent(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM SWP391.Events WHERE (`id` = ?);";
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
    public List<EventDTO> getList3NewEvent() {
        List<EventDTO> listEvent = new ArrayList<>();
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
//            String sql = "SELECT * FROM SWP391.Events ORDER BY createDate DESC LIMIT 3;"; // thêm WHERE status = 1
            String sql = "SELECT Top 3* FROM SWP391.Events WHERE status = 1 ORDER BY id DESC";  // SQLServer
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
                startDate = rs.getString("startDate");
                endDate = rs.getString("endDate");
                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");
                createDate = rs.getString("createDate");
                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }

    public List<EventDTO> getList4NewEvent(String typeStr) {
        List<EventDTO> listEvent = new ArrayList<>();
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;

        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
//            String sql = "SELECT * FROM SWP391.Events WHERE status = 1 AND type ='" + typeStr + "' ORDER BY id DESC LIMIT 4;";
            String sql = "SELECT Top 4 * FROM SWP391.Events WHERE status = 1 AND type ='" + typeStr + "' ORDER BY id DESC"; //SQLServer ordeyBy ID
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

                String startDateTmp = rs.getString("startDate");
                Date dTmp1 = format.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(dTmp1.getTime());
//                Timestamp startDateTmp = new Timestamp(rs.getDate("startDate").getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime()); 
                startDate = format.format(stamp1.getTime()); // convert to string

                String endDateTmp = rs.getString("endDate");
                Date dTmp2 = format.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(dTmp2.getTime());
//                Timestamp endDateTmp = new Timestamp(rs.getDate("endDate").getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime()); 
                endDate = format.format(stamp2.getTime()); // convert to string

                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");

                String createDateTmp = rs.getString("createDate");
                Date dTmp3 = format.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(dTmp3.getTime());
//                Timestamp createDate3 = new Timestamp(rs.getDate("createDate").getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = format.format(stamp3.getTime());

                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }

    // Event Online Page
    public List<EventDTO> getListEventUser(String typeStr) {
        List<EventDTO> listEvent = new ArrayList<>();
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;
//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT * FROM SWP391.Events;";
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                id = rs.getInt("id");
//                name = rs.getString("name");
//                if (rs.getInt("status") == 0) {
//                    status = false;
//                } else {
//                    status = true;
//                }
//                startDate = rs.getString("startDate");
//                endDate = rs.getString("endDate");
//                description = rs.getString("description");
//                owner = rs.getString("owner");
//                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner);
//                listEvent.add(dto);
//            }
//        } 
        /////////// SQLServer
        try {
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Events WHERE status = 1 AND type = '" + typeStr + "'ORDER BY id DESC;";
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
                // Thêm 2 ngày StartDate
                String startDateTmp = rs.getString("startDate");
                Date dTmp1 = format.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(dTmp1.getTime());
//                Timestamp startDateTmp = new Timestamp(rs.getDate("startDate").getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = format.format(stamp1.getTime()); // convert to string

                // Thêm 2 ngày EndDate
                String endDateTmp = rs.getString("endDate");
                Date dTmp2 = format.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(dTmp2.getTime());
//                Timestamp endDateTmp = new Timestamp(rs.getDate("endDate").getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = format.format(stamp2.getTime()); // convert to string

                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");

                // Thêm 2 ngày CreateDate
                String createDateTmp = rs.getString("createDate");
                Date dTmp3 = format.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(dTmp3.getTime());
//                Timestamp createDate3 = new Timestamp(rs.getDate("createDate").getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = format.format(stamp3.getTime());

                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }

// Load update event
    public List<EventDTO> getListEventType() {
        List<EventDTO> listEvent = new ArrayList<>();

        String type;

//        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
//            String sql = "SELECT * FROM SWP391.Events;";
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                id = rs.getInt("id");
//                name = rs.getString("name");
//                if (rs.getInt("status") == 0) {
//                    status = false;
//                } else {
//                    status = true;
//                }
//                startDate = rs.getString("startDate");
//                endDate = rs.getString("endDate");
//                description = rs.getString("description");
//                owner = rs.getString("owner");
//                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner);
//                listEvent.add(dto);
//            }
//        } 
        /////////// SQLServer
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT DISTINCT type FROM SWP391.Events;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                type = rs.getString("type");

                EventDTO dto = new EventDTO(0, "", "", "", false, "", "", type, "");
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }

    // For Admin Dashboard Page
    public EventDTO get1NewEvent() {
        EventDTO dto = null;
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;

        /////////// SQLServer
        try {
            con = MyConnection.getConnection();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String sql = "SELECT TOP 1 * from SWP391.Events WHERE status = 1 Order By id DESC;";
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
                // Thêm 2 ngày StartDate
//                startDate = rs.getString("startDate");
                Timestamp startDateTmp = new Timestamp(rs.getDate("startDate").getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(startDateTmp.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                startDateTmp = new Timestamp(cal1.getTime().getTime());
                startDate = format.format(startDateTmp.getTime()); // convert to string

                // Thêm 2 ngày EndDate
//                endDate = rs.getString("endDate");
                Timestamp endDateTmp = new Timestamp(rs.getDate("endDate").getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(endDateTmp.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                endDateTmp = new Timestamp(cal2.getTime().getTime());
                endDate = format.format(endDateTmp.getTime()); // convert to string

                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");

                // Thêm 2 ngày CreateDate
//                createDate = rs.getString("createDate");
                Timestamp createDate3 = new Timestamp(rs.getDate("createDate").getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(createDate3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                createDate3 = new Timestamp(cal3.getTime().getTime());
                createDate = format.format(createDate3.getTime());
                dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    //Search event by event ID for event details
    public EventDTO getEventByID(String idStr) {
        EventDTO dto = null;
        int id = Integer.parseInt(idStr);//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;

        /////////// SQLServer
        try {
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
            String sql = "SELECT * from SWP391.Events WHERE id = " + id;
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
                // Thêm 2 ngày StartDate
                String startDateTmp = rs.getString("startDate");
                Date dTmp1 = format.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(dTmp1.getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = format.format(stamp1.getTime()); // convert to string

                // Thêm 2 ngày EndDate
                String endDateTmp = rs.getString("endDate");
                Date dTmp2 = format.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(dTmp2.getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = format.format(stamp2.getTime()); // convert to string

                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");

                // Thêm 2 ngày CreateDate
                String createDateTmp = rs.getString("createDate");
                Date dTmp3 = format.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(dTmp3.getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = format.format(stamp3.getTime());

                dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    public List<EventDTO> getList4NewEventNoType() {
        List<EventDTO> listEvent = new ArrayList<>();
        int id = 0;//
        String name;//
        String startDate;
        String endDate;
        boolean status;//
        String description;
        String owner;
        String type;
        String createDate;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();

            con = MyConnection.getConnection();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            String sql = "SELECT * FROM SWP391.Events Where ORDER BY createDate DESC LIMIT 3;";
            String sql = "SELECT Top 4 * FROM SWP391.Events WHERE status = 1 ORDER BY id DESC"; //SQLServer ordeyBy ID
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
                String startDateTmp = rs.getString("startDate");
                Date dTmp1 = format.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(dTmp1.getTime());
                Calendar cal1 = Calendar.getInstance();
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2);
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = format.format(stamp1.getTime());
                
                String endDateTmp = rs.getString("endDate");
                Date dTmp2 = format.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(dTmp2.getTime());
                Calendar cal2 = Calendar.getInstance();
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2);
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = format.format(stamp2.getTime());
                
                
                description = rs.getString("description");
                owner = rs.getString("owner");
                type = rs.getString("type");
                
                String createDateTmp = rs.getString("createDate");
                Date dTmp3 = format.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(dTmp3.getTime());
                Calendar cal3 = Calendar.getInstance();
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_WEEK, 2);
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = format.format(stamp3.getTime());
                
                EventDTO dto = new EventDTO(id, name, startDate, endDate, status, description, owner, type, createDate);
                listEvent.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listEvent;
    }
}
