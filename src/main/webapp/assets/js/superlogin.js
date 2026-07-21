/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*
 * superadmin.js
 */


function togglePassword(){


    let pass = document.getElementById("password");


    if(pass.type === "password"){

        pass.type = "text";

    }
    else{

        pass.type = "password";

    }

}




window.onload = function(){



    let status =
        document.getElementById("dbStatus");


    let btn =
        document.getElementById("loginBtn");



    fetch(contextPath + "/DatabaseStatusServlet")



    .then(response => {


        console.log("HTTP STATUS : " + response.status);


        return response.text();


    })



    .then(text => {


        console.log("SERVER RESPONSE : " + text);



        let data = JSON.parse(text);



        if(data.status === "connected"){



            status.innerHTML =
            "🟢";


            status.className =
            "db-status connected";


            btn.disabled = false;



        }

        else {



            status.innerHTML =
            "🔴 " + (data.message || "");


            status.className =
            "db-status failed";


            btn.disabled = true;


        }



    })



    .catch(error => {


        console.error(
            "FETCH ERROR : ",
            error
        );



        status.innerHTML =
        "🟠";


        status.className =
        "db-status failed";


        btn.disabled = true;



    });



};