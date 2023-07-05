<%-- 
    Document   : doTestView
    Created on : May 31, 2023, 11:37:54 AM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/nav.css"/>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                /*background-color: #333;*/
                background-color:#eee;


            }

            .container {
                background-color: #fff;
                color: #000;
                border-radius: 10px;
                padding: 20px;
                font-family: 'Montserrat', sans-serif;
                max-width: 700px;
            }

            .container>p {
                font-size: 32px;
            }

            .question {
                width: 75%;
            }

            .options {
                position: relative;
                padding-left: 40px;
            }

            #options label {
                display: block;
                margin-bottom: 15px;
                font-size: 20px;
                cursor: pointer;
            }

            .options input {
                opacity: 0;
            }

            .checkmark {
                position: absolute;
                top: -1px;
                left: 0;
                height: 25px;
                width: 25px;
                /*background-color: #555;*/
                border: 1px solid #ccc;
                border-radius: 50%;
            }

            .options input:checked~.checkmark:after {
                display: block;
            }

            .options .checkmark:after {
                content: "";
                width: 10px;
                height: 10px;
                display: block;
                background: white;
                position: absolute;
                top: 50%;
                left: 50%;
                border-radius: 50%;
                transform: translate(-50%, -50%) scale(0);
                transition: 300ms ease-in-out 0s;
            }

            .options input[type="radio"]:checked~.checkmark {
                background: #21bf73;
                transition: 300ms ease-in-out 0s;
            }

            .options input[type="radio"]:checked~.checkmark:after {
                transform: translate(-50%, -50%) scale(1);
            }

            .btn-primary {
                background-color: #555;
                color: #ddd;
                border: 1px solid #ddd;
            }

            .btn-primary:hover {
                background-color: #21bf73;
                border: 1px solid #21bf73;
            }

            .btn-success {
                padding: 5px 25px;
                background-color: #21bf73;
            }

            @media(max-width:576px) {
                .question {
                    width: 100%;
                    word-spacing: 2px;
                }
            }
            input[type="submit"] {
                padding: 20px;
                width: 50%;
                font-family: courier, arial, helvetica;
                font-size: 20px;
                font-weight: bold;
                margin: 20px 0;

            }
            input[type="submit"]:hover{
                cursor: pointer;
                background-color: #6675df;
                color: #fff;

            }
        </style>

    </head>
    <body>
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
        <form action="checkanswer" style="margin-top: 100px">
            <c:forEach var="i" items="${requestScope.list}">      
                <div class="container mt-sm-5 my-1">
                    <div class="question ml-sm-5 pl-sm-5 pt-2">
                        <div class="py-2 h5"><b>${i.detail}</b></div>
                        <div class="ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" id="options">
                            <label class="options">A. ${i.answerA}
                                <input type="radio" name="${i.id}" value="A" id="${i.answerA}">
                                <span class="checkmark"></span>
                            </label>
                            <label class="options">B. ${i.answerB}
                                <input type="radio" name="${i.id}" value="B" id="${i.answerB}">
                                <span class="checkmark"></span>
                            </label>
                            <label class="options">C. ${i.answerC}
                                <input type="radio" name="${i.id}" value="C" id="${i.answerC}">
                                <span class="checkmark"></span>
                            </label>
                            <label class="options">D. ${i.answerD}
                                <input type="radio" name="${i.id}" value="D" id="${i.answerD}">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <c:set var="allID" value="${allID} ${i.id}"></c:set>
            </c:forEach>
            <input type="text" name="allID" value="${allID}" hidden="">
            <div style="width: 100%; display: flex; justify-content: center; align-items: center;">
                <input type="submit" value="Submit">

            </div>
        </form>

    </body>
</html>
