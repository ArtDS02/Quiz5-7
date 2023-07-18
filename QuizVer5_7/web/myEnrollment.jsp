<%-- 
    Document   : questionList.jsp
    Created on : Jun 4, 2023, 3:12:47 PM
    Author     : W
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.CollectionDAO" scope="request"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
            <<link rel="stylesheet" href="css/nav.css"/>
        </head>
        <body>

        <c:set var="numPage" value="${param.numPage}"/>  
        <c:set var="pageSize" value="1"/>

        <c:if test="${numPage ==null}">
            <c:set var="numPage" value="1"/>   
        </c:if>
        <style>

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{
                background-color: #f6f7fb;
            }

            .question {
                cursor: pointer;
                position: relative;
                margin-top: 20%;
                width: 100%;
                animation: animation .5s ease-in-out 1;
                animation-fill-mode: forwards;
                background-color: #fff;
                margin-top: 0;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                color: #2e3856;
                font-family: courier, arial, helvetica;

            }

            .answer {
                display: none;
                margin-top: 0;
            }

            h1,
            h3 {
                text-align: justify;
                line-height: 1.4;
                /*                letter-spacing: 1px;*/
            }

            h1 {
                margin: 0 9px;
                font-size: 26px;
            }

            h3 {
                text-indent: 20px;
            }

            .container {
                width: 600px;
                height: 450px;
                display: flex;
                background-color: #fff;
                text-align: justify !important;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);

            }
            #a {
                overflow-y: auto;
            }
            .wrapper {
                display: flex;
                justify-content: space-evenly;
                align-items: center;
            }

            @keyframes animation {
                0% {
                    transform: rotateY(90deg);
                }
                50%{
                    background-color:f6f7fb;
                }

                100% {
                    transform: rotateY(0);
                }
            }

            .div-content p {
                font-size: 25px;
                margin-left: 10px;
            }
            .pagging{
                font-size: 19px;
                padding: 10px;
                background-color: #e9e9e9;
                /*margin: 0px -24px;*/
                width: 8%;
                text-align: center;
                border-radius: 20px;
                display: inline-block;
            }
            .paggingmanage{
                /*display: flex;*/
                /*justify-content: center;*/
                align-items: center;
                margin-top: 10px;
                width: 80%;
                padding-left: 24%;
            }

            b{
                background-color: #c17a74;
                color:#000;
            }
            .divpagging{
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #ccc;
            }

            .pagging a {
                text-decoration: none;
                color:#000;
                font-family:Cursive;
            }
            .iconadd{
                color: #000;
                font-weight: bold;
                font-family: Cursive;
                text-decoration: none;
                font-size: 20px;
            }
            .learning{
                display: flex;
                background-color: #fff;
                margin: 5%;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                height: 50%;
                font-family: courier, arial, helvetica;

            }
            .learning .learning-content{
                width: 40%;
                position: relative;
                padding: 20px 10px;
                overflow-y: auto;
                height: 100%;
            }
            .learning .learning-content::after{
                content: "";
                position: absolute;
                right:  0;
                height: 70%;
                top: 50%;
                transform: translateY(-50%);
                border-left: 1px solid #ccc;

            }

            .learning .leaning-anwser{
                width: 60%;
                padding: 20px 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 25px;
            }
            .option-edit, .option-test, .option-copy_paste{
                padding: 20px;
                border-radius: 20px;
                background-color: #fff;
                width: 200px;
                margin: 10px 0;

            }
            .option-edit:hover{
                cursor: pointer;
                box-shadow: 10px 10px 5px lightblue;

            }
            .option-test:hover{
                cursor: pointer;
                box-shadow: 10px 10px 5px lightblue;

            }
            .option-copy_paste:hover{
                cursor: pointer;
                box-shadow: 10px 10px 5px lightblue;

            }
            .option a i {
                margin-left: 0;
                color: #000;
            }
            .option a{
                text-decoration: none;
                text-align: center;
                margin-left: 10%;
                color: #000;
                font-family: courier, arial, helvetica;
                font-size: 20px;
                font-weight: bold;
            }
        </style>
        <!--        <h1 style="margin-top: 70px;font-family: courier, arial, helvetica;
                    ">QuestionList</h1>-->
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
                                    <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                                        <c:if test="${sessionScope.accountS!=null}"> 
                                        <li><a href="myExams?id=${accountS.id}">My Exams</a></li>
                                        </c:if>
                                    </c:if>
                                <li><a href="myEnrollment?id=${accountS.id}">My Enrollment</a></li>
                                <li><a href="logoutServlet">Logout</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- Navbar End -->
        <div class="content">
            <div class="learning">
                <div class="learning-content">
                    <p> Exam ID</p>               
                </div>
                <div class="leaning-anwser">
                    <p> Score</p>    
                </div>
            </div>
        </div>
        <c:forEach var="i" items="${requestScope.list}">
            <div class="content">
                <div class="learning">
                    <div class="learning-content">
                        <p> ${i.getCollectionId()}</p>               
                    </div>
                    <div class="leaning-anwser">
                        <p> ${i.getScore()}</p>    
                    </div>
                </div>
            </div>
        </c:forEach>

    </body>
</html>
