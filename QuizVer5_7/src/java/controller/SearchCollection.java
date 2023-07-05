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
@WebServlet(name = "SearchCollection", urlPatterns = {"/SearchCollection"})
public class SearchCollection extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        CollectionDAO dao = new CollectionDAO();
        List<Collection> list = dao.SearchAllCollectionByName(search);

        request.setAttribute("listCollectionDetail", list);
        request.setAttribute("searchName", search);
        request.getRequestDispatcher("allCollectionView.jsp").forward(request, response);
        
    }

}
