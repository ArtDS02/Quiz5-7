/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionDAO;
import dao.QuestionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Question;

/**
 *
 * @author W
 */
@WebServlet(name = "QuestionList", urlPatterns = {"/QuestionList"})
public class QuestionList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("id"));
        CollectionDAO col = new CollectionDAO();
        int owner = col.getCollectionById(1).getAccountID().getId();
        QuestionDAO dao = new QuestionDAO();
        int lastPage = dao.lastPagesP(1, id);
        List<Question> list = dao.getQuestionByID(id);
        request.setAttribute("list", list);
        request.setAttribute("owner", owner);
        request.setAttribute("idd", id);

        request.setAttribute("lastPage", lastPage);
        request.getRequestDispatcher("questionList.jsp").forward(request, response);
    }
}
