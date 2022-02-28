/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RegistantDTO;
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
public class RegistantDAO {

    public List<RegistantDTO> getListRegistant() {
        List<RegistantDTO> listRegistant = new ArrayList<>();
        int id = 0;
        String name = null;
        int phoneNumber = 0;
        String email = null;
        String province = null;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Registant;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                phoneNumber = rs.getInt("phone_number");
                email = rs.getString("email");
                province = rs.getString("province");
                RegistantDTO dto = new RegistantDTO(id, name, phoneNumber, email, province);
                listRegistant.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listRegistant;
    }

    public boolean createtRegistant(RegistantDTO registant) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO SWP391.Registant (`name`, `phone_number`, `email`, `province`) VALUES (? , ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, registant.getName());
            pr.setInt(2, registant.getPhoneNumber());
            pr.setString(3, registant.getEmail());
            pr.setString(4, registant.getProvince());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateRegistant(RegistantDTO registant) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE `SWP391`.`Registant` SET `name` = ?, `phone_number` = ?, `email` = ?, `province` = ? WHERE (`id` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, registant.getName());
            pr.setInt(2, registant.getPhoneNumber());
            pr.setString(3, registant.getEmail());
            pr.setString(4, registant.getProvince());
            pr.setInt(5, registant.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteRegistant(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM `SWP391`.`Registant` WHERE (`id` = ?);";
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
