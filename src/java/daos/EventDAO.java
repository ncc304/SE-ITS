/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.MyConnection;

/**
 *
 * @author Admin
 */
public class EventDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public void saveContent(String content) throws Exception {
        try {
            con = MyConnection.getConnection();
            if (con != null) {
                String sql = "insert into News(id, [content]) values(?, ?)";

                ps = con.prepareStatement(sql);
                ps.setString(1, "1");
                ps.setString(2, content);
               ps.executeUpdate();
                String a = "";
            }

        } catch (Exception e) {
            System.err.print(e);
        } finally {
            MyConnection.closeConnection(con, ps, rs);
        }
    }
}
