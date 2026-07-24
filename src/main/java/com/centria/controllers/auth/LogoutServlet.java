/*
 * Centria
 * Logout Controller
 * Module : Authentication
 * Author : Chentouf Bilal
 *
 * Description:
 * Terminates Super Admin session
 * and keeps selected language.
 */


package com.centria.controllers.auth;



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
protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {




    /*
     =====================================
     الحصول على الجلسة الحالية
     =====================================
     */


    HttpSession oldSession =
            request.getSession(false);




    String language = "ar";




    /*
     =====================================
     حفظ اللغة قبل إنهاء الجلسة
     =====================================
     */


    if(oldSession != null){



        Object currentLang =
                oldSession.getAttribute("lang");



        if(currentLang != null){


            language =
            currentLang.toString();


        }




        /*
         إنهاء الجلسة
        */


        oldSession.invalidate();



    }







    /*
     =====================================
     إنشاء جلسة جديدة للصفحة الأولى
     =====================================
     */


    HttpSession newSession =
            request.getSession(true);



    newSession.setAttribute(
            "lang",
            language
    );






    /*
     =====================================
     العودة إلى تسجيل الدخول
     =====================================
     */


    response.sendRedirect(

        request.getContextPath()
        + "/admin/superlogin.jsp"

    );




}



}