/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.QuestionDAO;
import java.util.HashMap;
import java.util.Map;
import model.Question;

/**
 *
 * @author quoct
 */
public class QuestionService {

    public Map<Question, String> list(Map<Integer, String> results) {
        Map<Question, String> list = new HashMap<>();

        for (Map.Entry<Integer, String> entry : results.entrySet()) {

            int key = entry.getKey();
            String value = entry.getValue();

            String x = "";

            QuestionDAO dao = new QuestionDAO();
            Question question = dao.getQuestionById(key);

            if (!question.getTrueAnswer().equalsIgnoreCase(value)) {
                x = value;
            }

            list.put(question, x);
        }

        return list;
    }
    
    public int countFalseAnswers(Map<Integer, String> results) {
        int count = 0;
        for (Map.Entry<Integer, String> entry : results.entrySet()) {

            int key = entry.getKey();
            String value = entry.getValue();


            QuestionDAO dao = new QuestionDAO();
            Question question = dao.getQuestionById(key);

            if (!question.getTrueAnswer().equalsIgnoreCase(value)) {
                count +=1;
            }

        }

        return count;
    }

}
