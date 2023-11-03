/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "AddFile", urlPatterns = {"/AddFile"})
public class AddFile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CollectionId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("CollectionId", CollectionId);
        request.getRequestDispatcher("test.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int CollectionId = Integer.parseInt(request.getParameter("CollectionId"));
        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
     
        String fileName = request.getParameter("upload");
    
        QuestionDAO.readFile("C:\\Users\\Thinh\\Desktop\\" + fileName, CollectionId);
        
        QuestionDAO dao = new QuestionDAO();
        int lastPage = dao.lastPagesP(1, CollectionId);
        List<Question> list = dao.getQuestionByID(CollectionId);
        request.setAttribute("list", list);
        request.setAttribute("idd", CollectionId);
        request.getRequestDispatcher("EditOption.jsp").forward(request, response);
    }
}
