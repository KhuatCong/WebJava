/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Discount;
import model.HistoryWeb;
import model.HistoryWeb2;
import model.MethodPayment;

/**
 *
 * @author ThinkPad X1 G4
 */
public class WebDAO extends DBcontext {

    public List<MethodPayment> getMethod() {
        List<MethodPayment> list = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.methodpayment;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new MethodPayment(rs.getInt("ID"), rs.getString("NameMethod")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Discount> getAllDis() {
        List<Discount> list = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.discounttt";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getString("Magg").toUpperCase(), rs.getDouble("Rate"), rs.getInt("Stt")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<HistoryWeb> getAllAction() {
        List<HistoryWeb> list = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.history_web";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HistoryWeb h = new HistoryWeb();
                h.setId(rs.getInt("ID"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                h.setAccount(ac);
                h.setActionhis(rs.getString("ActionHis"));
                h.setThoigian(rs.getString("TimeHis"));

                list.add(h);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<HistoryWeb2> getAllAction2() {
        List<HistoryWeb2> list2 = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.history_web";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                HistoryWeb2 w = new HistoryWeb2(rs.getInt("ID"), 
                                                rs.getInt("AccountID"), 
                                                rs.getString("ActionHis"), 
                                                rs.getString("TimeHis"));
                list2.add(w);
            }
        } catch (Exception e) {
        }
       return list2;
    }
    
//    public int getAllTotel(){
//        String sql ="SELECT sum(total) FROM endjavaweb.ordercart where stt = 4";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//        } catch (Exception e) {
//        }
//    }
    
    
}
