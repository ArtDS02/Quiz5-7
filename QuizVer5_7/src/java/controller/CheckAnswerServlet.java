/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.EnrollDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import model.Question;
import service.QuestionService;

/**
 *
 * @author quoct
 */
@WebServlet(name = "CheckAnswerServlet", urlPatterns = {"/checkanswer"})
public class CheckAnswerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = request.getParameter("allID");
        PrintWriter out = response.getWriter();

        String listID[] = a.trim().split(" ");
        Map<Integer, String> results = new HashMap<>();

        for (String string : listID) {
            results.put(Integer.parseInt(string), request.getParameter(string));
        }
        QuestionService q = new QuestionService();

        Map<Question, String> list = q.list(results);
        request.setAttribute("list", list);
        request.getRequestDispatcher("testResultView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = request.getParameter("allID");
        String num = request.getParameter("numberQuestion");
        int ExamId = Integer.parseInt(request.getParameter("ExamId"));
        int AccountId = Integer.parseInt(request.getParameter("AccountId"));
        int numberQuestion = Integer.parseInt(num.trim());

        PrintWriter out = response.getWriter();

        String listID[] = a.trim().split(" ");
        Map<Integer, String> results = new HashMap<>();

        for (String string : listID) {
            results.put(Integer.parseInt(string), request.getParameter(string));
        }
        QuestionService q = new QuestionService();

        Map<Question, String> list = q.list(results);
        double score = Math.round((numberQuestion - q.countFalseAnswers(results)) / (numberQuestion*1.00) * 100.00) / 10.00;
        EnrollDAO enroll = new EnrollDAO();
        enroll.addEnroll(AccountId, ExamId, score);
        request.setAttribute("score", score);
        request.setAttribute("list", list);
        request.getRequestDispatcher("ExamResultView.jsp").forward(request, response);
    }
}
