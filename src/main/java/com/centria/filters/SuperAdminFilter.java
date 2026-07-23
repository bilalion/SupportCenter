/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.centria.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author imac
 */

@WebFilter("/admin/*")
public class SuperAdminFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig)
            throws ServletException {

    }



    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {



        HttpServletRequest req =
                (HttpServletRequest) request;



        HttpServletResponse res =
                (HttpServletResponse) response;




        String path =
                req.getRequestURI();





        /*
         ====================================
         السماح بالصفحات العامة
         ====================================
        */


        if(path.endsWith("superlogin.jsp")
                || path.contains("SuperLoginServlet")
                || path.contains("LanguageServlet")
                || path.contains("/assets/")
                || path.contains(".css")
                || path.contains(".js")
                || path.contains(".png")
                || path.contains(".jpg")) {



            chain.doFilter(request, response);

            return;

        }






        /*
         ====================================
         فحص جلسة Super Admin
         ====================================
        */


        HttpSession session =
                req.getSession(false);




        boolean isSuperAdmin =
                session != null
                &&
                Boolean.TRUE.equals(
                    session.getAttribute("isSuperAdmin")
                );







        if(isSuperAdmin) {


            /*
             المستخدم لديه صلاحية
            */

            chain.doFilter(request, response);



        } else {



            /*
             لا توجد جلسة
            */


            res.sendRedirect(
                    req.getContextPath()
                    + "/admin/superlogin.jsp"
            );


        }



    }





    @Override
    public void destroy() {


    }



}