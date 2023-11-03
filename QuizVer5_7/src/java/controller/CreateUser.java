/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "CreateUser", urlPatterns = {"/CreateUser"})
public class CreateUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the doPost method
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String repass = request.getParameter("repass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String DOB = request.getParameter("DOB");
        String Role = request.getParameter("Role");

        if (FirstName.equals("") || LastName.equals("") || Password.equals("") || repass.equals("") || phone.equals("") || email.equals("") || DOB.equals("") || Role.equals("")) {
            response.sendRedirect("CreateUser.jsp");
        } else if (!Password.equals(repass)) {
            response.sendRedirect("CreateUser.jsp");
        } else {
            AccountDAO dao = new AccountDAO();
            Account a = dao.checkAccountExist(UserName);
            if (a == null) {
                dao.register(FirstName, LastName, UserName, Password, phone, email, DOB, Integer.parseInt(Role));
                response.sendRedirect("manageUser.jsp");
            } else {
                response.sendRedirect("CreateUser.jsp");
            }
        }
    }
}
