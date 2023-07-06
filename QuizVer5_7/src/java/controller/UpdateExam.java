/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CollectionConnectDAO;
import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Exam;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "UpdateExam", urlPatterns = {"/UpdateExam"})
public class UpdateExam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        ExamDAO dao = new ExamDAO();
        Exam a = dao.getExamById(Integer.parseInt(id));
        request.setAttribute("exam", a);
        request.getRequestDispatcher("UpdateExam.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int timeLimit = Integer.parseInt(request.getParameter("timeLimit"));
        String date = request.getParameter("date");
        int questionNumber = Integer.parseInt(request.getParameter("questionNumber"));
        int AccountId = Integer.parseInt(request.getParameter("AccountId"));
        int CollectionId = Integer.parseInt(request.getParameter("CollectionId"));
        ExamDAO examDao = new ExamDAO();
        CollectionConnectDAO collectionDao = new CollectionConnectDAO();
        List<Question> list = collectionDao.getCollectionById(CollectionId);
        if (questionNumber <= list.size()) {
            examDao.UpdateExam(id, name, password, timeLimit, date, questionNumber, AccountId, CollectionId);
            response.sendRedirect("manageExam.jsp");
        } else {
            response.sendRedirect("UpdateExam.jsp");
            
        }
    }

}
