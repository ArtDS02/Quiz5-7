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
import java.util.Collections;
import java.util.List;
import model.Exam;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "examJoin", urlPatterns = {"/examJoin"})
public class examJoin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("ExamId", id);
        request.getRequestDispatcher("JoinExam.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ExamId = Integer.parseInt(request.getParameter("ExamId"));
        String pass = request.getParameter("pass");
        ExamDAO examDao = new ExamDAO();
        Exam exam = examDao.getExamById(ExamId);
        if (examDao.getExamById(ExamId).getPassword().equals(pass)) {
            CollectionConnectDAO collectionDao = new CollectionConnectDAO();
            List<Question> list = collectionDao.getCollectionById(exam.getCollectionId());
            Collections.shuffle(list);
            List<Question> newList = list.subList(0, exam.getQuestionNumber());
            request.setAttribute("list", newList);
            request.setAttribute("time", exam.getTimeLimit());
            request.setAttribute("numberQuestion", exam.getQuestionNumber());
            request.setAttribute("ExamId", ExamId);
            request.getRequestDispatcher("ShowExam.jsp").forward(request, response);
        }
        else {
            request.setAttribute("ExamId", ExamId);
            request.setAttribute("message", "Password incorrect");
            request.getRequestDispatcher("JoinExam.jsp").forward(request, response);
        }
    }

}
