<%-- 
    Document   : newCourse
    Created on : Jun 27, 2023, 9:45:09 PM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/nav.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <style>
        body{
            background-color: #eee;
            font-family: courier, arial, helvetica;
        }
        .tittle{
            padding: 10px 0 30px 0;
        }

        .content{
            border: 1px solid black;
            width: 30%;
            margin: 0 20px 20px 10px;
            text-align: center;
            border-radius: 15px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .content:hover{
            box-shadow: 10px 10px 5px lightblue;
            cursor: pointer;
        }
        .content p {
            font-size: 20px;
            font-weight: bold;
        }

        @media (max-width: 800px) {
            .container {
                flex-direction: column;
            }
            .content{
                width: 60%;
            }
        }
        .card:hover img {
            transform: scale(1.1);
            transition: 0.4s;
        }

        /*        //css form//*/
        form {
            width:50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 8%;
            border-radius: 10px;
            font-size: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);

        }
        input[type="text"]{
            margin: 0 10px;

        }

        input[type="text"], input[type="radio"] {
            margin-bottom: 10px;
            outline: none;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            margin: 0 10px;

        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

    </style>
    <body style="min-height: 100vh; background-color: #F4F6F7">
        <!-- Navbar Start -->
        <div id="header">
            <!-- Begin: Nav -->
            <div style="height: 45px; margin-left: 25px "  class="header-logo">
                <p class="title">FLearn</p>
            </div>
            <div class="header-content">
                <ul id="nav">
                    <li><a class="active" href="home.jsp">Home</a></li>
                        <c:if test="${accountS.role ==0}"> 
                        <li><a class="" href="admin.jsp">Admin Page</a></li>
                        </c:if>
                    <li><a class="" href="listcollectiondetail">Courses </a></li>
                    <li><a class="" href="listExam?id=${accountS.id}">Exam</a></li>
                        <c:if test="${sessionScope.accountS==null}">                
                        <li><a  href="login.jsp">Join now</a></li>
                        </c:if>
                        <c:if test="${sessionScope.accountS!=null}">
                        <li>
                            <a href="#">
                                Account: ${sessionScope.accountS.username}
                            </a>
                            <ul style="padding-left: 0" class="subnav">
                                <li><a href="profileServlet?pid=${accountS.id}">My profile</a></li>
                                    <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                                        <c:if test="${sessionScope.accountS!=null}"> 
                                        <li><a href="myCourses?id=${accountS.id}">My Courses</a></li>
                                        </c:if>
                                    </c:if>
                                <li><a href="logoutServlet">Logout</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- Navbar End -->
        <div style="display: flex; justify-content: center; align-items: center;">
            <form style="margin-top: 100px" action="newcourse">
                <h1 style="color: #06BBCC; margin-bottom: 30px; text-transform: uppercase; font-weight: bolder; margin-top: -50px">Add new Course</h1>

                <table>
                    <tr>
                        <td>Course name:</td>
                        <td><input type="text" name="name" required=""></td>
                    </tr>
                    <tr>
                        <td>Private:</td>
                        <td><input type="radio" value="0" name="status" required=""></td>
                    </tr>
                    <tr>
                        <td>Share:</td>
                        <td><input type="radio" value="1" name="status"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit"></td>
                    </tr>
                </table>
                <!--                Course name<input type="text" name="name"> <br>
                                Private<input type="radio" value="0" name="status"><br>
                                Share<input type="radio" value="1" name="status"><br>
                                <input type="submit">-->
            </form>
        </div>
    </body>
</html>
