<%-- 
    Document   : Create
    Created on : 16 Feb, 2023, 2:14:46 PM
    Author     : Hi
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
        <link rel="stylesheet" href="css/register1.css" />
    </head>
    <body>
                
        <div class="form_register">
            <form action="Update" method="post" class="cal">
                <h1 class="register_heading">Update User</h1>
                <c:set var="check" value="a${st.getId()}"></c:set>
                <input style="display: none" value="${check}" type="text" id="id" name="id"><br><br>
                <lable class="register_text">FirstName</lable>
                <input type="text" class="register_input" name="FirstName">
                <lable class="register_text">LastName</lable>
                <input type="password" class="register_input" name="LastName">
                <lable class="register_text">UserName</lable>
                <input type="password" class="register_input" name="UserName">
                <lable class="register_text">Password</lable>
                <input type="text" class="register_input" name="Password">
                <lable class="register_text">Phone</lable>
                <input type="text" class="register_input" name="phone">
                <lable class="register_text">Email</lable>
                <input type="text" class="register_input" name="email">
                <lable class="register_text">Date of birth</lable>
                <input type="date" class="register_input" name="DOB">
                <lable class="register_text">Student or Teacher?</lable><br>
                <h2>Teacher</h2><input type="radio"  name="Role" value="1"> 
                <h2>Student</h2><input type="radio"  name="Role" value="2"> 
                <button class="register_btn" type="submit">Update</button>
            </form>
        </div>    
    </body>
</html>