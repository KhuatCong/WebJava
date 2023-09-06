/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Configs {
    private String id, tenweb, facebook, mail, phone, diachi, description;

    public Configs() {
    }

    public Configs(String id, String tenweb, String facebook, String mail, String phone, String diachi, String description) {
        this.id = id;
        this.tenweb = tenweb;
        this.facebook = facebook;
        this.mail = mail;
        this.phone = phone;
        this.diachi = diachi;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTenweb() {
        return tenweb;
    }

    public void setTenweb(String tenweb) {
        this.tenweb = tenweb;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
