/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Collection;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "UpdateCollection", urlPatterns = {"/UpdateCollection"})
public class UpdateCollection extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        CollectionDAO dao = new CollectionDAO();
        Collection s = dao.getCollectionById(Integer.parseInt(id));
        request.setAttribute("st", s);
        request.getRequestDispatcher("UpdateCollection.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        String Author = request.getParameter("Author");

        if (name.equals("") || status.equals("") || Author.equals("")) {
            CollectionDAO dao = new CollectionDAO();
            Collection s = dao.getCollectionById(Integer.parseInt(id));
            request.setAttribute("st", s);
            response.sendRedirect("UpdateCollection.jsp");
        } else {
            CollectionDAO dao = new CollectionDAO();
            dao.UpdateCollection(Integer.parseInt(id), name, Integer.parseInt(status), Integer.parseInt(Author));
            response.sendRedirect("manageCollection.jsp");
        }
    }

}
