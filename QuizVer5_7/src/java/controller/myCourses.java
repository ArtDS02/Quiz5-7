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
import java.util.List;
import model.Collection;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "myCourses", urlPatterns = {"/myCourses"})
public class myCourses extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CollectionId = Integer.parseInt(request.getParameter("id"));
        CollectionDAO dao = new CollectionDAO();
        List<Collection> list = dao.getCollectionByAccountId(CollectionId);

        request.setAttribute("listCollectionDetail", list);
        request.getRequestDispatcher("myCourses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
