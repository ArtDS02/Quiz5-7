<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <meta charset="UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                /*                min-height: 100vh;
                                display: flex;
                                justify-content: center;
                                align-items: center;*/
                font-family: courier, arial, helvetica;
                background: linear-gradient(#eee, #eee);
            }

            .content {
                background-color: #fff;
                width: 80%;
                padding: 10%;
                border-radius: 20px;
                margin: 0 auto;
            }

            .content h1 {
                font-size: 30px;
                padding: 10%;
                text-align: center;
                margin-top: -15%;
            }

            .content form {
                text-align: center;
                font-size: 20px;
                margin-top: -50px;
            }

            .content form input {
                width: 100%;
                padding: 3px;
                margin-top: 20px;
                border-radius: 10px;
                outline: none;
                font-size: 25px;
                text-align: center;
            }

            .content form input[type="submit"]:hover {
                background-color: #6675df;
                cursor: pointer;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div style="margin-top: 100px" class="container">
            <div class="content">
                <h1>Add by File </h1>

                <form action="AddFile" method="post">
                    <input style="display:none" type="text" class="register_input" name="CollectionId" value="${requestScope.CollectionId}">
                    <input name="upload" type="file" class="form-control">
                    <input type="submit" class="btn btn-success" value="Edit">
                </form>

            </div>
        </div>
    </body>
</html>