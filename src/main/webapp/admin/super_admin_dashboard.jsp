<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>


<%

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
href="<%=request.getContextPath()%>/assets/css/super_admin_dashboard.css?v=1008">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/centres.css?v=1">



<script>

window.contextPath =
"<%=request.getContextPath()%>";

</script>




<script src="<%=request.getContextPath()%>/assets/js/super_admin_dashboard.js"></script>




</head>






<body>




<!-- =================================================
     SIDEBAR COMPONENT
     ================================================= -->


<jsp:include page="components/sidebar.jsp"/>







<!-- =================================================
     MAIN CONTENT
     ================================================= -->


<div class="main-content">







<!-- =================================================
     HEADER COMPONENT
     يحتوي:
     - عنوان النظام
     - اللغة
     - المستخدم
     ================================================= -->


<jsp:include page="components/header.jsp"/>








<!-- =================================================
     DYNAMIC CONTENT AREA
     ================================================= -->


<div id="content-area">



    <jsp:include page="pages/accueil.jsp"/>



</div>







</div>







</body>



</html>