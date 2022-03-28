/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.MajorDTO;
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
public class MajorDAO {

    Connection con = null;

    public List<MajorDTO> getListMajor() {
        List<MajorDTO> listMajor = new ArrayList<>();
        int id = 0;
        String name = null;
        String overview = null;
        String skill = null;
        String experience = null;
        String job_opportunity = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Major;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idMajor");
                name = rs.getString("name");
                overview = rs.getString("overview");
                skill = rs.getString("Skill");
                experience = rs.getString("experience");
                job_opportunity = rs.getString("job_opportunity");
                MajorDTO dto = new MajorDTO(id, name, overview, skill, experience, job_opportunity);
                listMajor.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listMajor;
    }

    public boolean createtMajor(MajorDTO major) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO `SWP391`.`Major` (`name`, `overview`, `Skill`, `experience`, `job_opportunity`) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, major.getName());
            pr.setString(2, major.getOverview());
            pr.setString(3, major.getSkill());
            pr.setString(4, major.getExperience());
            pr.setString(5, major.getJob_opportunity());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateMajor(MajorDTO major) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Major SET name = ?, overview = ?, Skill = ?, experience = ?, job_opportunity = ? WHERE (idMajor = ?);";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setString(1, major.getName());
            pr.setString(2, major.getOverview());
            pr.setString(3, major.getSkill());
            pr.setString(4, major.getExperience());
            pr.setString(5, major.getJob_opportunity());
            pr.setInt(6, major.getId());
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteMajor(int id) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "DELETE FROM `SWP391`.`Major` WHERE (`idMajor` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    // ---------------------------- Admin Page ----------------------
    // Get Major by ID
    public MajorDTO getMajorByID(int idMajor) {
        MajorDTO dto = null;
        int id = 0;
        String name = null;
        String overview = null;
        String skill = null;
        String experience = null;
        String job_opportunity = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Major WHERE idMajor = "+idMajor;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idMajor");
                name = rs.getString("name");
                overview = rs.getString("overview");
                skill = rs.getString("Skill");
                experience = rs.getString("experience");
                job_opportunity = rs.getString("job_opportunity");
                dto = new MajorDTO(id, name, overview, skill, experience, job_opportunity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
