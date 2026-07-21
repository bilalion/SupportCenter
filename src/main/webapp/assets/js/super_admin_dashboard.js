/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/*
 * Centria
 * Super Admin Dashboard
 */

function loadContent(page) {

    fetch(window.contextPath + "/admin/pages/" + page)

        .then(response => response.text())

        .then(data => {

            document.getElementById("content-area").innerHTML = data;

        })

        .catch(error => {

            console.error("Loading error:", error);

        });

}