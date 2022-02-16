/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class MyConnection {

    public static Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;instance=SE-ITS",
//                        "sa",
//                        "123456");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=SE-ITS;user=sa;password=123456");
        return con;
    }

    public static void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public static void main(String[] args) throws Exception {
        System.out.println(getConnection().toString());
    }
}
