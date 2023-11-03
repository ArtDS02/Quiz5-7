/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.Session;
import model.Account;
import model.Collection;

/**
 *
 * @author quoct
 */
@WebServlet(name = "NewCourseServlet", urlPatterns = {"/newcourse"})
public class NewCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        int status = Integer.parseInt(request.getParameter("status"));
        Account acc = (Account) request.getSession().getAttribute("accountS");
        int id = acc.getId();

        CollectionDAO dao = new CollectionDAO();
        dao.createCollection(name, status, id);
        
        Collection collection = dao.getCollectionNewest();
        
        request.setAttribute("collection", collection);
        request.getRequestDispatcher("addQuestionView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
