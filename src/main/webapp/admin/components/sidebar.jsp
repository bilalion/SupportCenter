<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>


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





        <a href="javascript:void(0)"
           onclick="loadContent('accueil.jsp')">


            🏠

            <%= LanguageManager.get("dashboard.home", session) %>


        </a>








        <!-- ==========================
             CENTRES
             تحميل من Servlet
             ========================== -->


        <a href="javascript:void(0)"
           onclick="loadContent('CentreServlet?action=list')">


            🏢

            <%= LanguageManager.get("dashboard.centers", session) %>


        </a>









        <a href="#">


            📅

            <%= LanguageManager.get("dashboard.subscriptions", session) %>


        </a>






        <a href="#">


            👥

            <%= LanguageManager.get("dashboard.users", session) %>


        </a>






        <a href="#">


            💳

            <%= LanguageManager.get("dashboard.payments", session) %>


        </a>






        <a href="#">


            📊

            <%= LanguageManager.get("dashboard.reports", session) %>


        </a>






        <a href="#">


            ⚙️

            <%= LanguageManager.get("dashboard.settings", session) %>


        </a>





    </div>








    <a href="<%=request.getContextPath()%>/LogoutServlet"
       class="logout-btn">



        <%= LanguageManager.get("dashboard.logout", session) %>



    </a>






</div>