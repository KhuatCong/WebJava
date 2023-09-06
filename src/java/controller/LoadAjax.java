/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Book;

/**
 *
 * @author Gen 5
 */
@WebServlet(name = "LoadAjax", urlPatterns = {"/load"})
public class LoadAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        BookDAO dao = new BookDAO();
        String action = request.getParameter("action");
        String type = request.getParameter("type");
        if (type.equals("all")) {
            switch (action) {
                case "new":
                    List<Book> list1 = dao.getALL();
                    session.setAttribute("listBook", list1);
                    break;
                case "most":
                    List<Book> list2 = dao.sapxepBanChayNhat();
                    session.setAttribute("listBook", list2);
                    break;
                case "asc":
                    List<Book> list3 = dao.sapxepTangDan();
                    session.setAttribute("listBook", list3);
                    break;
                case "desc":
                    List<Book> list4 = dao.sapxepGiamDan();
                    session.setAttribute("listBook", list4);
                    break;
            }
        } else {
            String idString = request.getParameter("id");
            int id = Integer.parseInt(idString);

            switch (action) {
                case "new":
                    List<Book> list1 = dao.getALLNew(id);
                    session.setAttribute("listBook", list1);
                    break;
                case "most":
                    List<Book> list2 = dao.sapxepBanChayNhat(id);
                    session.setAttribute("listBook", list2);
                    break;
                case "asc":
                    List<Book> list3 = dao.sapxepTangDan(id);
                    session.setAttribute("listBook", list3);
                    break;
                case "desc":
                    List<Book> list4 = dao.sapxepGiamDan(id);
                    session.setAttribute("listBook", list4);
                    break;
            }
        }

        request.getRequestDispatcher("collection.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
