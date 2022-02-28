/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

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

/**
 *
 * @author Admin
 */
public class EventDAO {

//    private Connection con = null;
//    private PreparedStatement ps = null;
//    private ResultSet rs = null;
//
//    public void saveContent(String content) throws Exception {
//        try {
//            con = MyConnection.getConnection();
//            if (con != null) {
//                String sql = "insert into News(id, [content]) values(?, ?)";
//
//                ps = con.prepareStatement(sql);
//                ps.setString(1, "3");
//                ps.setString(2, content);
//               ps.executeUpdate();
//                String a = "";
//            }
//
//        } catch (Exception e) {
//            System.err.print(e);
//        } finally {
//            MyConnection.closeConnection(con, ps, rs);
//        }
//    }
    public boolean createtEvent() {
        boolean check = false;
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBCon");
            Connection con = ds.getConnection();
//            if (events.getEndDate() == null || events.getStartDate() == null) {
//                return check;
//            }
            String sql = "INSERT INTO SWP391.Events (`name`, `status`, `description`, `owner`) VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement pr = con.prepareStatement(sql);
//            int tmp = 0;
//            if (events.isStatus()) {
//                tmp = 1;
//            }
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            Date parsed1 = format.parse(events.getEndDate());
//            java.sql.Date sqlDate1 = new java.sql.Date(parsed1.getTime());
//            Date parsed2 = format.parse(events.getStartDate());
//            java.sql.Date sqlDate2 = new java.sql.Date(parsed1.getTime());
            pr.setString(1, "abc");
//            pr.setDate(2, 2022-01-01 );
//            pr.setDate(3, sqlDate1);
            pr.setInt(2, 0);
            pr.setString(3, "def");
            pr.setString(4, "meow");
            check = pr.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

}
