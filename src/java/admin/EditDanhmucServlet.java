/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Category;

/**
 *
 * @author Gen 5
 */
@WebServlet(name = "EditDanhmucServlet", urlPatterns = {"/edit-danhmuc"})
public class EditDanhmucServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditDanhmucServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDanhmucServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String action = request.getParameter("action");
        if ("add".equals(action)) {

        } else {
            String idString = request.getParameter("idct");
            try {
                int id = Integer.parseInt(idString);
                CategoryDAO dao = new CategoryDAO();
                Category ct = dao.getCategoryByID(id);
                request.setAttribute("ct", ct);
            } catch (Exception e) {
            }
        }
        request.setAttribute("idcheck", action);
        request.getRequestDispatcher("edit-danhmuc.jsp").forward(request, response);
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
        String idcheck = request.getParameter("idcheck");
        String id_raw = request.getParameter("id");
        String tenloai = request.getParameter("tenloai");
        CategoryDAO dao = new CategoryDAO();

        if ("add".equals(idcheck)) {
            Category ctt = dao.checkExitsCate(tenloai);
            if (ctt == null) {
                dao.createCate(tenloai);
                response.sendRedirect("tbl-danhmuc");
            } else {
                String noti = "Danh mục này đã tồn tại!";
                HttpSession session = request.getSession();
                session.setAttribute("notifi", noti);
                response.sendRedirect("edit-danhmuc?action=add");
            }
        } else {
            int id = Integer.parseInt(id_raw);
            Boolean b = dao.ChangeCate(id, tenloai);
        }
        response.sendRedirect("tbl-danhmuc");
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
