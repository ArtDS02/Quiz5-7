/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Question;
import context.DBContext;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quoct
 */
public class QuestionDAO extends DBContext {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public Question getQuestionById(int id) {
        String sql = "Select * From Question Where QuestionId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Question question = new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                return question;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static ArrayList<Question> getListQuestions() {
        try {
            String query = "select * from Question";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Question> list = new ArrayList<>();
            while (rs.next()) {
                Question a = new Question(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
////////////////////////////////////////////////////////

    public static void CreateQuestion(String Detail, String AnswerA, String AnswerB, String AnswerC, String AnswerD, String TrueAnswer) {
        try {
            String query = "INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Detail);
            ps.setString(2, AnswerA);
            ps.setString(3, AnswerB);
            ps.setString(4, AnswerC);
            ps.setString(5, AnswerD);
            ps.setString(6, TrueAnswer);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static Question getQuestion(String id) {
        String query = "select * from Question where QuestionID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Question(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void UpdateQuestion(String Detail, String AnswerA, String AnswerB, String AnswerC, String AnswerD, String TrueAnswer, int Id) {
        try {
            String query = "UPDATE Question SET Detail = ?, AnswerA = ?, AnswerB = ?, AnswerC = ?, AnswerD = ?, TrueAnswer = ? "
                    + "     WHERE QuestionID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Detail);
            ps.setString(2, AnswerA);
            ps.setString(3, AnswerB);
            ps.setString(4, AnswerC);
            ps.setString(5, AnswerD);
            ps.setString(6, TrueAnswer);
            ps.setInt(7, Id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void deleteQuestion(String id) {
        String query = "DELETE FROM CollectionConnect WHERE QuestionID = ?;\n"
                + "DELETE FROM Question WHERE QuestionID = ?;";
        try {
            conn = new DBContext().getConnection();
            System.out.println(conn);
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            ps.setInt(2, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Question getQuestionById2(int id) {
        String sql = "Select * From Question Where QuestionId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Question question = new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                return question;
            }
        } catch (Exception e) {
        }
        return null;
    }

    // Dang dung
    public static List<Question> getQuestionByID(int id) {
        String sql = "Select * From CollectionConnect Join Question On CollectionConnect.QuestionID = Question.QuestionID Where CollectionID = ?";
        List<Question> list = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question(rs.getInt("QuestionID"),
                        rs.getString("Detail"),
                        rs.getString("AnswerA"),
                        rs.getString("AnswerB"),
                        rs.getString("AnswerC"),
                        rs.getString("AnswerD"),
                        rs.getString("TrueAnswer"));
                list.add(question);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Dang dung
    public int lastPagesP(int size, int id) {
        int lastPages = 0;
        String createQuery = "Select count (*) From CollectionConnect Where CollectionID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(createQuery);
            rs = ps.executeQuery();
            ps.setInt(1, id);
            while (rs.next()) {
                int total = rs.getInt(1);
                lastPages = total / size;

                if (total % size != 0) {
                    lastPages++;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return lastPages;
    }

    public static void readFile(String fileName, int collectionId) {
        String query = "INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)\n"
                + "VALUES (?, ?, ?, ?, ?, ?);"
                + "insert into CollectionConnect (CollectionID, QuestionID) values (?, SCOPE_IDENTITY());";
        try ( BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF-8"))) {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            String line;
            String detail = null;
            String answerA = null;
            String answerB = null;
            String answerC = null;
            String answerD = null;
            String trueAnswer = null;
            QuestionDAO dao = new QuestionDAO();
            while ((line = br.readLine()) != null) {
                if (line.equals("-")) {
                    if (detail != null && answerA != null && answerB != null && answerC != null && answerD != null && trueAnswer != null) {
                        ps.setString(1, detail);
                        ps.setString(2, answerA);
                        ps.setString(3, answerB);
                        ps.setString(4, answerC);
                        ps.setString(5, answerD);
                        ps.setString(6, trueAnswer);
                        ps.setInt(7, collectionId);
                        ps.executeUpdate();
                    }
                    System.out.println("tren2");
                    detail = null;
                    answerA = null;
                    answerB = null;
                    answerC = null;
                    answerD = null;
                    trueAnswer = null;
                } else {
                    if (detail == null) {
                        detail = line;
                    } else if (answerA == null) {
                        answerA = line;
                    } else if (answerB == null) {
                        answerB = line;
                    } else if (answerC == null) {
                        answerC = line;
                    } else if (answerD == null) {
                        answerD = line;
                    } else if (trueAnswer == null) {
                        trueAnswer = line;
                    }
                }
            }
            if (detail != null && answerA != null && answerB != null && answerC != null && answerD != null && trueAnswer != null) {
                ps.setString(1, detail);
                ps.setString(2, answerA);
                ps.setString(3, answerB);
                ps.setString(4, answerC);
                ps.setString(5, answerD);
                ps.setString(6, trueAnswer);
                ps.setInt(7, collectionId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
    
    public static Question getQuestionNewest() {
        String sql = "SELECT * FROM Question ORDER BY QuestionID DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Question question = new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                return question;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void connectQuestion(int cid, int qid ) {
        String sql = "Insert into CollectionConnect Values (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, qid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
//        readFile("C:\\Users\\Thinh\\Desktop\\ABC.txt", 1);
//            CreateQuestion("Mai mốt", "Mai mốt", "Mai mốt", "Mai mốt", "Mai mốt", "Mai mốt");
//        System.out.println(getQuestionByID(1));
         System.out.println(getQuestionNewest());
    }

}
