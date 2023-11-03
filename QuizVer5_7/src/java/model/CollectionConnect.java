/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author quoct
 */
public class CollectionConnect {

    private int collectionId;
    private int questionId;

    public CollectionConnect(int collectionId, int questionId) {
        this.collectionId = collectionId;
        this.questionId = questionId;
    }

    public CollectionConnect() {
    }

    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    @Override
    public String toString() {
        return "CollectionConnect{" + "collectionId=" + collectionId + ", questionId=" + questionId + '}';
    }
    
}
