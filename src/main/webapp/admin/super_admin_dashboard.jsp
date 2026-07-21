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

</head>

<body>

<!-- SIDEBAR -->

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

    <a href="#">
        🏢 <%= LanguageManager.get("dashboard.centers", session) %>
    </a>

    <a href="#">
        📅 <%= LanguageManager.get("dashboard.subscriptions", session) %>
    </a>

    <a href="#">
        👥 <%= LanguageManager.get("dashboard.users", session) %>
    </a>

    <a href="#">
        💳 <%= LanguageManager.get("dashboard.payments", session) %>
    </a>

    <a href="#">
        📊 <%= LanguageManager.get("dashboard.reports", session) %>
    </a>

    <a href="#">
        ⚙️ <%= LanguageManager.get("dashboard.settings", session) %>
    </a>

</div>

    <a href="<%=request.getContextPath()%>/LogoutServlet"
       class="logout-btn">

        <%= LanguageManager.get("dashboard.logout", session) %>

    </a>

</div>

<!-- MAIN CONTENT -->

<div class="main-content">

    <div class="language-buttons">

        <a href="<%=request.getContextPath()%>/LanguageServlet?lang=ar">
            🇲🇦 العربية
        </a>

        <a href="<%=request.getContextPath()%>/LanguageServlet?lang=fr">
            🇫🇷 Français
        </a>

    </div>

    <div class="dashboard-header">

        <h1>
            <%= LanguageManager.get("dashboard.main.title", session) %>
        </h1>

        <p>
            <%= LanguageManager.get("dashboard.card.text", session) %>
        </p>

    </div>

    <div class="stats-container">

        <div class="card">
            <h3>
                <%= LanguageManager.get("dashboard.total.centers", session) %>
            </h3>
            <p>0</p>
        </div>

        <div class="card">
            <h3>
                <%= LanguageManager.get("dashboard.active.centers", session) %>
            </h3>
            <p>0</p>
        </div>

        <div class="card">
            <h3>
                <%= LanguageManager.get("dashboard.total.subscriptions", session) %>
            </h3>
            <p>0</p>
        </div>

        <div class="card">
            <h3>
                <%= LanguageManager.get("dashboard.total.revenue", session) %>
            </h3>
            <p>0 MAD</p>
        </div>

    </div>

    <div class="card">

        <h3>
            <%= LanguageManager.get("dashboard.card.title", session) %>
        </h3>

        <p>
            <%= LanguageManager.get("dashboard.card.text", session) %>
        </p>

    </div>

</div>

</body>

</html>