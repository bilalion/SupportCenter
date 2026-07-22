<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.LanguageManager"%>


<!-- ==========================
     DASHBOARD HEADER
     ========================== -->

<div class="dashboard-header">


    <h1>

        <%= LanguageManager.get("dashboard.main.title", session) %>

    </h1>



    <p>

        <%= LanguageManager.get("dashboard.card.text", session) %>

    </p>


</div>







<!-- ==========================
     STATISTICS GRID
     ========================== -->


<div class="stats-container">



    <!-- ==========================
         TOTAL CENTERS
         ========================== -->


    <div class="card dashboard-card blue-card">


        <div class="card-icon">

            🏢

        </div>



        <div class="card-info">


            <h3>

                <%= LanguageManager.get("dashboard.total.centers", session) %>

            </h3>



            <strong>

                0

            </strong>


        </div>



    </div>







    <!-- ==========================
         ACTIVE CENTERS
         ========================== -->


    <div class="card dashboard-card green-card">


        <div class="card-icon">

            ✅

        </div>



        <div class="card-info">


            <h3>

                <%= LanguageManager.get("dashboard.active.centers", session) %>

            </h3>



            <strong>

                0

            </strong>


        </div>



    </div>








    <!-- ==========================
         SUBSCRIPTIONS
         ========================== -->


    <div class="card dashboard-card orange-card">


        <div class="card-icon">

            📅

        </div>



        <div class="card-info">


            <h3>

                <%= LanguageManager.get("dashboard.total.subscriptions", session) %>

            </h3>



            <strong>

                0

            </strong>


        </div>



    </div>








    <!-- ==========================
         REVENUE
         ========================== -->


    <div class="card dashboard-card purple-card">


        <div class="card-icon">

            💰

        </div>



        <div class="card-info">


            <h3>

                <%= LanguageManager.get("dashboard.total.revenue", session) %>

            </h3>



            <strong>

                0 MAD

            </strong>


        </div>



    </div>





</div>










<!-- ==========================
     WELCOME SECTION
     ========================== -->


<div class="card welcome-card">


    <div class="welcome-icon">

        🚀

    </div>



    <div>


        <h3>

            <%= LanguageManager.get("dashboard.card.title", session) %>

        </h3>



        <p>

            <%= LanguageManager.get("dashboard.card.text", session) %>

        </p>



    </div>


</div>