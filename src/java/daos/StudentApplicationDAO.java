/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.StudentApplicationDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.MyConnection;

/**
 *
 * @author Admin
 */
public class StudentApplicationDAO {

    Connection con = null;

    public List<StudentApplicationDTO> getListStudentApplication() {
        List<StudentApplicationDTO> listStudentApplication = new ArrayList<>();
        int id = 0;
        String name = null;
        String phone = null;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Student_Application;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                phone = rs.getString("phone");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                StudentApplicationDTO dto = new StudentApplicationDTO(id, name, phone, status);
                listStudentApplication.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listStudentApplication;
    }

    public int count(String phone) {
        int result = 0;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT COUNT(*) AS count FROM SWP391.Student_Application where phone = ?;";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, phone);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean createtStudentApplication(StudentApplicationDTO studentApplication) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Student_Application (name, phone, status) VALUES (?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            int count = count(studentApplication.getPhone());
            int tmp = 0;
            if (studentApplication.isStatus()) {
                tmp = 1;
            }

            pr.setString(1, studentApplication.getName());
            pr.setString(2, studentApplication.getPhone());
            pr.setInt(3, tmp);
            if (count < 6) {
                check = pr.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateStudentApplication(StudentApplicationDTO studentApplication) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE `SWP391`.`Student_Application` SET `name` = ?, `phone` = ?, `status` = ? WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);

            int tmp = 0;
            if (studentApplication.isStatus()) {
                tmp = 1;
            }
            pr.setString(1, studentApplication.getName());
            pr.setString(2, studentApplication.getPhone());
            pr.setInt(3, tmp);
            pr.setInt(4, studentApplication.getId());
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteStudentApplication(int id) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "DELETE FROM `SWP391`.`Student_Application` WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    // --------------------- Admin -------------------------------
    // update status
    public boolean updateStatusStudentApplication(int id, int status) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Student_Application SET status = ? WHERE (id = ?);";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setInt(1, status);
            pr.setInt(2, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    // get data by id
    public StudentApplicationDTO getStudentApplicationByID(int idUser) {
        List<StudentApplicationDTO> listStudentApplication = new ArrayList<>();
        StudentApplicationDTO dto = null;
        int id = 0;
        String name = null;
        String phone = null;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Student_Application WHERE id = "+idUser;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                phone = rs.getString("phone");
                if (rs.getInt("status") == 0) {
                    status = false;
                } else {
                    status = true;
                }
                dto = new StudentApplicationDTO(id, name, phone, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
}
