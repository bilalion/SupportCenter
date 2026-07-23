<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.centria.utils.LanguageManager"%>


<div class="header">



    <!-- ==========================
         عنوان لوحة التحكم
         ========================== -->

    <div class="header-title">


        <h2>

            <%= LanguageManager.get("dashboard.title", session) %>

        </h2>


    </div>







    <!-- ==========================
         الإجراءات
         اللغة + المستخدم
         ========================== -->


    <div class="header-actions">






        <!-- ==========================
             تغيير اللغة
             ========================== -->


        <div class="language-buttons">


            <a href="<%=request.getContextPath()%>/LanguageServlet?lang=ar">

                🇲🇦 العربية

            </a>



            <a href="<%=request.getContextPath()%>/LanguageServlet?lang=fr">

                🇫🇷 Français

            </a>



        </div>








        <!-- ==========================
             معلومات المستخدم
             ========================== -->


        <div class="header-user">


            <span class="user-icon">

                👨‍💻

            </span>



            <span class="user-name">

                CHENTOUF BILAL

            </span>



        </div>






    </div>





</div>