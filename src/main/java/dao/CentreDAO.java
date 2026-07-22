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
            + "OR city LIKE ? "
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



            int index=1;






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



            }







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



                centre.setCity(
                    rs.getString("city")
                );



                centre.setPhone(
                    rs.getString("phone")
                );



                centre.setEmail(
                    rs.getString("email")
                );



                centre.setAddress(
                    rs.getString("address")
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