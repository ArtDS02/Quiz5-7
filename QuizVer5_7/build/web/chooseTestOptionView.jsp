<%-- 
    Document   : testOption
    Created on : May 31, 2023, 9:50:26 AM
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
    <body>
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
                width: 80%;
                padding: 15px;
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
        <div style="margin-top: 100px" class="container">
            <div class="content">
                <h1>Test option</h1>

                <form action="testoption" method="post">
                    Number of questions:(Maximum ${requestScope.so}) <input type="number" value="1" min="1" max="${requestScope.so}" name="num">    
                    <input type="number" value="${requestScope.id}" name="id" style="display: none" >
                    <br>


                    <input type="submit" value="Begin test">
                </form>
            </div>
        </div>
    </body>
</html>
