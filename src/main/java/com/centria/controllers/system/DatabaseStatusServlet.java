/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.centria.controllers.system;


import com.centria.utils.DBConnection;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DatabaseStatusServlet")
public class DatabaseStatusServlet extends HttpServlet {


@Override
protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {


response.setContentType(
        "application/json;charset=UTF-8"
);



try {


Connection con =
        DBConnection.getConnection();



if(con != null){


response.getWriter()
.print(
"{\"status\":\"connected\"}"
);



con.close();


}

else{


response.getWriter()
.print(
"{\"status\":\"failed\",\"message\":\"connection null\"}"
);


}


}
catch(Exception e){


e.printStackTrace();


response.getWriter()
.print(
"{\"status\":\"error\",\"message\":\""
+ e.toString().replace("\"","'")
+ "\"}"
);


}



}


}