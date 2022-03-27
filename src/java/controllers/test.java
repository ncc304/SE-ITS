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
        String d = "2022-03-25 17:24:40";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date util = format.parse(d);
        
        System.out.println(util);
    }

}
