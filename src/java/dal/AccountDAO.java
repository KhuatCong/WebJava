/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;

/**
 *
 * @author ThinkPad X1 G4
 */
public class AccountDAO extends DBcontext {

    public List<Account> getALL() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getInt("Stt"));
                list.add(acc);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    public Boolean HistoryLogin(int acid){
        String sql = "INSERT INTO `endjavaweb`.`history_login` (`account_id`, `thoigian`) VALUES (?,?)";
        try {
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dateString = df.format(date);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, acid);
            ps.setString(2, dateString);
            ps.executeUpdate();
            
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public Account checkLogin(String user, String pass) {
        String sql = "SELECT * FROM endjavaweb.Account where username =? and password=? or email =?and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, user);
            st.setString(4, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getInt("Stt")
                );
                return acc;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Account checkExitsAcc(String user, String email) {
        String sql = "SELECT * FROM endjavaweb.Account where username =? or email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getInt("Stt")
                );
                return acc;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Boolean signup(String user, String pass, String hoten, String diachi, String phone, String email, String roleID, String stt) {
        String query = "INSERT INTO `endjavaweb`.`account`"
                + "(`Username`,"
                + "`Password`,"
                + "`Hoten`,"
                + "`Diachi`,"
                + "`Phone`,"
                + "`Email`,"
                + "`RoleID`,"
                + "`Stt`)"
                + "VALUES"
                + "(?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, hoten);
            ps.setString(4, diachi);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, roleID);
            ps.setString(8, stt);
            ps.executeUpdate();

            return true;

        } catch (Exception e) {

        }
        return false;
    }

    public void createCarts(String user) {
        String sql = "SELECT ID FROM endjavaweb.account WHERE Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            int id;
            if (rs.next()) {
                id = rs.getInt("id");
                String sql1 = "INSERT INTO `endjavaweb`.carts (`AccountID`,`Spvsl`) VALUES (?,?)";
                PreparedStatement ps1 = connection.prepareStatement(sql1);
                ps1.setInt(1, id);
                ps1.setString(2, ",0:0");
                ps1.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    //
    public Account changeInfo(String hoten, String phone, String address, String email, int id, String user, String pass) {
        String sql = "UPDATE `endjavaweb`.`account` SET"
                + "`Hoten` = ?,"
                + "`Diachi` = ?,"
                + "`Phone` = ?,"
                + "`Email` = ?"
                + "WHERE `ID` = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hoten);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setInt(5, id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
        return checkLogin(user, pass);
    }

    public Account getAccbyID(int id) {
        List<Account> list = getALL();
        for (Account ac : list) {
            if (id == ac.getId()) {
                Account acc = ac;
                return acc;
            }
        }
        return null;
    }

    public Boolean changeInfoAdmin(String hoten, String phone, String address, String email, String role, String stt, String id) {
        String sql = "UPDATE `endjavaweb`.`account` SET"
                + "`Hoten` = ?,"
                + "`Diachi` = ?,"
                + "`Phone` = ?,"
                + "`Email` = ?,"
                + "`RoleID` = ?,"
                + "`Stt` = ?"
                + "WHERE `ID` = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hoten);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, role);
            st.setString(6, stt);
            st.setString(7, id);
            st.executeUpdate();
            return true;

        } catch (Exception e) {
        }
        return false;
    }

    public void changePass(String pass, int id) {
        String sql = "UPDATE `endjavaweb`.`account` SET"
                + "`Password` = ?"
                + "WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Boolean deleteAccount(int id) {
        String sql = "DELETE FROM endjavaweb.carts WHERE AccountID = "+id;
        String sql1 = "DELETE FROM endjavaweb.account WHERE ID = "+id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st = connection.prepareStatement(sql1);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
}
