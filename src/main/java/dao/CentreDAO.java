package dao;


import config.DatabaseConfig;
import model.Centre;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;



public class CentreDAO {



    // =====================================
    // GET ALL CENTRES
    // =====================================

    public List<Centre> getAllCentres(){

        return searchCentres(
                "",
                "ALL",
                "NEW"
        );

    }






    // =====================================
    // SEARCH + FILTER + ORDER
    // =====================================

    public List<Centre> searchCentres(
            String search,
            String status,
            String order
    ){


        List<Centre> centres =
                new ArrayList<>();


        StringBuilder sql =
                new StringBuilder();



        sql.append(
            "SELECT * FROM centres WHERE 1=1 "
        );





        // ==========================
        // SEARCH
        // ==========================

        if(search != null &&
           !search.trim().isEmpty()){


            sql.append(
                " AND (name LIKE ? "
                + "OR owner_name LIKE ? "
                + "OR username LIKE ? "
                + "OR phone LIKE ?) "
            );


        }






        // ==========================
        // STATUS FILTER
        // ==========================

        if(status != null &&
           !status.equals("ALL")){


            sql.append(
                " AND status=? "
            );


        }







        // ==========================
        // ORDER
        // ==========================

        if(order == null){

            order="NEW";

        }



        switch(order){


            case "OLD":


                sql.append(
                    " ORDER BY id ASC "
                );


                break;



            case "NAME":


                sql.append(
                    " ORDER BY name ASC "
                );


                break;



            case "NEW":

            default:


                sql.append(
                    " ORDER BY id DESC "
                );


                break;

        }







        try(

            Connection con =
            DatabaseConfig.getConnection();



            PreparedStatement ps =
            con.prepareStatement(
                    sql.toString()
            )


        ){



            int index = 1;






            // ==========================
            // SEARCH VALUES
            // ==========================

            if(search != null &&
               !search.trim().isEmpty()){



                String value =
                        "%" + search + "%";



                ps.setString(
                    index++,
                    value
                );


                ps.setString(
                    index++,
                    value
                );


                ps.setString(
                    index++,
                    value
                );


                ps.setString(
                    index++,
                    value
                );

            }







            // ==========================
            // STATUS VALUE
            // ==========================

            if(status != null &&
               !status.equals("ALL")){


                ps.setString(
                    index++,
                    status
                );


            }







            ResultSet rs =
                    ps.executeQuery();






            while(rs.next()){



                Centre centre =
                        new Centre();




                centre.setId(
                    rs.getInt("id")
                );



                centre.setName(
                    rs.getString("name")
                );



                centre.setOwnerName(
                    rs.getString("owner_name")
                );



                centre.setUsername(
                    rs.getString("username")
                );



                centre.setPhone(
                    rs.getString("phone")
                );



                centre.setSubscriptionStart(
                    rs.getDate("subscription_start")
                );



                centre.setSubscriptionEnd(
                    rs.getDate("subscription_end")
                );



                centre.setStatus(
                    rs.getString("status")
                );



                centre.setCreatedAt(
                    rs.getTimestamp("created_at")
                );




                centres.add(centre);



            }





        }
        catch(Exception e){


            e.printStackTrace();


        }





        return centres;



    }





}