/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.SubjectDTO;
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
public class SubjectDAO {

    Connection con = null;

    public List<SubjectDTO> getListSubject() {
        List<SubjectDTO> listSubject = new ArrayList<>();
        int id = 0;
        String link = null;
        String name = null;
        int majorId = 0;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Subjects";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idSubjects");
                name = rs.getString("name");
                link = rs.getString("link");
                majorId = rs.getInt("Major_idMajor");
                if(rs.getInt("status") == 1){
                    status = true;
                }else{
                    status = false;
                }
                SubjectDTO dto = new SubjectDTO(id, link, name, majorId, status);
                listSubject.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSubject;
    }

    public boolean createtSubject(SubjectDTO subject) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "INSERT INTO SWP391.Subjects (link, name, Major_idMajor, status) VALUES (?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, subject.getLink());
            pr.setString(2, subject.getName());
            pr.setInt(3, subject.getMajorId());
            pr.setInt(4, 1);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean updateSubject(SubjectDTO subject) {
        int status = 0;
        if(subject.isStatus()){
            status = 1;
        }
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Subjects SET link = ?, name = ?, Major_idMajor = ?, status = ? WHERE (idSubjects = ?);";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setString(1, subject.getLink());
            pr.setString(2, subject.getName());
            pr.setInt(3, subject.getMajorId());
            pr.setInt(4, status);
            pr.setInt(5, subject.getId());
            check = pr.executeUpdate() > 0;
            return check;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean deleteSubject(int id) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "DELETE FROM `SWP391`.`Subjects` WHERE (`idSubjects` = ?);";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            check = pr.executeUpdate() > 0;
            return check;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    // ----------------------- Admin Page ------------------------
    // get Subject By ID
    public SubjectDTO getSubjectByID(int idSub) {
        SubjectDTO dto = null;
        int id = 0;
        String link = null;
        String name = null;
        int majorId = 0;
        boolean status = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "SELECT * FROM SWP391.Subjects WHERE idSubjects = "+idSub;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                id = rs.getInt("idSubjects");
                name = rs.getString("name");
                link = rs.getString("link");
                majorId = rs.getInt("Major_idMajor");
                if(rs.getInt("status") == 1){
                    status = true;
                }
                dto = new SubjectDTO(id, link, name, majorId, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    // delete function: update status
    public boolean updateSubjectStatus(int id, int status) {
        boolean check = false;
        try {
//            Context ctx = new InitialContext();
//            Context envCtx = (Context) ctx.lookup("java:comp/env");
//            DataSource ds = (DataSource) envCtx.lookup("DBCon");
//            Connection con = ds.getConnection();
            con = MyConnection.getConnection();
            String sql = "UPDATE SWP391.Subjects SET STATUS = "+status+" WHERE idSubjects = "+id;
            PreparedStatement pr = con.prepareStatement(sql);
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
}
