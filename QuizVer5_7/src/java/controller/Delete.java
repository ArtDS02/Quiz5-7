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

/**
 *
 * @author Thinh
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        switch (id.charAt(0)) {
            case 'a': {
                AccountDAO dao = new AccountDAO();
                if (dao.getAccount(id.substring(1)).getRole() >= 0) {
                    dao.deleteAccount(id.substring(1));
                }
                response.sendRedirect("manageUser.jsp");
                break;
            }
            case 'q': {
                QuestionDAO dao = new QuestionDAO();
                dao.deleteQuestion(id.substring(1));
                response.sendRedirect("manageQuestion.jsp");
                break;
            }
            case 'o': {
                QuestionDAO dao = new QuestionDAO();
                dao.deleteQuestion(id.substring(1));
//                String[] split = id.split("o");
                request.setAttribute("id", "2");
                request.getRequestDispatcher("EditOptionServlet").forward(request, response);
//                response.sendRedirect("EditOptionServlet");
                break;
            }
            default:
                break;
        }
    }
}
