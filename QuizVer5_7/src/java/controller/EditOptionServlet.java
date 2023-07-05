package controller;

import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Question;

/**
 *
 * @author Thinh
 */
@WebServlet(name = "EditOptionServlet", urlPatterns = {"/EditOptionServlet"})
public class EditOptionServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO dao = new QuestionDAO();
        int lastPage = dao.lastPagesP(1, id);
        List<Question> list = dao.getQuestionByID(id);
        request.setAttribute("list", list);
        request.setAttribute("idd", id);
        request.getRequestDispatcher("EditOption.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
