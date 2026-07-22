package servlet;


import dao.CentreDAO;
import model.Centre;


import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(
    name = "CentreServlet",
    urlPatterns = {"/CentreServlet"}
)
public class CentreServlet extends HttpServlet {



    private CentreDAO centreDAO;





    @Override
    public void init() throws ServletException {


        centreDAO = new CentreDAO();


    }








    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    )
    throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");



        String action =
                request.getParameter("action");



        if(action == null){

            action = "list";

        }






        switch(action){


            case "list":

            default:


                listCentres(
                    request,
                    response
                );


                break;


        }



    }









    private void listCentres(
            HttpServletRequest request,
            HttpServletResponse response
    )
    throws ServletException, IOException {



        // ==========================
        // PARAMETERS
        // ==========================


        String search =
                request.getParameter("search");



        String status =
                request.getParameter("status");



        String order =
                request.getParameter("order");







        // ==========================
        // DEFAULT VALUES
        // ==========================


        if(search == null){

            search = "";

        }




        if(status == null || status.isEmpty()){

            status = "ALL";

        }




        if(order == null || order.isEmpty()){

            order = "NEW";

        }







        // ==========================
        // LOAD DATA
        // ==========================


        List<Centre> centres =
                centreDAO.searchCentres(
                    search,
                    status,
                    order
                );







        // ==========================
        // SEND DATA
        // ==========================


        request.setAttribute(
                "centres",
                centres
        );



        request.setAttribute(
                "search",
                search
        );



        request.setAttribute(
                "status",
                status
        );



        request.setAttribute(
                "order",
                order
        );








        // ==========================
        // AJAX OR NORMAL LOAD
        // ==========================


        String ajax =
                request.getParameter("ajax");




        if("true".equals(ajax)){


            request.getRequestDispatcher(
                    "/admin/pages/centres.jsp"
            )
            .forward(
                    request,
                    response
            );


            return;


        }






        // NORMAL REQUEST


        request.getRequestDispatcher(
                "/admin/pages/centres.jsp"
        )
        .forward(
                request,
                response
        );



    }









    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    )
    throws ServletException, IOException {



        doGet(
            request,
            response
        );


    }









    @Override
    public String getServletInfo(){


        return "Centre Management Servlet";


    }



}