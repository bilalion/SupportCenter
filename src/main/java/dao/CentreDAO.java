package dao;


import config.DatabaseConfig;
import model.Centre;
import util.PasswordUtil;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

import java.util.ArrayList;
import java.util.List;



public class CentreDAO {



    public List<Centre> getAllCentres(){

        return searchCentres(
                "",
                "ALL",
                "NEW"
        );

    }






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




        if(search != null &&
           !search.trim().isEmpty()){


            sql.append(
                " AND (name LIKE ? "
                + "OR owner_name LIKE ? "
                + "OR username LIKE ? "
                + "OR phone LIKE ?) "
            );


        }





        if(status != null &&
           !status.equals("ALL")){


            sql.append(
                " AND status=? "
            );


        }






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




            if(search != null &&
               !search.trim().isEmpty()){


                String value =
                        "%" + search + "%";


                ps.setString(index++, value);

                ps.setString(index++, value);

                ps.setString(index++, value);

                ps.setString(index++, value);


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



                centre.setOwnerName(
                        rs.getString("owner_name")
                );



                centre.setUsername(
                        rs.getString("username")
                );



                centre.setPasswordHash(
                        rs.getString("password_hash")
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



                centre.setMustChangePassword(
                        rs.getBoolean("must_change_password")
                );



                centre.setLastLogin(
                        rs.getTimestamp("last_login")
                );



                centres.add(centre);


            }



        }
        catch(Exception e){

            e.printStackTrace();

        }




        return centres;


    }









    public boolean addCentre(Centre centre){



        String sql =

        "INSERT INTO centres "
        + "(name,owner_name,username,password_hash,"
        + "phone,subscription_start,subscription_end,"
        + "status,must_change_password) "
        + "VALUES (?,?,?,?,?,?,?,?,1)";





        try(

            Connection con =
            DatabaseConfig.getConnection();



            PreparedStatement ps =
            con.prepareStatement(sql)



        ){



            ps.setString(
                    1,
                    centre.getName()
            );


            ps.setString(
                    2,
                    centre.getOwnerName()
            );


            ps.setString(
                    3,
                    centre.getUsername()
            );


            ps.setString(
                    4,
                    centre.getPasswordHash()
            );


            ps.setString(
                    5,
                    centre.getPhone()
            );


            ps.setDate(
                    6,
                    centre.getSubscriptionStart()
            );


            ps.setDate(
                    7,
                    centre.getSubscriptionEnd()
            );


            ps.setString(
                    8,
                    "ACTIVE"
            );



            return ps.executeUpdate() > 0;



        }
        catch(Exception e){


            e.printStackTrace();


        }



        return false;


    }









    public boolean resetPassword(
            int centreId,
            String newPassword
    ){


        String sql =

        "UPDATE centres SET "
        + "password_hash=?, "
        + "must_change_password=1 "
        + "WHERE id=?";





        try(

            Connection con =
            DatabaseConfig.getConnection();


            PreparedStatement ps =
            con.prepareStatement(sql)


        ){



            ps.setString(
                    1,
                    PasswordUtil.hashPassword(
                            newPassword
                    )
            );



            ps.setInt(
                    2,
                    centreId
            );



            return ps.executeUpdate() > 0;


        }
        catch(Exception e){


            e.printStackTrace();


        }


        return false;


    }









    public boolean updateStatus(
            int centreId,
            String status
    ){


        String sql =

        "UPDATE centres SET status=? WHERE id=?";





        try(

            Connection con =
            DatabaseConfig.getConnection();


            PreparedStatement ps =
            con.prepareStatement(sql)


        ){



            ps.setString(
                    1,
                    status
            );


            ps.setInt(
                    2,
                    centreId
            );


            return ps.executeUpdate()>0;



        }
        catch(Exception e){


            e.printStackTrace();


        }


        return false;


    }









    public boolean updateSubscription(
            int centreId,
            Date endDate
    ){


        String sql =

        "UPDATE centres SET "
        + "subscription_end=?, "
        + "status='ACTIVE' "
        + "WHERE id=?";





        try(

            Connection con =
            DatabaseConfig.getConnection();


            PreparedStatement ps =
            con.prepareStatement(sql)


        ){



            ps.setDate(
                    1,
                    endDate
            );


            ps.setInt(
                    2,
                    centreId
            );


            return ps.executeUpdate()>0;



        }
        catch(Exception e){


            e.printStackTrace();


        }



        return false;


    }



}