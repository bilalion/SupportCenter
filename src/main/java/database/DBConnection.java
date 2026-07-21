/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;


import config.DatabaseConfig;

import java.sql.Connection;
import java.sql.DriverManager;



public class DBConnection {



    public static Connection getConnection()
            throws Exception {



        System.out.println("======================");
        System.out.println("START DATABASE TEST");


        System.out.println(
            "URL : " + DatabaseConfig.getUrl()
        );


        System.out.println(
            "USER : " + DatabaseConfig.getUsername()
        );



        Class.forName(
            DatabaseConfig.getDriver()
        );



        Connection con =
        DriverManager.getConnection(

            DatabaseConfig.getUrl(),

            DatabaseConfig.getUsername(),

            DatabaseConfig.getPassword()

        );



        System.out.println(
            "DATABASE CONNECTED SUCCESS"
        );


        System.out.println("======================");


        return con;


    }


}