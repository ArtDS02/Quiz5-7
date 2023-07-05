/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "Update", urlPatterns = {"/Update"})
public class Update extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        switch (id.charAt(0)) {
            case 'a': {
                AccountDAO dao = new AccountDAO();
                Account s = dao.getAccount(id.substring(1));
                if (dao.getAccount(id.substring(1)).getRole() >= 0) {
                    request.setAttribute("st", s);
                    request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
                }
                response.sendRedirect("manageUser.jsp");

                break;
            }
            case 'q': {
                QuestionDAO dao = new QuestionDAO();
                Question s = dao.getQuestion(id.substring(1));
                request.setAttribute("st", s);
                request.getRequestDispatcher("EditQuestion.jsp").forward(request, response);
                break;
            }
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        switch (id.charAt(0)) {
            case 'a': {
                String userName = request.getParameter("UserName");
                AccountDAO dao = new AccountDAO();
                if (dao.checkName(userName.trim()) == 0) {
                    String firstName = request.getParameter("FirstName");
                    String lastName = request.getParameter("LastName");
                    String password = request.getParameter("Password");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String dob = request.getParameter("DOB");
                    String role = request.getParameter("Role");
                    if (firstName.equals("") || lastName.equals("") || password.equals("") || phone.equals("") || email.equals("") || dob.equals("") || role == null) {
                        request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
                    } else {
                        dao.updateAccount(Integer.parseInt(id.substring(1)), firstName, lastName, userName, password, phone, email, dob, Integer.parseInt(role));
                        response.sendRedirect("manageUser.jsp");
                    }
                } else {
                    request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);
                }
                break;
            }
            case 'q': {
                QuestionDAO dao = new QuestionDAO();
                String detail = request.getParameter("Detail");
                String answerA = request.getParameter("AnswerA");
                String answerB = request.getParameter("AnswerB");
                String answerC = request.getParameter("AnswerC");
                String answerD = request.getParameter("AnswerD");
                String trueAnswer = request.getParameter("TrueAnswer");
                if (detail.equals("") || trueAnswer.equals("") || answerA.equals("") || answerB.equals("") || answerC.equals("") || answerD.equals("")) {
                    response.sendRedirect("UpdateQuestion.jsp");
                } else {
                    String numericId = id.replaceAll("[^0-9]", "");
                    int questionId = Integer.parseInt(numericId);
                    dao.UpdateQuestion(detail, answerA, answerB, answerC, answerD, trueAnswer, questionId);
                    response.sendRedirect("manageQuestion.jsp");
                }
                break;
            }
            case 'e': {
                QuestionDAO dao = new QuestionDAO();
                String detail = request.getParameter("Detail");
                String answerA = request.getParameter("AnswerA");
                String answerB = request.getParameter("AnswerB");
                String answerC = request.getParameter("AnswerC");
                String answerD = request.getParameter("AnswerD");
                String trueAnswer = request.getParameter("TrueAnswer");
                if (detail.equals("") || trueAnswer.equals("") || answerA.equals("") || answerB.equals("") || answerC.equals("") || answerD.equals("")) {
                    response.sendRedirect("UpdateQuestion.jsp");
                } else {
                    String numericId = id.replaceAll("[^0-9]", "");
                    int questionId = Integer.parseInt(numericId);
                    dao.UpdateQuestion(detail, answerA, answerB, answerC, answerD, trueAnswer, questionId);
                    response.sendRedirect("home.jsp");
                }
                break;
            }
            default:
                break;
        }
    }

}
