/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CompanyDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**?
 *
 * @author Admin
 */
public class CompanyDAO {

    public List<CompanyDTO> getListCompany() {
        List<CompanyDTO> listCompany = new ArrayList<>();
        int id = 0;
        String name = null;
        String address = null;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "SELECT * FROM SWP391.Company;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idCompany");
                name = rs.getString("name");
                address = rs.getString("address");
                CompanyDTO dto = new CompanyDTO(id, name, address);
                listCompany.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCompany;
    }

    public boolean createtCompany(CompanyDTO company) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "INSERT INTO SWP391.Company (`name`, `address`) VALUES (?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, company.getName());
            pr.setString(2, company.getAddress());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateCompany(CompanyDTO company) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "UPDATE SWP391.Company SET `name` = ?, `address` = ? WHERE (`idCompany` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, company.getName());
            pr.setString(2, company.getAddress());
            pr.setInt(3, company.getId());
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteCompany(int id) {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
            String sql = "DELETE FROM SWP391.Company WHERE (`idCompany` = ?);";
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
