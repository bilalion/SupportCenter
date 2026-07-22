<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="config.LanguageManager"%>
<%@page import="model.Centre"%>
<%@page import="java.util.List"%>



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
          class="centres-filter-form">



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
                   placeholder="<%=LanguageManager.get("centers.search.placeholder", session)%>">


        </div>






        <!-- STATUS -->


        <select name="status">


            <option value="ALL">

                <%=LanguageManager.get("centers.all",session)%>

            </option>



            <option value="ACTIVE">

                <%=LanguageManager.get("centers.active",session)%>

            </option>




            <option value="INACTIVE">

                <%=LanguageManager.get("centers.inactive",session)%>

            </option>




            <option value="SUSPENDED">

                <%=LanguageManager.get("centers.suspended",session)%>

            </option>



        </select>








        <!-- ORDER -->


        <select name="order">


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





    <!-- ADD BUTTON -->


    <button class="btn-primary">


        ➕

        <%=LanguageManager.get("centers.add",session)%>


    </button>





</div>









<!-- ==========================
     LIST
     ========================== -->


<div class="card">



<h3>

<%=LanguageManager.get("centers.list.title",session)%>

</h3>







<%

List<Centre> centres =
(List<Centre>)request.getAttribute("centres");



if(centres == null || centres.isEmpty()){


%>



<p>

<%=LanguageManager.get("centers.empty",session)%>

</p>




<%

}

else{


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
<%=LanguageManager.get("centers.city",session)%>
</th>


<th>
<%=LanguageManager.get("centers.phone",session)%>
</th>


<th>
<%=LanguageManager.get("centers.email",session)%>
</th>


<th>
<%=LanguageManager.get("centers.status",session)%>
</th>


<th>
<%=LanguageManager.get("centers.created",session)%>
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


String statusClass="status-active";


if("INACTIVE".equals(status)){

statusClass="status-inactive";

}


if("SUSPENDED".equals(status)){

statusClass="status-suspended";

}



%>





<tr>



<td>

<%=centre.getId()%>

</td>





<td>

<%=centre.getName()%>

</td>





<td>

<%=centre.getCity()%>

</td>





<td>

<%=centre.getPhone()%>

</td>





<td>

<%=centre.getEmail()%>

</td>






<td>


<span class="status-badge <%=statusClass%>">

<%=status%>

</span>


</td>






<td>

<%=centre.getCreatedAt()%>

</td>






<td>


<div class="actions">


<a href="#"
class="action-btn action-view"
title="<%=LanguageManager.get("centers.view",session)%>">

👁

</a>



<a href="#"
class="action-btn action-edit"
title="<%=LanguageManager.get("centers.edit",session)%>">

✏️

</a>



<a href="#"
class="action-btn action-stop"
title="<%=LanguageManager.get("centers.stop",session)%>">

⏸

</a>



<a href="#"
class="action-btn action-renew"
title="<%=LanguageManager.get("centers.renew",session)%>">

♻️

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