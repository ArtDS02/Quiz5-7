<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddFile" method="post">
            <input style="display:none" type="text" class="register_input" name="CollectionId" value="${requestScope.CollectionId}">
            <input name="upload" type="file" class="form-control">
            <input type="submit" class="btn btn-success" value="Edit">
        </form>
    </body>
</html>