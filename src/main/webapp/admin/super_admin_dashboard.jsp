<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>

<%

Boolean isSuperAdmin =
        (Boolean) session.getAttribute("isSuperAdmin");

if (isSuperAdmin == null || !isSuperAdmin) {

    response.sendRedirect(
        request.getContextPath() + "/admin/superlogin.jsp"
    );

    return;
}

String lang =
        session.getAttribute("lang") != null
        ? session.getAttribute("lang").toString()
        : "ar";

String direction =
        lang.equals("fr")
        ? "ltr"
        : "rtl";

%>

<!DOCTYPE html>

<html lang="<%=lang%>" dir="<%=direction%>">

<head>

<meta charset="UTF-8">

<title>
    <%= LanguageManager.get("dashboard.title", session) %>
</title>


<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/super_admin_dashboard.css?v=999">


<script>

    window.contextPath = "<%=request.getContextPath()%>";

</script>


<script src="<%=request.getContextPath()%>/assets/js/super_admin_dashboard.js"></script>


</head>


<body>


<!-- ==========================
     SIDEBAR
     ========================== -->


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

        
<!-- Accueil -->

<a href="javascript:void(0)"
   onclick="loadContent('accueil.jsp')">

    🏠 
    <%= LanguageManager.get("dashboard.home", session) %>

</a>

        <!-- Gestion des centres -->

        <a href="javascript:void(0)"
           onclick="loadContent('centres.jsp')">

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





<!-- ==========================
     MAIN CONTENT
     ========================== -->


<div class="main-content">


    <!-- LANGUAGE -->

    <div class="language-buttons">


        <a href="<%=request.getContextPath()%>/LanguageServlet?lang=ar">

            🇲🇦 العربية

        </a>



        <a href="<%=request.getContextPath()%>/LanguageServlet?lang=fr">

            🇫🇷 Français

        </a>


    </div>




    <!-- DYNAMIC CONTENT AREA -->


    <div id="content-area">


        <jsp:include page="pages/accueil.jsp"/>


    </div>



</div>




</body>

</html>