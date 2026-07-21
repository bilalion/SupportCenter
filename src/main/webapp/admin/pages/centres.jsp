<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>


<div class="dashboard-header">

    <h1>
        <%= LanguageManager.get("centers.title", session) %>
    </h1>

    <p>
        <%= LanguageManager.get("centers.description", session) %>
    </p>

</div>



<div class="card">

    <h3>
        <%= LanguageManager.get("centers.list.title", session) %>
    </h3>


    <p>
        <%= LanguageManager.get("centers.empty", session) %>
    </p>


</div>