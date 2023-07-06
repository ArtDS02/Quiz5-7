/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionConnectDAO;
import dao.CollectionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;
import model.Question;

/**
 *
 * @author quoct
 */
@WebServlet(name = "testoption", urlPatterns = {"/testoption"})
public class TestOptionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        CollectionConnectDAO dao = new CollectionConnectDAO();
        int so = dao.countNumInCollectionById(id);
//        PrintWriter out = response.getWriter();
//        out.print(so);
        request.setAttribute("so", so);
        request.setAttribute("id", id);
        request.getRequestDispatcher("chooseTestOptionView.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        CollectionConnectDAO dao = new CollectionConnectDAO();
        int num = Integer.parseInt(request.getParameter("num"));
        int id = Integer.parseInt(request.getParameter("id"));

        List<Question> list = dao.getCollectionById(id);
        Collections.shuffle(list);
        List<Question> newList = list.subList(0, num);

        request.setAttribute("list", newList);

        request.getRequestDispatcher("doTestView.jsp").forward(request, response);
    }

}
