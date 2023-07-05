/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quoct
 */
public class Collection {

    private int id;
    private String name;
    private int status;
    private Account accountID;

    public Collection() {
    }

    public Collection(int id, String name, int status, Account accountID) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.accountID = accountID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Account getAccountID() {
        return accountID;
    }

    public void setAccountID(Account accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Collection{" + "id=" + id + ", name=" + name + ", status=" + status + ", accountID=" + accountID + '}';
    }
    
    

    
}
