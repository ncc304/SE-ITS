/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RecruitmentCategoryDTO;
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
public class RecruitmentCategoryDAO {

    Connection con = null;

    public List<RecruitmentCategoryDTO> getListRecruitmentCategory() {
        List<RecruitmentCategoryDTO> listRecruitmentCategory = new ArrayList<>();
        int id = 0;
        String name = null;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Recruitment_Category;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idRecruitment_Category");
                name = rs.getString("name");
                RecruitmentCategoryDTO dto = new RecruitmentCategoryDTO(id, name);
                listRecruitmentCategory.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRecruitmentCategory;
    }

    public boolean createtRecruitmentCategory(RecruitmentCategoryDTO recruitmentCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO `SWP391`.`Recruitment_Category` (`name`) VALUES (?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, recruitmentCategory.getName());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateRecruitmentCategory(RecruitmentCategoryDTO recruitmentCategory) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`Recruitment_Category` SET `name` = ? WHERE (`idRecruitment_Category` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, recruitmentCategory.getName());
            pr.setInt(2, recruitmentCategory.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteRecruitmentCategory(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Recruitment_Category` WHERE (`idRecruitment_Category` = ?);";
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
