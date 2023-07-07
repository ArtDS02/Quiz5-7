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
@WebServlet(name = "CreateExam", urlPatterns = {"/CreateExam"})
public class CreateExam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("timeLimit").matches("\\d+") && request.getParameter("questionNumber").matches("\\d+") && request.getParameter("AccountId").matches("\\d+") && request.getParameter("CollectionId").matches("\\d+")) {
            // la so
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
                examDao.createExam(name, password, timeLimit, date, questionNumber, AccountId, CollectionId);
                response.sendRedirect("manageExam.jsp");
            } else {
                response.sendRedirect("CreateExam.jsp");
            }
        } else {
            //khong la so
            response.sendRedirect("CreateExam.jsp");
        }

    }

}
