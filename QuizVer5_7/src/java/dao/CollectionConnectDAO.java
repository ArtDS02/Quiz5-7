/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Question;


public class CollectionConnectDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;


    // Dang dung
    public static List<Question> getCollectionById(int id) {
        String sql = "Select * From CollectionConnect Where CollectionID = ?";
        List<Question> list = new ArrayList<>();
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(questionDAO.getQuestionById(rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Dang dung
    public static int countNumInCollectionById(int id) {
        String sql = "Select Count(*) From CollectionConnect Where CollectionID = " + id;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public static void addCollectionConnect(int collectionId, int QuestionId){
        try {
            String query = "insert into CollectionConnect (CollectionID, QuestionID) values (?,?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, collectionId);
            ps.setInt(2, QuestionId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        addCollectionConnect(1,20);
    }


}
