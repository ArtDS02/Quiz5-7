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

/**
 *
 * @author Thinh
 */
@WebServlet(name = "CreateUser", urlPatterns = {"/CreateCollection"})
public class CreateCollection extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the doPost method
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        String Author = request.getParameter("Author");

        if (name.equals("") || status.equals("") || Author.equals("")) {
            response.sendRedirect("CreateCollection.jsp");
        } else {
            CollectionDAO dao = new CollectionDAO();
            dao.createCollection(name, Integer.parseInt(status), Integer.parseInt(Author));
            response.sendRedirect("manageCollection.jsp");
        }
    }
}
