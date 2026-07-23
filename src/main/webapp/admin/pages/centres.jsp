<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="config.LanguageManager"%>
<%@page import="model.Centre"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>



<!-- ==========================
     HEADER
     ========================== -->


<div class="dashboard-header">


    <h1>
        <%= LanguageManager.get("centers.title", session) %>
    </h1>


    <p>
        <%= LanguageManager.get("centers.description", session) %>
    </p>


</div>





<!-- ==========================
     TOOLBAR
     ========================== -->


<div class="card centres-toolbar">



<form method="get"
      action="<%=request.getContextPath()%>/CentreServlet"
      class="centres-filter-form"
      onsubmit="searchCentres(event)">


<input type="hidden"
       name="action"
       value="list">





<!-- SEARCH -->

<div class="search-box">


<input type="text"
       name="search"
       value="<%= request.getAttribute("search") != null 
                ? request.getAttribute("search") 
                : "" %>"
       placeholder="<%=LanguageManager.get("centers.search.placeholder",session)%>">


</div>







<!-- STATUS FILTER -->


<select name="status" class="centre-select">


<option value="ALL">

<%=LanguageManager.get("centers.all",session)%>

</option>



<option value="ACTIVE">

<%=LanguageManager.get("centers.active",session)%>

</option>



<option value="SUSPENDED">

<%=LanguageManager.get("centers.suspended",session)%>

</option>



<option value="INACTIVE">

<%=LanguageManager.get("centers.inactive",session)%>

</option>

<option value="PENDING">
<%=LanguageManager.get("centers.pending",session)%>
</option>


<option value="ARCHIVED">
<%=LanguageManager.get("centers.archived",session)%>
</option>


</select>







<!-- ORDER -->


<select name="order" class="centre-select">


<option value="NEW">

<%=LanguageManager.get("centers.newest",session)%>

</option>



<option value="OLD">

<%=LanguageManager.get("centers.oldest",session)%>

</option>



<option value="NAME">

<%=LanguageManager.get("centers.name.asc",session)%>

</option>



</select>






<button type="submit"
        class="btn-primary">


🔎

<%=LanguageManager.get("centers.search",session)%>


</button>






</form>





<!-- ADD -->


<a href="<%=request.getContextPath()%>/admin/pages/add-centre.jsp"
   class="btn-primary">


➕

<%=LanguageManager.get("centers.add",session)%>


</a>


</div>








<!-- ==========================
     TABLE CARD
     ========================== -->


<div class="card">



<h3>

<%=LanguageManager.get("centers.list.title",session)%>

</h3>






<%

List<Centre> centres =
(List<Centre>)request.getAttribute("centres");



SimpleDateFormat sdf =
new SimpleDateFormat("dd/MM/yyyy");



if(centres == null || centres.isEmpty()){


%>


<p>

<%=LanguageManager.get("centers.empty",session)%>

</p>


<%

}else{


%>






<div class="table-container">



<table class="centers-table">



<thead>


<tr>



<th>
<%=LanguageManager.get("centers.id",session)%>
</th>




<th>
<%=LanguageManager.get("centers.name",session)%>
</th>




<th>
<%=LanguageManager.get("centers.owner",session)%>
</th>




<th>
<%=LanguageManager.get("centers.username",session)%>
</th>




<th>
<%=LanguageManager.get("centers.phone",session)%>
</th>




<th>
<%=LanguageManager.get("centers.subscription.start",session)%>
</th>




<th>
<%=LanguageManager.get("centers.subscription.end",session)%>
</th>




<th>
<%=LanguageManager.get("centers.status",session)%>
</th>




<th>
<%=LanguageManager.get("centers.actions",session)%>
</th>




</tr>


</thead>

<tbody>



<%

for(Centre centre : centres){



String status =
centre.getStatus();



String statusClass = "status-active";


if("SUSPENDED".equals(status)){

    statusClass="status-suspended";

}


if("INACTIVE".equals(status)){

    statusClass="status-inactive";

}


if("PENDING".equals(status)){

    statusClass="status-pending";

}


if("ARCHIVED".equals(status)){

    statusClass="status-archived";

}



%>





<tr>




<!-- ID -->

<td>

<%=centre.getId()%>

</td>





<!-- NAME -->

<td>

<strong>

<%=centre.getName()%>

</strong>

</td>







<!-- OWNER -->

<td>

<%=centre.getOwnerName()%>

</td>







<!-- USERNAME -->

<td>

<%=centre.getUsername()%>

</td>







<!-- PHONE -->

<td>

<%=centre.getPhone()%>

</td>







<!-- START SUBSCRIPTION -->

<td>


<%

if(centre.getSubscriptionStart()!=null){

%>


<%=sdf.format(
        centre.getSubscriptionStart()
)%>


<%

}else{

%>

-

<%

}

%>


</td>







<!-- END SUBSCRIPTION -->

<td>


<%

if(centre.getSubscriptionEnd()!=null){

%>


<%=sdf.format(
        centre.getSubscriptionEnd()
)%>


<%

}else{

%>

-

<%

}

%>


</td>







<!-- STATUS -->

<td>


<span class="status-badge <%=statusClass%>">


<%=status%>


</span>


</td>







<!-- ACTIONS -->

<td>


<div class="actions">





<!-- VIEW -->

<a href="#"
   class="action-btn action-view"
   title="<%=LanguageManager.get("centers.view",session)%>">


👁


</a>


  




<!-- EDIT -->

<a href="#"
   class="action-btn action-edit"
   title="<%=LanguageManager.get("centers.edit",session)%>">


✏️


</a>







<!-- RESET PASSWORD -->

<a href="#"
   class="action-btn action-renew"
   title="Reset Password">


🔑


</a>







<!-- STOP -->

<a href="#"
   class="action-btn action-stop"
   title="<%=LanguageManager.get("centers.stop",session)%>">


⏸


</a>






</div>


</td>






</tr>





<%

}

%>





</tbody>



</table>



</div>





<%

}

%>





</div>