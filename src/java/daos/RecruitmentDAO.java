/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RecruitmentDTO;
import java.sql.Connection;
import java.sql.Date;
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
public class RecruitmentDAO {

    Connection con = null;

    public List<RecruitmentDTO> getListRecruitment() {
        List<RecruitmentDTO> listRecruitment = new ArrayList<>();
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        String createDate = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd");
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idRecruitment");

                String startDateTmp = rs.getString("startDate");
                java.util.Date d1 = fmt2.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(d1.getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = fmt2.format(stamp1);

                String endDateTmp = rs.getString("endDate");
                java.util.Date d2 = fmt2.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(d2.getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = fmt2.format(stamp2);

                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                name = rs.getString("name");
                owner = rs.getString("owner");
                String createDateTmp = rs.getString("createDate");
                java.util.Date d3 = fmt1.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(d3.getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = fmt1.format(stamp3);
                
                RecruitmentDTO dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner, createDate);
                listRecruitment.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitment;
    }

    public boolean createtRecruitment(RecruitmentDTO recruitment) {
        boolean check = false;
        int status = 0;
        if(recruitment.isStatus()){
            status = 1;
        }
        try {
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Recruitment (startDate, endDate, salary, description, Company_id, status, name, owner, createDate) "
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed1 = format.parse(recruitment.getEndDate());
            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
            java.util.Date parsed2 = format.parse(recruitment.getStartDate());
            java.sql.Date sqlDate2 = new java.sql.Date(parsed2.getTime());

            pr.setDate(1, sqlDate2);
            pr.setDate(2, sqlDate1);
            pr.setFloat(3, recruitment.getSalary());
            pr.setString(4, recruitment.getDescription());
            pr.setInt(5, recruitment.getCompanyId());
            pr.setInt(6, status);
            pr.setString(7, recruitment.getName());
            pr.setString(8, recruitment.getOwner());
            pr.setString(9, recruitment.getCreateDate());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateRecruitment(RecruitmentDTO recruitment) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`Recruitment` SET `startDate` = ?, `endDate` = ?, `salary` = ?, `description` = ?, `Company_id` = ? WHERE (`idRecruitment` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsed1 = format.parse(recruitment.getEndDate());
            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
            java.util.Date parsed2 = format.parse(recruitment.getStartDate());
            java.sql.Date sqlDate2 = new java.sql.Date(parsed1.getTime());
            pr.setDate(1, sqlDate2);
            pr.setDate(2, sqlDate1);
            pr.setFloat(3, recruitment.getSalary());
            pr.setString(4, recruitment.getDescription());
            pr.setInt(5, recruitment.getCompanyId());
            pr.setInt(6, recruitment.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteRecruitment(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Recruitment` WHERE (`idRecruitment` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // -------------------------- User Page ----------------------------
    public List<RecruitmentDTO> get4NewRecruitmentByCateID(String cateID) {
        List<RecruitmentDTO> listRecruitment = new ArrayList<>();
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT Top 4 * FROM SWP391.Recruitment \n"
                    + "where idRecruitment in (SELECT Recruitment_id FROM SWP391.Recruitment_has_Recruitment_Category \n"
                    + "where Recruitment_Category_id = " + cateID + " ) AND status = 1 ORDER BY idRecruitment DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                id = rs.getInt("idRecruitment");
                startDate = rs.getString("startDate");
                endDate = rs.getString("endDate");
                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                name = rs.getString("name");
                owner = rs.getString("owner");
                RecruitmentDTO dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner);
                listRecruitment.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitment;
    }

    // Read More
    public List<RecruitmentDTO> getAllNewRecruitmentByCateID(String cateID) {
        List<RecruitmentDTO> listRecruitment = new ArrayList<>();
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment \n"
                    + "where idRecruitment in (SELECT Recruitment_id FROM SWP391.Recruitment_has_Recruitment_Category \n"
                    + "where Recruitment_Category_id = " + cateID + " ) AND status = 1 ORDER BY idRecruitment DESC;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                id = rs.getInt("idRecruitment");
                startDate = rs.getString("startDate");
                endDate = rs.getString("endDate");
                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                name = rs.getString("name");
                owner = rs.getString("owner");
                RecruitmentDTO dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner);
                listRecruitment.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitment;
    }

    // Get 1 Re by ID
    public RecruitmentDTO getRecruitmentByReID(String reID) {
        RecruitmentDTO dto = null;
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        String createDate = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment WHERE status=1 AND idRecruitment = " + reID;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                id = rs.getInt("idRecruitment");
                String startDateTmp = rs.getString("startDate");
                java.util.Date d1 = fmt1.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(d1.getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = fmt1.format(stamp1);

                String endDateTmp = rs.getString("endDate");
                java.util.Date d2 = fmt1.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(d2.getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = fmt1.format(stamp2);

                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                name = rs.getString("name");
                owner = rs.getString("owner");

                String createDateTmp = rs.getString("createDate");
                java.util.Date d3 = fmt2.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(d3.getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = fmt2.format(stamp3);
                dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner, createDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    // 4 recent recruitment
    public List<RecruitmentDTO> get4NewRecruitmentNoCateID() {
        List<RecruitmentDTO> listRecruitment = new ArrayList<>();
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT Top 4 * FROM SWP391.Recruitment WHERE status = 1 ORDER BY idRecruitment DESC";

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                id = rs.getInt("idRecruitment");
                startDate = rs.getString("startDate");
                endDate = rs.getString("endDate");
                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                name = rs.getString("name");
                owner = rs.getString("owner");
                RecruitmentDTO dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner);
                listRecruitment.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitment;
    }

    //------------------------- Admin Page ---------------------------
    // DashBoard
    public RecruitmentDTO get1NewRecruitment() {
        RecruitmentDTO dto = null;
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        String createDate = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            con = MyConnection.getConnection();
            String sql = "SELECT Top 1 * FROM SWP391.Recruitment WHERE status = 1 ORDER BY idRecruitment DESC";

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                id = rs.getInt("idRecruitment");

                String startDateTmp = rs.getString("startDate");
                java.util.Date d1 = fmt1.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(d1.getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = fmt1.format(stamp1);

                String endDateTmp = rs.getString("endDate");
                java.util.Date d2 = fmt1.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(d2.getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = fmt1.format(stamp2);

                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                name = rs.getString("name");
                owner = rs.getString("owner");

                String createDateTmp = rs.getString("createDate");
                java.util.Date d3 = fmt2.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(d3.getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = fmt2.format(stamp3);
                dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner, createDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    // ----------------------- Admin ------------------------
    // delete function: update status
    public boolean updateRecruitmentStatus(int id, int status) {
        boolean check = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Recruitment SET STATUS = "+status+" WHERE idRecruitment = "+id;
            PreparedStatement pr = con.prepareStatement(sql);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    // Get Re by ID
    public RecruitmentDTO getListRecruitmentByID(int reID) {
        RecruitmentDTO dto = null;
        int id = 0;
        String startDate = null;
        String endDate = null;
        float salary = 0;
        String description = null;
        int companyId = 0;
        boolean status = false;
        String name = null;
        String owner = null;
        String createDate = null;
        try {

            SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd");
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment WHERE idRecruitment = "+reID;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idRecruitment");

                String startDateTmp = rs.getString("startDate");
                java.util.Date d1 = fmt2.parse(startDateTmp);
                Timestamp stamp1 = new Timestamp(d1.getTime());
                Calendar cal1 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal1.setTimeInMillis(stamp1.getTime());
                cal1.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp1 = new Timestamp(cal1.getTime().getTime());
                startDate = fmt2.format(stamp1);

                String endDateTmp = rs.getString("endDate");
                java.util.Date d2 = fmt2.parse(endDateTmp);
                Timestamp stamp2 = new Timestamp(d2.getTime());
                Calendar cal2 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal2.setTimeInMillis(stamp2.getTime());
                cal2.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp2 = new Timestamp(cal2.getTime().getTime());
                endDate = fmt2.format(stamp2);

                salary = rs.getFloat("salary");
                description = rs.getString("description");
                companyId = rs.getInt("Company_id");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                name = rs.getString("name");
                owner = rs.getString("owner");
                String createDateTmp = rs.getString("createDate");
                java.util.Date d3 = fmt1.parse(createDateTmp);
                Timestamp stamp3 = new Timestamp(d3.getTime());
                Calendar cal3 = Calendar.getInstance(); // gọi Calendar để tăng thêm 2 ngày
                cal3.setTimeInMillis(stamp3.getTime());
                cal3.add(Calendar.DAY_OF_MONTH, 2); // tăng 2 ngày
                stamp3 = new Timestamp(cal3.getTime().getTime());
                createDate = fmt1.format(stamp3);
                
                dto = new RecruitmentDTO(id, startDate, endDate, salary, description, companyId, status, name, owner, createDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
