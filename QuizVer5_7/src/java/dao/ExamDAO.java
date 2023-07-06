/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Exam;

/**
 *
 * @author Thinh
 */
public class ExamDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public static ArrayList<Exam> getListExams() {
        try {
            String query = "select * from Exam";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Exam> list = new ArrayList<>();
            while (rs.next()) {
                Exam a = new Exam(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static ArrayList<Exam> getListExamById(int AccountId) {
        String sql = "Select * From Exam Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, AccountId);
            rs = ps.executeQuery();
            ArrayList<Exam> list = new ArrayList<>();
            while (rs.next()) {
                Exam a = new Exam(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public static void createExam(String name, String password, int timeLimit, String date, int questionNumber, int AccountId, int CollectionId) {
        try {
            String query = "INSERT INTO Exam ([Name], [Password], TimeLimit, [Date], QuestionNumber, AccountID, CollectionID)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setInt(3, timeLimit);
            ps.setString(4, date);
            ps.setInt(5, questionNumber);
            ps.setInt(6, AccountId);
            ps.setInt(7, CollectionId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static Exam getExamById(int id) {
        String sql = "Select * From Exam Where ExamID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Exam acc = new Exam(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static ArrayList<Exam> searchListExamsByName(String name) {
        try {
            String query = "select * from Exam";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Exam> list = new ArrayList<>();
            while (rs.next()) {
                if (rs.getString(2).toLowerCase().contains(name.toLowerCase())) {
                    Exam a = new Exam(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
                    list.add(a);
                }
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void DeleteExam(int ExamId) {
        String sql = "delete from Enrollment where ExamID=?\n"
                + "delete from Exam where ExamID = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ExamId);
            ps.setInt(2, ExamId);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void UpdateExam(int id, String name, String password, int timeLimit, String date, int questionNumber, int AccountId, int CollectionId) {
        try {
            String query = "UPDATE Exam SET Name = ?, Password = ?, TimeLimit = ?, Date = ?, "
                    + "QuestionNumber = ?, AccountID = ?, CollectionID = ? WHERE ExamID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setInt(3, timeLimit);
            ps.setString(4, date);
            ps.setInt(5, questionNumber);
            ps.setInt(6, AccountId);
            ps.setInt(7, CollectionId);
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Hello");
        }
    }

    public static void main(String[] args) {
//        System.out.println(getListExams()); // OK
//        createExam("1","1",1,"1",1,1,1);
//        System.out.println(getListExamById(1));
//        System.out.println(getListExamById(2));
//        System.out.println(searchListExamsByName("123"));
//        DeleteCollection(11);
//        System.out.println(getExamById(1));
        UpdateExam(13,"13","13",13,"2023-07-12",13,1,2);
    }
}
