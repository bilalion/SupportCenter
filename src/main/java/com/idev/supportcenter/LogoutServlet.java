/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.idev.supportcenter;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LogoutServlet")

public class LogoutServlet extends HttpServlet {



@Override
protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)

throws ServletException, IOException {



    // الحصول على الجلسة الحالية
    HttpSession session = request.getSession(false);



    // إنهاء الجلسة
    if(session != null){

        session.invalidate();

    }



    // العودة إلى صفحة دخول المطور
    response.sendRedirect(
        request.getContextPath()
        + "/admin/superlogin.jsp"
    );


}



}