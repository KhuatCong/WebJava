/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ThinkPad X1 G4
 */
public class HistoryWeb {

    private int id;
    private Account account;
    private String actionhis;
    private String thoigian;

    public HistoryWeb() {
    }

    public HistoryWeb(int id, Account account, String actionhis, String thoigian) {
        this.id = id;
        this.account = account;
        this.actionhis = actionhis;
        this.thoigian = thoigian;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getActionhis() {
        return actionhis;
    }

    public void setActionhis(String actionhis) {
        this.actionhis = actionhis;
    }

    public String getThoigian() {
        return thoigian;
    }

    public void setThoigian(String thoigian) {
        this.thoigian = thoigian;
    }

    
    
}
