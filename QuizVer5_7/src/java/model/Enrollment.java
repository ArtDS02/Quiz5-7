/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thinh
 */
public class Enrollment {
    private int AccountId;
    private int CollectionId;
    private double score;

    public Enrollment() {
    }

    public Enrollment(int AccountId, int CollectionId, double score) {
        this.AccountId = AccountId;
        this.CollectionId = CollectionId;
        this.score = score;
    }

    public int getAccountId() {
        return AccountId;
    }

    public void setAccountId(int AccountId) {
        this.AccountId = AccountId;
    }

    public int getCollectionId() {
        return CollectionId;
    }

    public void setCollectionId(int CollectionId) {
        this.CollectionId = CollectionId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Enrollment{" + "AccountId=" + AccountId + ", CollectionId=" + CollectionId + ", score=" + score + '}';
    }
    
    
}
