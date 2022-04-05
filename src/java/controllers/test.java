/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.text.SimpleDateFormat;

/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws Exception{
        String d = "2022-03-25";
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date util = fmt.parse(d);
        SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = fmt2.format(util.getTime());
        
        System.out.println(date);
    }

}
