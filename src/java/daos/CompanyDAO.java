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
import utils.MyConnection;

/**
 * ?
 *
 * @author Admin
 */
public class CompanyDAO {

    Connection con = null;

    public List<CompanyDTO> getListCompanyAdmin() {
        List<CompanyDTO> listCompany = new ArrayList<>();
        int id = 0;
        String name = null;
        String address = null;
        String link = null;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Company";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idCompany");
                name = rs.getString("name");
                address = rs.getString("address");
                link = rs.getString("image");
                if (rs.getInt("status") == 1) {
                    status = true;
                } else if (rs.getInt("status") != 1) {
                    status = false;
                }

                CompanyDTO dto = new CompanyDTO(id, name, address, link, status);
                listCompany.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCompany;
    }

    public List<CompanyDTO> getListCompany() {
        List<CompanyDTO> listCompany = new ArrayList<>();
        int id = 0;
        String name = null;
        String address = null;
        String link = null;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Company WHERE STATUS = 1";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idCompany");
                name = rs.getString("name");
                address = rs.getString("address");
                link = rs.getString("image");
                if (rs.getInt("status") == 1) {
                    status = true;
                } else if (rs.getInt("status") != 1) {
                    status = false;
                }

                CompanyDTO dto = new CompanyDTO(id, name, address, link, status);
                listCompany.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCompany;
    }

    public boolean createCompany(CompanyDTO company) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Company (name, address, image, status) VALUES (?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, company.getName());
            pr.setString(2, company.getAddress());
            pr.setString(3, company.getLink());
            pr.setInt(4, 1);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateCompany(CompanyDTO company) {
        int status = 0;
        if (company.isStatus()) {
            status = 1;
        }
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Company SET name = ?, address = ?, image = ?, status = ? "
                    + " WHERE idCompany = ?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, company.getName());
            pr.setString(2, company.getAddress());
            pr.setString(3, company.getLink());
            pr.setInt(4, status);
            pr.setInt(5, company.getId());
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

    //----------------------- Admin Page ------------------------
    // delete function: update status
    public boolean updateCompanyStatus(int id, int status) {
        boolean check = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Company SET STATUS =  " + status + " WHERE idCompany = " + id;
            PreparedStatement pr = con.prepareStatement(sql);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    // Get Company By ID
    public CompanyDTO getCompanyByID(int idCom) {
        CompanyDTO dto = null;
        int id = 0;
        String name = null;
        String address = null;
        String link = null;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Company WHERE idCompany = " + idCom;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idCompany");
                name = rs.getString("name");
                address = rs.getString("address");
                link = rs.getString("image");
                if (rs.getInt("status") == 1) {
                    status = true;
                } else if (rs.getInt("status") != 1) {
                    status = false;
                }
                dto = new CompanyDTO(id, name, address, link, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

}
