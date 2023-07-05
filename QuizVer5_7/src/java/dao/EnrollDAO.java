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
import java.util.List;
import model.Enrollment;

/**
 *
 * @author Thinh
 */
public class EnrollDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    
    public static void addEnroll(int AccountId, int ExamId, double score){
        try {
            String query = "insert into Enrollment (AccountID, ExamID, Score) values (?,?,?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, AccountId);
            ps.setInt(2, ExamId);
            ps.setDouble(3, score);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static Boolean getListEnrollByAccountId(int AccountId, int ExamId){
        String sql = "select * from Enrollment where AccountID=" + AccountId;
        List<Integer> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(2));
            }
        } catch (Exception e) {
        }
        if (list.contains(ExamId)){
            return true;
        }else return false;
    }
    
    //trong navbar
    public static List<Enrollment> getListEnrollByAccountId2(int AccountId){
        String sql = "select * from Enrollment where AccountID=" + AccountId;
        List<Enrollment> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Enrollment cd = new Enrollment(rs.getInt(1), rs.getInt(2), rs.getDouble(3));
                list.add(cd);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
//        addEnroll(3, 1, 2.5);
        System.out.println(getListEnrollByAccountId2(2));
    }
}
