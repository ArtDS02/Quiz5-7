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
import model.Account;
import model.Collection;

/**
 *
 * @author quoct
 */
public class CollectionDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    //Dang dung
    public static List<Collection> getAllCollection() {
        List<Collection> list = new ArrayList<>();

        String sql = "Select * From Collection";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);

                list.add(cd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static List<Collection> getAllCollectionPublic() {
        List<Collection> list = new ArrayList<>();

        String sql = "Select * From Collection where Status = 1";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);

                list.add(cd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static List<Collection> getCollectionByAccountId(int AccountId) {
        List<Collection> list = new ArrayList<>();

        String sql = "select * from Collection where AccountID=?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, AccountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);

                list.add(cd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static List<Collection> getAllCollectiontest() {
        List<Collection> list = new ArrayList<>();

        String sql = "Select * From Collection";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);
                if (cd.getStatus() == 1) {
                    list.add(cd);
                }

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Collection getCollectionById(int id) {

        String sql = "Select * From Collection Where CollectionID = " + id;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);

                return cd;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Collection getCollectionNewest() {

        String sql = "SELECT *\n"
                + "FROM Collection\n"
                + "ORDER BY CollectionID DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));
                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);

                return cd;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Collection> getCollectionByOwner(Account account) {

        String sql = "Select * From Collection Where AccountID = " + account.getId();
        List<Collection> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById2(rs.getInt(4));

                Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);
                list.add(cd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void createCollection(String name, int status, int id) {
        String sql = "Insert into Collection(Name, Status, AccountID) values (?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, status);
            ps.setInt(3, id);

            rs = ps.executeQuery();

        } catch (Exception e) {
        }
    }

    public static void UpdateCollection(int collectionId, String name, int status, int id) {
        String sql = "UPDATE Collection SET [Name] = ?, AccountID = ?, [Status] = ? WHERE CollectionID = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, id);
            ps.setInt(3, status);
            ps.setInt(4, collectionId);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static void DeleteCollection(int collectionId) {
        String sql = "DELETE FROM CollectionConnect WHERE CollectionID = ? \n"
                + "DELETE FROM Collection WHERE CollectionID = ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, collectionId);
            ps.setInt(2, collectionId);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public static List<Collection> SearchAllCollectionByName(String name) {
        List<Collection> list = new ArrayList<>();

        String sql = "Select * From Collection where Status = 1";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(2).toLowerCase().contains(name.toLowerCase())) {
                    AccountDAO accDAO = new AccountDAO();
                    Account acc = accDAO.getAccountById2(rs.getInt(4));
                    Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);
                    list.add(cd);
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
//        System.out.println(getCollectionByAccountId(2));
//        System.out.println(getCollectionById(1).getAccountID().getId());
//        System.out.println(getAllCollection());
//        System.out.println(getCollectionById(1));
//        UpdateCollection(4, "444", 1, 1);
//        DeleteCollection(5);
        System.out.println(SearchAllCollectionByName("i"));
    }

}
