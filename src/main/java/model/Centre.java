package model;

import java.sql.Timestamp;


/**
 *
 * @author imac
 */
public class Centre {


    private int id;

    private String name;

    private String city;

    private String phone;

    private String email;

    private String address;

    private String status;

    private Timestamp createdAt;



    // ==========================
    // Constructeur vide
    // ==========================

    public Centre() {

    }



    // ==========================
    // Constructeur complet
    // ==========================

    public Centre(
            int id,
            String name,
            String city,
            String phone,
            String email,
            String address,
            String status,
            Timestamp createdAt
    ) {

        this.id = id;
        this.name = name;
        this.city = city;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.status = status;
        this.createdAt = createdAt;

    }



    // ==========================
    // GETTERS
    // ==========================


    public int getId() {

        return id;

    }



    public String getName() {

        return name;

    }



    public String getCity() {

        return city;

    }



    public String getPhone() {

        return phone;

    }



    public String getEmail() {

        return email;

    }



    public String getAddress() {

        return address;

    }



    public String getStatus() {

        return status;

    }



    public Timestamp getCreatedAt() {

        return createdAt;

    }





    // ==========================
    // SETTERS
    // ==========================


    public void setId(int id) {

        this.id = id;

    }



    public void setName(String name) {

        this.name = name;

    }



    public void setCity(String city) {

        this.city = city;

    }



    public void setPhone(String phone) {

        this.phone = phone;

    }



    public void setEmail(String email) {

        this.email = email;

    }



    public void setAddress(String address) {

        this.address = address;

    }



    public void setStatus(String status) {

        this.status = status;

    }



    public void setCreatedAt(Timestamp createdAt) {

        this.createdAt = createdAt;

    }



}