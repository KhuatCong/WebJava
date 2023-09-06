/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serial;
import java.io.Serializable;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Carts {
    private int id;
    private String spvsl;
    private int soluong;
    private Book book;
    public Carts() {
    }

    public Carts( Book book, int soluong) {

        this.book = book;
        this.soluong = soluong;
    }

    public String getSpvsl() {
        return spvsl;
    }

    public void setSpvsl(String spvsl) {
        this.spvsl = spvsl;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
    
}
