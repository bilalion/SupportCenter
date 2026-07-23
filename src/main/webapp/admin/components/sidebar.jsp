<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.centria.utils.LanguageManager"%>

<div class="sidebar">



    <div class="brand-section">


        <img
        src="<%=request.getContextPath()%>/assets/images/centria-logo.png"
        alt="Centria Logo"
        class="logo">



        <h2 class="brand-name">

            Centria

        </h2>



        <span class="brand-subtitle">

            <%= LanguageManager.get("dashboard.subtitle", session) %>

        </span>



    </div>





    <hr>






    <p class="welcome-text">


        <%= LanguageManager.get("dashboard.welcome", session) %>


    </p>







    <div class="menu-section">





        <!-- ==========================
             HOME
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('accueil.jsp')">


            🏠

            <%= LanguageManager.get("dashboard.home", session) %>


        </a>








        <!-- ==========================
             CENTRES MANAGEMENT
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('CentreServlet?action=list')">


            🏢

            <%= LanguageManager.get("dashboard.centers", session) %>


        </a>








        <!-- ==========================
             PAYMENTS MONITORING
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('payments.jsp')">


            💰

            <%= LanguageManager.get("dashboard.payments", session) %>


        </a>








        <!-- ==========================
             ARCHIVE
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('archive.jsp')">


            🗄️

            <%= LanguageManager.get("dashboard.archive", session) %>


        </a>








        <!-- ==========================
             SETTINGS
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('settings.jsp')">


            ⚙️

            <%= LanguageManager.get("dashboard.settings", session) %>


        </a>





    </div>








    <!-- ==========================
         LOGOUT
         ========================== -->


    <a href="<%=request.getContextPath()%>/LogoutServlet"
       class="logout-btn">



        🚪

        <%= LanguageManager.get("dashboard.logout", session) %>



    </a>






</div>