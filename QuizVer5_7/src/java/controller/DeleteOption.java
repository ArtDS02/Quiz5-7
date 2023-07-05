/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import static dao.AccountDAO.getAccount;
import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "DeleteOption", urlPatterns = {"/DeleteOption"})
public class DeleteOption extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String[] split = id.split("o");
        QuestionDAO dao = new QuestionDAO();
        dao.deleteQuestion(split[0].trim());
        List<Question> list = dao.getQuestionByID(Integer.parseInt(split[1].trim()));
        request.setAttribute("idd", split[1].trim());
        request.setAttribute("list", list);
        request.getRequestDispatcher("EditOption.jsp").forward(request, response);
    }
}
