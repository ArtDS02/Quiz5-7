/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "EditQuestion", urlPatterns = {"/EditQuestion"})
public class EditQuestion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        QuestionDAO dao = new QuestionDAO();
        Question s = dao.getQuestion(id);
        request.setAttribute("st", s);
        request.getRequestDispatcher("UpdateQuestion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        QuestionDAO dao = new QuestionDAO();
        String Detail = request.getParameter("Detail");
        String AnswerA = request.getParameter("AnswerA");
        String AnswerB = request.getParameter("AnswerB");
        String AnswerC = request.getParameter("AnswerC");
        String AnswerD = request.getParameter("AnswerD");
        String TrueAnswer = request.getParameter("TrueAnswer");
        if (Detail.equals("") || TrueAnswer.equals("") || AnswerA.equals("") || AnswerB.equals("") || AnswerC.equals("") || AnswerD.equals("")) {
            response.sendRedirect("UpdateQuestion.jsp");
//                    response.sendRedirect("manageQuestion.jsp");
        } else {
            dao.UpdateQuestion(Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, Integer.parseInt(id.substring(1)));
            response.sendRedirect("manageQuestion.jsp");
        }
    }

}
