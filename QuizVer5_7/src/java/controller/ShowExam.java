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
@WebServlet(name = "ShowExam", urlPatterns = {"/ShowExam"})
public class ShowExam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ExamDAO dao = new ExamDAO();
        List<Exam> list = dao.getListExams();
        request.setAttribute("listExam", list);
        request.getRequestDispatcher("allExamView.jsp").forward(request, response);
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
                List<Exam> list1 = examDao.getListExamById(AccountId);
                request.setAttribute("listExam", list1);
                request.getRequestDispatcher("myExams.jsp").forward(request, response);
            } else {
                int cid = Integer.parseInt(request.getParameter("CollectionId"));
                request.setAttribute("collectionId", cid);
                request.getRequestDispatcher("ExamSetting.jsp").forward(request, response);
                response.sendRedirect("ExamSetting.jsp");
            }
        } else {
            // khong la so
            int id = Integer.parseInt(request.getParameter("CollectionId"));
            request.setAttribute("collectionId", id);
            request.getRequestDispatcher("ExamSetting.jsp").forward(request, response);
        }

    }

}
