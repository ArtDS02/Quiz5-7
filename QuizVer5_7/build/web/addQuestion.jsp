<%-- 
    Document   : Create
    Created on : 16 Feb, 2023, 2:14:46 PM
    Author     : Hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link rel="stylesheet" href="css/register1.css" />
    </head>
    <body>
        <div class="form_register">
            <form action="AddOneQuestion" method="post">
                <input style="display:none" type="text" class="register_input" name="CollectionId" value="${requestScope.CollectionId}">
                <h1 class="register_heading">Create Question</h1>
                <lable class="register_text">Detail</lable>
                <input type="text" class="register_input" name="Detail">
                <lable class="register_text">Answer A</lable>
                <input type="text" class="register_input" name="AnswerA">
                <lable class="register_text">Answer B</lable>
                <input type="text" class="register_input" name="AnswerB">
                <lable class="register_text">Answer C</lable>
                <input type="text" class="register_input" name="AnswerC">
                <lable class="register_text">Answer D</lable>
                <input type="text" class="register_input" name="AnswerD">
                <lable class="register_text">True Answer</lable>
                <input type="text" class="register_input" name="TrueAnswer">
                <button class="register_btn" type="submit">Create</button>
            </form>
        </div>
    </body>
</html>