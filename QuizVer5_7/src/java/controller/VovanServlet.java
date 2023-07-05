/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Question;

/**
 *
 * @author quoct
 */
@WebServlet(name = "VovanServlet", urlPatterns = {"/vovan"})
public class VovanServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cauhoi = request.getParameter("ch");
        String a = request.getParameter("a");
        String b = request.getParameter("b");
        String c = request.getParameter("c");
        String d = request.getParameter("d");
        String da = request.getParameter(("da"));
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO dao = new QuestionDAO();
        CollectionDAO Cdao = new CollectionDAO();
        
        dao.CreateQuestion(cauhoi, a, b, c, d, da);
        int qid = dao.getQuestionNewest().getId();
        dao.connectQuestion(id, qid);
        
        List<Question> list = dao.getQuestionByID(id);
        
        request.setAttribute("list", list);
        request.setAttribute("collection", Cdao.getCollectionById(id));
        request.getRequestDispatcher("addQuestionView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
