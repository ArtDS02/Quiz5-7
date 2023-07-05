/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Exam;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "SearchExam", urlPatterns = {"/SearchExam"})
public class SearchExam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("searchName");
        ExamDAO dao = new ExamDAO();
        List<Exam> list = dao.searchListExamsByName(search);
        request.setAttribute("listExam", list);
        request.setAttribute("searchName", search);
        request.getRequestDispatcher("allExamView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        ExamDAO dao = new ExamDAO();
        List<Exam> list = dao.searchListExamsByName(search);
        request.setAttribute("listExam", list);
        request.setAttribute("searchName", search);
        request.getRequestDispatcher("allExamView.jsp").forward(request, response);
    }

}
