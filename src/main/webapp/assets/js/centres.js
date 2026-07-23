/*
 * Centria
 * Centres Management JavaScript
 *
 * Search / Filter / Sort AJAX
 */


// =====================================
// SEARCH CENTRES
// =====================================


function searchCentres(event){


    if(event){

        event.preventDefault();

    }



    let form =
    document.querySelector(
        ".centres-filter-form"
    );



    if(!form){

        return false;

    }



    let search =
    form.querySelector(
        "[name='search']"
    ).value;



    let status =
    form.querySelector(
        "[name='status']"
    ).value;



    let order =
    form.querySelector(
        "[name='order']"
    ).value;





    let url =
        window.contextPath
        +
        "/CentreServlet?action=list"
        +
        "&ajax=true"
        +
        "&search="
        +
        encodeURIComponent(search)
        +
        "&status="
        +
        encodeURIComponent(status)
        +
        "&order="
        +
        encodeURIComponent(order);




    loadCentres(url);



    return false;

}







// =====================================
// LOAD CENTRES AJAX
// =====================================


function loadCentres(url){



    fetch(url)


    .then(response => {


        if(!response.ok){


            throw new Error(
                "HTTP ERROR "
                +
                response.status
            );


        }



        return response.text();



    })



    .then(data => {



        let container =
        document.getElementById(
            "content-area"
        );




        if(container){


            container.innerHTML =
            data;



            activateCentreEvents();



        }



    })



    .catch(error => {


        console.error(
            "Centres AJAX Error:",
            error
        );


    });



}








// =====================================
// FILTER CHANGE
// =====================================


function filterCentres(){


    searchCentres();


}









// =====================================
// ACTIVATE EVENTS
// =====================================


function activateCentreEvents(){



    let form =
    document.querySelector(
        ".centres-filter-form"
    );



    if(form){


        form.onsubmit =
        searchCentres;


    }






    let selects =
    document.querySelectorAll(
        ".centres-filter-form select"
    );





    selects.forEach(
        function(select){


            select.onchange =
            filterCentres;


        }
    );



}







// =====================================
// UPDATE CENTRE STATUS AJAX
// =====================================



function updateCentreStatus(select){

    let id =
        select.getAttribute("data-id");


    let status =
        select.value;



let url =
    window.contextPath
    +
    "/CentreServlet?action=status"
    +
    "&ajax=true"
    +
    "&id="
    +
    id
    +
    "&status="
    +
    status;


    fetch(url)



    .then(response => response.json())



    .then(data => {



        if(data.success){



            console.log(
                "Status updated:",
                data.status
            );



            // إعادة تحميل المراكز من database
            select.classList.remove(
    "status-pending",
    "status-active",
    "status-suspended",
    "status-archived"
);


select.classList.add(
    "status-" + status.toLowerCase()
);



        }
        else{


            alert(
                "Erreur modification statut"
            );


        }



    })



    .catch(error => {


        console.error(
            "Status AJAX Error:",
            error
        );


    });


}

// =====================================
// INIT
// =====================================


document.addEventListener(
"DOMContentLoaded",
function(){


    activateCentreEvents();



});