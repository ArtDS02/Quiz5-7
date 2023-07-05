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
        <title>Create Collection</title>
        <link rel="stylesheet" href="css/register1.css" />
    </head>
    <body>
        <div class="form_register">
            <form action="CreateCollection" method="post">
                <h1 class="register_heading">Create Collection</h1>
                <lable class="register_text">Name:</lable>
                <input type="text" class="register_input" name="name">
                <lable class="register_text">Status:</lable>
                Private<input type="radio" value="0" name="status"><br>
                Share<input type="radio" value="1" name="status"><br>
                <lable class="register_text">Author:</lable>
                <input type="text" class="register_input" name="Author">
                <button class="register_btn" type="submit">Create</button>
            </form>
        </div>
    </body>
</html>