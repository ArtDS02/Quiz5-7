/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.QuestionDAO;
import static dao.QuestionDAO.CreateQuestion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Account;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "CreateQuestion", urlPatterns = {"/CreateQuestion"})
public class CreateQuestion extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Detail = request.getParameter("Detail");
        String AnswerA = request.getParameter("AnswerA");
        String AnswerB = request.getParameter("AnswerB");
        String AnswerC = request.getParameter("AnswerC");
        String AnswerD = request.getParameter("AnswerD");
        String TrueAnswer = request.getParameter("TrueAnswer");

        QuestionDAO dao = new QuestionDAO();
        if (Detail.equals("") || TrueAnswer.equals("") || AnswerA.equals("") || AnswerB.equals("") || AnswerC.equals("") || AnswerD.equals("")) {
            response.sendRedirect("CreateQuestion.jsp");
            
        }else {
            dao.CreateQuestion(Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer);
            response.sendRedirect("manageQuestion.jsp");
        }
    }
}
