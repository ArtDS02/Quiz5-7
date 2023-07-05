/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author W
 */
@WebServlet(name = "changepassServlet", urlPatterns = {"/changepassServlet"})
public class changepassServlet extends HttpServlet {

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
            out.println("<title>Servlet changepassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changepassServlet at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        //processRequest(request, response);
        String username = request.getParameter(("username"));
        String oldpass = request.getParameter(("oldpass"));
        String newpass = request.getParameter(("newpass"));
        String renewpass = request.getParameter("re-newpass");
        AccountDAO dao = new AccountDAO();
        Account a = dao.checkAccountExist(username);
        Account b = dao.checkOldpass(oldpass, username);

        if (a == null) {
            request.setAttribute("err", "Account does not exist");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (b != null && newpass.equals(renewpass) && !newpass.equals(oldpass)) {
            dao.changepass(newpass, username);
            response.sendRedirect("login.jsp");
        } else if (!newpass.equals(renewpass) && b != null) {
            request.setAttribute("err", "Password authentication is not correct");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (newpass.equals(oldpass) && b != null) {
            request.setAttribute("err", "The new password matches the old password.");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        }

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
