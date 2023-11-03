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
            <form action="UpdateCollection" method="post">
                <h1 class="register_heading">Update Collection</h1>
                <input style="display: none" value="${st.getId()}" type="text" id="id" name="id"><br><br>
                <lable class="register_text">Name:</lable>
                <input type="text" class="register_input" name="name" placeholder="" required="">
                <lable class="register_text">Status:</lable><br>
                <h1>Private</h1><input type="radio" value="0" name="status" required=""><br>
                <h1>Share</h1><input type="radio" value="1" name="status" required=""><br>
                <lable class="register_text">Author:</lable>
                <input type="text" class="register_input" name="Author" required="">
                <button class="register_btn" type="submit">Create</button>
            </form>
        </div>
    </body>
</html>