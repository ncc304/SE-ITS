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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class MyConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost\\SQLEXPRESS/Databases/SWP391;user=sa;password=123456");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=SWP391;user=sa;password=123456");
            if (con != null) {
                return con;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
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
