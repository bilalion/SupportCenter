/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.idev.supportcenter;


import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/SuperLoginServlet")

public class SuperLoginServlet extends HttpServlet {



@Override
protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {



request.setCharacterEncoding("UTF-8");



String username =
        request.getParameter("username");



String password =
        request.getParameter("password");




try {



Connection con =
        DBConnection.getConnection();




String sql =
"SELECT * FROM super_admins WHERE username=? AND password=?";



PreparedStatement ps =
        con.prepareStatement(sql);



ps.setString(1, username);

ps.setString(2, password);



ResultSet rs =
        ps.executeQuery();




if(rs.next()){



HttpSession session =
        request.getSession();



session.setAttribute(
        "isSuperAdmin",
        true
);



session.setAttribute(
        "adminUsername",
        username
);




response.sendRedirect(
        request.getContextPath()
        + "/admin/super_admin_dashboard.jsp"
);



}

else{


// كلمة المرور أو المستخدم خاطئ

response.sendRedirect(
        request.getContextPath()
        + "/admin/superlogin.jsp?error=invalid"
);



}




rs.close();

ps.close();

con.close();



}

catch(Exception e){



e.printStackTrace();



response.sendRedirect(
        request.getContextPath()
        + "/admin/superlogin.jsp?error=db_error"
);



}



}


}