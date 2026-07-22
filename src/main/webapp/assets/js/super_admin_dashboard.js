/*
 * Centria
 * Super Admin Dashboard
 */


function loadContent(page) {



    let url;




    /*
     * Servlet loading
     * Example:
     * CentreServlet?action=list
     */

    if(page.startsWith("CentreServlet")) {



        url =
        window.contextPath +
        "/" +
        page;



    }




    /*
     * Normal JSP pages
     */

    else {



        url =
        window.contextPath +
        "/admin/pages/" +
        page;



    }







    fetch(url)



    .then(response => {



        if(!response.ok) {



            throw new Error(
                "HTTP ERROR : " + response.status
            );



        }



        return response.text();



    })





    .then(data => {



        document.getElementById(
            "content-area"
        ).innerHTML = data;



    })





    .catch(error => {



        console.error(
            "Loading error:",
            error
        );



        document.getElementById(
            "content-area"
        ).innerHTML =
        `
        <div class="card">
            Error loading content
        </div>
        `;



    });



}

