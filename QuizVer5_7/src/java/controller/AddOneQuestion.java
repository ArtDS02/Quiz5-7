/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionConnectDAO;
import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "AddOneQuestion", urlPatterns = {"/AddOneQuestion"})
public class AddOneQuestion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CollectionId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("CollectionId", CollectionId);
        request.getRequestDispatcher("addQuestion.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CollectionId = Integer.parseInt(request.getParameter("CollectionId"));
        String Detail = request.getParameter("Detail");
        String AnswerA = request.getParameter("AnswerA");
        String AnswerB = request.getParameter("AnswerB");
        String AnswerC = request.getParameter("AnswerC");
        String AnswerD = request.getParameter("AnswerD");
        String TrueAnswer = request.getParameter("TrueAnswer");

        QuestionDAO dao = new QuestionDAO();
        if (Detail.equals("") || TrueAnswer.equals("") || AnswerA.equals("") || AnswerB.equals("") || AnswerC.equals("") || AnswerD.equals("")) {
            request.setAttribute("idd", CollectionId);
            response.sendRedirect("addQuestion.jsp");
        } else {
            dao.CreateQuestion(Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer);
            
            int last, quesId;
            last = dao.getListQuestions().size() - 1;
            quesId = dao.getListQuestions().get(last).getId();
            CollectionConnectDAO connect = new CollectionConnectDAO();
            connect.addCollectionConnect(CollectionId,quesId);

            int lastPage = dao.lastPagesP(1, CollectionId);
            List<Question> list = dao.getQuestionByID(CollectionId);
            request.setAttribute("list", list);
            request.setAttribute("idd", CollectionId);
            request.getRequestDispatcher("EditOption.jsp").forward(request, response);
        }
    }
}
