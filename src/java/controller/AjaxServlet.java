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
import java.util.List;
import model.Book;

/**
 *
 * @author Gen 5
 */
@WebServlet(name = "AjaxServlet", urlPatterns = {"/ajax"})
public class AjaxServlet extends HttpServlet {

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

        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txtSearch");
        BookDAO dao = new BookDAO();
        List<Book> list = dao.getSearchHomePages(txtSearch);
        PrintWriter out = response.getWriter();
        for (Book o : list) {
            out.println("<div style=\"margin-bottom: 5%;\" class=\"col-6 col-md-4 col-lg-3\">\n"
                    + "                                <a href=\"product?id="+o.getId()+"\">\n"
                    + "                                    <div class=\"card border border-secondary h-100\">\n"
                    + "                                        <!-- Sale badge-->\n"
                    + "                                        <c:if test=\""+o.getSoluong()+" <=2}\">\n"
                    + "                                            <div class=\"badge bg-dark text-white position-absolute\" style=\"top: 0.5rem; left:  0.5rem\">Hết hàng</div>\n"
                    + "                                        </c:if>\n"
                    + "                                        <c:if test=\""+o.getStt()+" ==3}\">\n"
                    + "                                            <div class=\"badge bg-dark text-white position-absolute\" style=\"top: 0.5rem; left:  0.5rem\">Đặt trước</div>\n"
                    + "                                        </c:if>\n"
                    + "                                        <div class=\"badge bg-dark text-white position-absolute\" style=\"top: 0.5rem; right: 0.5rem\">-"+o.getGiamgia()+"%</div>\n"
                    + "                                        <!-- Product image-->\n"
                    + "                                        <img style=\"height: 260px; object-fit: scale-down\" class=\"card-img-top\" src=\""+o.getImg()+"\" alt=\"...\" />\n"
                    + "                                        <!-- Product details-->\n"
                    + "                                        <div class=\"card-body p-4\">\n"
                    + "                                            <div class=\"text-center\">\n"
                    + "                                                <!-- Product name-->\n"
                    + "                                                <h5 style=\"display: -webkit-box;\n"
                    + "                                                    -webkit-line-clamp: 2;\n"
                    + "                                                    -webkit-box-orient: vertical;\n"
                    + "                                                    overflow: hidden;\" class=\"fw-bolder\">"+o.getTensach()+"</h5>\n"
           
                    + "\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                </a>\n"
                    + "                            </div>");
        }

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
