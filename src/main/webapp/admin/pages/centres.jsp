<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.centria.utils.LanguageManager"%>



<!-- =================================================
     HEADER
     ================================================= -->


<div class="dashboard-header">


    <h1>
        <%= LanguageManager.get("centers.title", session) %>
    </h1>


    <p>
        <%= LanguageManager.get("centers.description", session) %>
    </p>


</div>









<!-- =================================================
     TOOLBAR
     ================================================= -->


<div class="card centres-toolbar">



<form id="centresFilterForm"
      method="get"
      action="<%=request.getContextPath()%>/CentreServlet"
      class="centres-filter-form">



<input type="hidden"
       name="action"
       value="list">








<!-- ==========================
     SEARCH LIVE
     ========================== -->


<div class="search-box">


<input type="text"
       id="centreSearch"
       name="search"
       value="<%= request.getAttribute("search") != null 
                ? request.getAttribute("search") 
                : "" %>"
       placeholder="<%=LanguageManager.get(
                    "centers.search.placeholder",
                    session
       )%>">



</div>









<!-- ==========================
     STATUS
     ========================== -->


<select id="centreStatus"
        name="status"
        class="centre-select">



<option value="ALL">

<%=LanguageManager.get(
        "centers.all",
        session
)%>

</option>




<option value="PENDING">

<%=LanguageManager.get(
        "centers.pending",
        session
)%>

</option>




<option value="ACTIVE">

<%=LanguageManager.get(
        "centers.active",
        session
)%>

</option>




<option value="SUSPENDED">

<%=LanguageManager.get(
        "centers.suspended",
        session
)%>

</option>




<option value="ARCHIVED">

<%=LanguageManager.get(
        "centers.archived",
        session
)%>

</option>



</select>









<!-- ==========================
     ORDER
     ========================== -->


<select id="centreOrder"
        name="order"
        class="centre-select">



<option value="NEW">

<%=LanguageManager.get(
        "centers.newest",
        session
)%>

</option>




<option value="OLD">

<%=LanguageManager.get(
        "centers.oldest",
        session
)%>

</option>




<option value="NAME">

<%=LanguageManager.get(
        "centers.name.asc",
        session
)%>

</option>



</select>









<button type="button"
        onclick="loadCentres(1)"
        class="btn-primary">


🔎

<%=LanguageManager.get(
        "centers.search",
        session
)%>


</button>







</form>









<!-- ==========================
     ADD CENTRE
     ========================== -->


<a href="<%=request.getContextPath()%>/admin/pages/fragments/centres/add-centre.jsp"
   class="btn-primary btn-no-underline">


➕

<%=LanguageManager.get(
        "centers.add",
        session
)%>


</a>






</div>









<!-- =================================================
     TABLE CONTAINER
     ================================================= -->


<div id="centres-table-container">



<!--
    هنا سيتم تحميل:

    centres-table.jsp

    بواسطة AJAX

-->



</div>









<script>


let searchTimer;



document
.getElementById("centreSearch")
.addEventListener(
"input",
function(){


    clearTimeout(searchTimer);



    searchTimer =
    setTimeout(
        function(){

            loadCentres(1);

        },
        400
    );


});







document
.getElementById("centreStatus")
.addEventListener(
"change",
function(){

    loadCentres(1);

});







document
.getElementById("centreOrder")
.addEventListener(
"change",
function(){

    loadCentres(1);

});







function loadCentres(page){



    let search =
    document.getElementById(
        "centreSearch"
    ).value;



    let status =
    document.getElementById(
        "centreStatus"
    ).value;



    let order =
    document.getElementById(
        "centreOrder"
    ).value;






    let url =
    "<%=request.getContextPath()%>/CentreServlet"
    +
    "?action=list"
    +
    "&search="
    + encodeURIComponent(search)
    +
    "&status="
    + status
    +
    "&order="
    + order
    +
    "&page="
    + page
    +
    "&ajax=true";







    fetch(url)

    .then(
        response =>
        response.text()
    )

    .then(
        html => {


            document
            .getElementById(
                "centres-table-container"
            )
            .innerHTML = html;



        }
    )

    .catch(
        error => {

            console.log(error);

        }
    );





}




// تشغيل تحميل الجدول مباشرة بعد إدخال الصفحة
setTimeout(
    function(){

        loadCentres(1);

    },
    100
);

</script>

<!-- =================================================
     AJAX PAGINATION HANDLER
     ================================================= -->


<script>


function changeCentrePage(page){


    loadCentres(page);


}



</script>