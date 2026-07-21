<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>


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

        <p>
            0
        </p>

    </div>


    <div class="card">

        <h3>
            <%= LanguageManager.get("dashboard.active.centers", session) %>
        </h3>

        <p>
            0
        </p>

    </div>


    <div class="card">

        <h3>
            <%= LanguageManager.get("dashboard.total.subscriptions", session) %>
        </h3>

        <p>
            0
        </p>

    </div>


    <div class="card">

        <h3>
            <%= LanguageManager.get("dashboard.total.revenue", session) %>
        </h3>

        <p>
            0 MAD
        </p>

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