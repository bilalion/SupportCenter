/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.centria.controllers;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LanguageServlet")

public class LanguageServlet extends HttpServlet {


@Override

protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {



String lang =
        request.getParameter("lang");



if(lang == null || lang.isEmpty()){

    lang = "ar";

}




HttpSession session =
        request.getSession();



// حفظ اللغة في Session

session.setAttribute(
        "lang",
        lang
);



// العودة إلى الصفحة السابقة

String referer =
        request.getHeader("Referer");



if(referer != null){

    response.sendRedirect(referer);

}

else{


    response.sendRedirect(
        request.getContextPath()
        + "/admin/superlogin.jsp"
    );


}



}


}