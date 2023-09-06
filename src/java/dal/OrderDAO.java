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
import model.MethodPayment;
import model.OrderCart;
import model.OrderStatus;
import model.Order_Detail;

/**
 *
 * @author ThinkPad X1 G4
 */
public class OrderDAO extends DBcontext {

    public List<OrderCart> getAllOrderForAdmin() {
        List<OrderCart> listorder = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.ordercart ORDER BY Thoigian DESC ";
        WebDAO wdao = new WebDAO();
        List<MethodPayment> listmethod = wdao.getMethod();
        MethodPayment method = new MethodPayment();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderCart orderCart = new OrderCart();
                orderCart.setID(rs.getInt("ID"));
                orderCart.setHoten(rs.getString("Hoten"));
                orderCart.setPhone(rs.getString("Phone"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                orderCart.setAccount(ac);
                orderCart.setTotal(rs.getDouble("Total"));
                orderCart.setStatus(getOrderStatus(rs.getInt("Stt")));
                orderCart.setDiachi(rs.getString("Diachi"));
                orderCart.setGiamgia(rs.getDouble("Giamgia"));
                orderCart.setThoigian(rs.getString("Thoigian"));
                orderCart.setEmail(rs.getString("Email"));
                for (MethodPayment methodPayment : listmethod) {
                    if (rs.getInt("Method") == methodPayment.getId()) {
                        method = methodPayment;
                    }
                }
                orderCart.setMethod(method);
                orderCart.setTotalFirst(rs.getDouble("TotalFirst"));
                orderCart.setPhiship(rs.getDouble("Phiship"));
                listorder.add(orderCart);
            }
            return listorder;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<OrderCart> getOrderBySTT() {
        List<OrderCart> listorder = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.ordercart where stt = 1";
        WebDAO wdao = new WebDAO();
        List<MethodPayment> listmethod = wdao.getMethod();
        MethodPayment method = new MethodPayment();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderCart orderCart = new OrderCart();
                orderCart.setID(rs.getInt("ID"));
                orderCart.setHoten(rs.getString("Hoten"));
                orderCart.setPhone(rs.getString("Phone"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                orderCart.setAccount(ac);
                orderCart.setTotal(rs.getDouble("Total"));
                orderCart.setStatus(getOrderStatus(rs.getInt("Stt")));
                orderCart.setDiachi(rs.getString("Diachi"));
                orderCart.setGiamgia(rs.getDouble("Giamgia"));
                orderCart.setThoigian(rs.getString("Thoigian"));
                orderCart.setEmail(rs.getString("Email"));
                for (MethodPayment methodPayment : listmethod) {
                    if (rs.getInt("Method") == methodPayment.getId()) {
                        method = methodPayment;
                    }
                }
                orderCart.setMethod(method);
                orderCart.setTotalFirst(rs.getDouble("TotalFirst"));
                orderCart.setPhiship(rs.getDouble("Phiship"));
                listorder.add(orderCart);
            }
            return listorder;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<OrderCart> getTotalCart() {
        List<OrderCart> listorder = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.ordercart where stt = 4";
        WebDAO wdao = new WebDAO();
        List<MethodPayment> listmethod = wdao.getMethod();
        MethodPayment method = new MethodPayment();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderCart orderCart = new OrderCart();
                orderCart.setID(rs.getInt("ID"));
                orderCart.setHoten(rs.getString("Hoten"));
                orderCart.setPhone(rs.getString("Phone"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                orderCart.setAccount(ac);
                orderCart.setTotal(rs.getDouble("Total"));
                orderCart.setStatus(getOrderStatus(rs.getInt("Stt")));
                orderCart.setDiachi(rs.getString("Diachi"));
                orderCart.setGiamgia(rs.getDouble("Giamgia"));
                orderCart.setThoigian(rs.getString("Thoigian"));
                orderCart.setEmail(rs.getString("Email"));
                for (MethodPayment methodPayment : listmethod) {
                    if (rs.getInt("Method") == methodPayment.getId()) {
                        method = methodPayment;
                    }
                }
                orderCart.setMethod(method);
                orderCart.setTotalFirst(rs.getDouble("TotalFirst"));
                orderCart.setPhiship(rs.getDouble("Phiship"));
                listorder.add(orderCart);
            }
            return listorder;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<OrderCart> getAllOrderOfUser(int id) {
        List<OrderCart> listorder = getAllOrderForAdmin();
        List<OrderCart> listorderUser = new ArrayList<>();
        for (OrderCart orderCart : listorder) {
            if (id == orderCart.getAccount().getId()) {
                listorderUser.add(orderCart);
            }
        }
        return listorderUser;
    }

    public OrderCart getOrderByID(int orderid) {
        List<OrderCart> listorder = getAllOrderForAdmin();
        for (OrderCart orderCart : listorder) {
            if (orderid == orderCart.getID()) {
                return orderCart;
            }
        }
        return null;
    }

    public List<Order_Detail> getOrderDetailForID(int orderid) {
        List<Order_Detail> listdetail = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.order_detail where OrderID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order_Detail detail = new Order_Detail(rs.getInt("ID"),
                        rs.getInt("OrderID"),
                        rs.getString("Tensach"),
                        rs.getInt("Soluong"),
                        rs.getDouble("Thanhtien"),
                        rs.getDouble("Giaban"));
                listdetail.add(detail);
            }
            return listdetail;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Order_Detail> getOrderDetailForUser(int orderid, int accid) {
        List<Order_Detail> listdetail = new ArrayList<>();
        String sql = "SELECT endjavaweb.order_detail.ID,OrderID,Tensach,Giaban,Soluong,Thanhtien FROM  endjavaweb.order_detail inner join endjavaweb.ordercart on  endjavaweb.order_detail.OrderID = endjavaweb.ordercart.ID\n"
                + "where endjavaweb.ordercart.ID = ? and endjavaweb.ordercart.AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.setInt(2, accid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order_Detail detail = new Order_Detail(rs.getInt("ID"),
                        rs.getInt("OrderID"),
                        rs.getString("Tensach"),
                        rs.getInt("Soluong"),
                        rs.getDouble("Thanhtien"),
                        rs.getDouble("Giaban"));
                listdetail.add(detail);
            }
            return listdetail;
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean doCheckout(String hoten, String phone, int accId, double total, String diachi, double giamgia, String thoigian, String email, int method, double totalfirst, double phiship) {
        String sql = "INSERT INTO endjavaweb.ordercart "
                + "(Hoten, Phone, AccountID, Total, Stt, Diachi, Giamgia, Thoigian, Email, Method, TotalFirst,Phiship) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hoten);
            st.setString(2, phone);
            st.setInt(3, accId);
            st.setDouble(4, total);
            st.setString(5, "1");
            st.setString(6, diachi);
            st.setDouble(7, giamgia);
            st.setString(8, thoigian);
            st.setString(9, email);
            st.setInt(10, method);
            st.setDouble(11, totalfirst);
            st.setDouble(12, phiship);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {

        }
        return false;
    }

    public void insetOrderDetail(int orderid, String tensach, int soluong, double thanhtien) {
        String sql = "INSERT INTO `endjavaweb`.`order_detail` (`OrderID`, `Tensach`,`Soluong`,`Thanhtien`,`Giaban`)"
                + "VALUES (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.setString(2, tensach);
            st.setInt(3, soluong);
            st.setDouble(4, thanhtien);
            st.setDouble(5, (thanhtien / soluong));
            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public int getOrderID(int accId, String thoigian) {
        String sql = "SELECT ID FROM endjavaweb.ordercart where AccountID =? and Thoigian =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accId);
            st.setString(2, thoigian);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("ID");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> listorderStatus = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.order_status";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderStatus status = new OrderStatus(rs.getInt("ID"), rs.getString("des_status"));
                listorderStatus.add(status);
            }
        } catch (Exception e) {
        }
        return listorderStatus;
    }

    public OrderStatus getOrderStatus(int id) {
        List<OrderStatus> listorderStatus = getAllOrderStatus();
        for (OrderStatus orderStatu : listorderStatus) {
            if (id == orderStatu.getID()) {
                return orderStatu;
            }
        }
        return null;
    }

    public Boolean UpdateOrder(int stt, int id) {
        String sql = "UPDATE `endjavaweb`.`ordercart` SET `Stt` = '?' WHERE (`ID` = '?')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stt);
            st.setInt(2, id);
            st.executeUpdate();

            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public Boolean CancelOrder(int id) {
        String sql = "UPDATE `endjavaweb`.`ordercart` SET `Stt` = 7 WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<OrderCart> getALLDoanhThu(String date1, String date2) {
        List<OrderCart> listorder = new ArrayList<>();
        String sql = "SELECT * FROM endjavaweb.ordercart where thoigian between ? and ?";
        WebDAO wdao = new WebDAO();
        List<MethodPayment> listmethod = wdao.getMethod();
        MethodPayment method = new MethodPayment();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date1);
            st.setString(2, date2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderCart orderCart = new OrderCart();
                orderCart.setID(rs.getInt("ID"));
                orderCart.setHoten(rs.getString("Hoten"));
                orderCart.setPhone(rs.getString("Phone"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                orderCart.setAccount(ac);
                orderCart.setTotal(rs.getDouble("Total"));
                orderCart.setStatus(getOrderStatus(rs.getInt("Stt")));
                orderCart.setDiachi(rs.getString("Diachi"));
                orderCart.setGiamgia(rs.getDouble("Giamgia"));
                orderCart.setThoigian(rs.getString("Thoigian"));
                orderCart.setEmail(rs.getString("Email"));
                for (MethodPayment methodPayment : listmethod) {
                    if (rs.getInt("Method") == methodPayment.getId()) {
                        method = methodPayment;
                    }
                }
                orderCart.setMethod(method);
                orderCart.setTotalFirst(rs.getDouble("TotalFirst"));
                orderCart.setPhiship(rs.getDouble("Phiship"));
                listorder.add(orderCart);
            }
            return listorder;
        } catch (SQLException e) {
        }
        return null;
    }
}
