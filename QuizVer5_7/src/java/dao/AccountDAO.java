package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;

public class AccountDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public static Account getAccountById2(int id) {
        String sql = "Select * From Account Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)
                );
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    // Dang dung
    public Account getAccountById(String id) {
        String sql = "Select * From Account Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)
                );
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static ArrayList<Account> getListAccounts() {
        try {
            String query = "select * from Account";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Account> list = new ArrayList<>();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // Dang dung
    public static Account checkAccountExist(String username) {
        try {
            String query = "select * from account \n"
                    + "where username = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public static void register(String FirstName, String LastName, String UserName, String Password, String phone, String email, String DOB, int Role) {
        try {
            String query = "INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, UserName);
            ps.setString(4, Password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, DOB);
            ps.setInt(8, Role);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void deleteAccount(String id) {
        String query = "DELETE  FROM Account  WHERE AccountID=?";
        try {
            conn = new DBContext().getConnection();
            System.out.println(conn);
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static Account getAccount(String id) {
        String query = "select * from account where AccountID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static int checkName(String name) {
        String query = "select * from account where UserName = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return 1;
            }
        } catch (Exception e) {
            return 1;
        }
        return 0;
    }

    public static void updateAccount(int id, String FirstName, String LastName, String UserName, String Password, String phone, String email, String DOB, int Role) {
        String query = "UPDATE Account SET FirstName = ?, LastName = ?, UserName = ?, [Password] = ?, Phone = ?, Email = ?, DOB = ?, [Role] = ? WHERE AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, UserName);
            ps.setString(4, Password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, DOB);
            ps.setInt(8, Role);
            ps.setInt(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void insertAccount(String username, String password, String email, String phone) {
        String query = "INSERT INTO account([username],[passwords],[email],[phone]) VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            System.out.println(conn);
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.executeQuery();

        } catch (Exception e) {
        }
    }

    // Dang dung
    public Account login(String username, String password) {
        String sql = "select * from account\n"
                + "where UserName = ? and Password= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }

        } catch (Exception e) {
        }
        return null;
    }

    // Dang dung
    public void registerAccount(String firstname, String lastname, String username, String password, String phone, String email, String dob, int role) {
        String sql = "INSERT INTO Account(FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)\n"
                + "values(?,?,?,?,?,?,?,?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, dob);
            ps.setInt(8, role);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateInfoAccount(String id, String first, String last, String phone, String email, String dob) {
        String sql = "update account\n"
                + "set FirstName=?, LastName=?, Phone=?, Email=?, DOB=?\n"
                + "where AccountID =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, first);
            ps.setString(2, last);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, dob);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    // Dang dung
    public Account checkOldpass(String password, String username) {
        String sql = "SELECT * FROM account WHERE password = ? and username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), 0);
            }

        } catch (Exception e) {
        }
        return null;
    }

    // Dang dung
    public void changepass(String pass, String username) {
        String sql = "update account\n"
                + "set Password=?\n"
                + "where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
    
    public static void main(String[] args) {
        System.out.println(getAccountById2(2).toString());
    }
}
