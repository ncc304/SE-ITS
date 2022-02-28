/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RecruitmentRecruitmentCategoryDTO;
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
public class RecruitmentRecruitmentCategoryDAO {
    public List<RecruitmentRecruitmentCategoryDTO> getListRecruitmentRecruitmentCategory() {
        List<RecruitmentRecruitmentCategoryDTO> listRecruitmentRecruitmentCategory = new ArrayList<>();
        int id = 0;
        int recruitmentId = 0;
        int recruitmentCategoryId = 0;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment_has_Recruitment_Category;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                recruitmentId = rs.getInt("Recruitment_id");
                recruitmentCategoryId = rs.getInt("Recruitment_Category_id");               
                RecruitmentRecruitmentCategoryDTO dto = new RecruitmentRecruitmentCategoryDTO(id, recruitmentId, recruitmentCategoryId);
                listRecruitmentRecruitmentCategory.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitmentRecruitmentCategory;
    }

    public boolean createtRecruitmentRecruitmentCategory(RecruitmentRecruitmentCategoryDTO recruitmentRecruitmentCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`Recruitment_has_Recruitment_Category` (`Recruitment_id`, `Recruitment_Category_id`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, recruitmentRecruitmentCategory.getRecruitmentId());
            pr.setInt(2, recruitmentRecruitmentCategory.getRecruitmentCategoryId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateRecruitmentRecruitmentCategory(RecruitmentRecruitmentCategoryDTO recruitmentRecruitmentCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`Recruitment_has_Recruitment_Category` SET `Recruitment_id` = ?, `Recruitment_Category_id` = ? WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, recruitmentRecruitmentCategory.getRecruitmentId());
            pr.setInt(2, recruitmentRecruitmentCategory.getRecruitmentCategoryId());
            pr.setInt(3, recruitmentRecruitmentCategory.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteRecruitmentRecruitmentCategory(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Recruitment_has_Recruitment_Category` WHERE (`id` = ?);";
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
