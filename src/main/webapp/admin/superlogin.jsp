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


<meta http-equiv="Cache-Control"
      content="no-cache, no-store, must-revalidate">



<title>

<%= LanguageManager.get("login.title", session) %>

</title>




<link rel="stylesheet"
href="<%=request.getContextPath()%>/assets/css/superlogin.css?v=2">



</head>






<body>




<!-- ==========================
     LANGUAGE SWITCHER
     خارج صندوق الدخول
     ========================== -->


<div class="language-switcher">


<a href="<%=request.getContextPath()%>/LanguageServlet?lang=ar">

🇲🇦 العربية

</a>



<a href="<%=request.getContextPath()%>/LanguageServlet?lang=fr">

🇫🇷 Français

</a>



</div>









<!-- ==========================
     LOGIN CARD
     ========================== -->


<div class="login-card">







<!-- ==========================
     BRAND
     ========================== -->


<div class="login-brand">



<img

src="<%=request.getContextPath()%>/assets/images/centria-logo.png"

alt="Centria Logo"

class="login-logo"



>




<h1>

Centria

</h1>



<span>

Super Admin

</span>



</div>








<h2>

<%= LanguageManager.get("login.title", session) %>

</h2>








<%

String error = request.getParameter("error");


boolean loginError =
        "invalid".equals(error);


%>







<%

if(loginError){

%>


<div class="error-message">


<%= LanguageManager.get("error.login.invalid", session) %>


</div>


<%

}

%>









<!-- Database Status -->


<div id="dbStatus"
     class="db-status checking">


<%= LanguageManager.get("database.checking", session) %>


</div>









<form action="<%=request.getContextPath()%>/SuperLoginServlet"
      method="POST">








<!-- Username -->


<div class="input-group">


<span class="input-icon">

👤

</span>



<input type="text"

       name="username"

       placeholder="<%= LanguageManager.get("login.username", session) %>"

       required>



</div>









<!-- Password -->


<div class="password-wrapper">



<span class="input-icon">

🔒

</span>



<input type="password"

       id="password"

       name="password"

       placeholder="<%= LanguageManager.get("login.password", session) %>"

       required>





<div class="toggle-btn"

     onclick="togglePassword()">



👁



</div>



</div>









<!-- Remember -->


<div class="remember-me">



<input type="checkbox"

       name="remember">



<label>


<%= LanguageManager.get("login.remember", session) %>


</label>



</div>









<button id="loginBtn"

        type="submit"

        class="<%= loginError ? "login-error" : "" %>"

        disabled>


🚀

<%= LanguageManager.get("login.button", session) %>


</button>







</form>






</div>









<script>


const contextPath =
"<%=request.getContextPath()%>";



</script>






<script src="<%=request.getContextPath()%>/assets/js/superlogin.js?v=2">

</script>






</body>


</html>