package model;

import java.sql.Date;
import java.sql.Timestamp;


/**
 *
 * @author imac
 */
public class Centre {


    private int id;

    private String name;

    private String ownerName;

    private String username;

    private String password;

    private String phone;

    private Date subscriptionStart;

    private Date subscriptionEnd;

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
            String ownerName,
            String username,
            String password,
            String phone,
            Date subscriptionStart,
            Date subscriptionEnd,
            String status,
            Timestamp createdAt
    ) {

        this.id = id;
        this.name = name;
        this.ownerName = ownerName;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.subscriptionStart = subscriptionStart;
        this.subscriptionEnd = subscriptionEnd;
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


    public String getOwnerName() {
        return ownerName;
    }


    public String getUsername() {
        return username;
    }


    public String getPassword() {
        return password;
    }


    public String getPhone() {
        return phone;
    }


    public Date getSubscriptionStart() {
        return subscriptionStart;
    }


    public Date getSubscriptionEnd() {
        return subscriptionEnd;
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


    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public void setPassword(String password) {
        this.password = password;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setSubscriptionStart(Date subscriptionStart) {
        this.subscriptionStart = subscriptionStart;
    }


    public void setSubscriptionEnd(Date subscriptionEnd) {
        this.subscriptionEnd = subscriptionEnd;
    }


    public void setStatus(String status) {
        this.status = status;
    }


    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }


}