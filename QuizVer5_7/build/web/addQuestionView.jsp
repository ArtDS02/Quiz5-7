<%-- 
    Document   : addQuestionView
    Created on : Jun 27, 2023, 10:34:00 PM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/nav.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');


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

            /*form css*/
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            table {
                margin-top: 20px;
                border-collapse: collapse;
            }

            table td {
                padding: 5px;
            }

            table td:first-child {
                text-align: center;
                /*font-weight: bold;*/
                width: 100px;
                font-size: 20px;
            }

            input[type="text"],
            select {
                width: 400px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            .learning{
                display: flex;
                background-color: #fff;
                margin: 5%;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                height: 50%;
                /*font-family: courier, arial, helvetica;*/
                font-family: 'Montserrat', sans-serif;


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
                padding: 10px 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
            }

        </style>
        <title>JSP Page</title>
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
        <h1 style="margin-top: 100px;font-family: courier, arial, helvetica;
            ">Your new course: ${requestScope.collection.name}</h1>


        <div class="leaning-anwser">
            <div class="option-copy_paste">
                <a href="AddFile?id=${requestScope.collection.id}"><i class="fa fa-solid fa fa-pen"></i> Add by file</a>
            </div>  
        </div>

        <div style="width: 100%; background-color: #fff; border-radius: 10px; display: flex; justify-content: space-around; align-items: center  ";>
            <form action="vovan">
                <!--            Detail: <input type="text" name="ch">
                            A <input type="text" name="a">
                            B <input type="text" name="b">
                            C <input type="text" name="c">
                            D <input type="text" name="d">
                            <select name="da">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                            </select>
                            <input type="text" name="id" value="${requestScope.collection.id}" hidden="">
                            <input type="submit">-->

                <table>
                    <tr>
                        <td>Detail:</td>
                        <td><input type="text" name="ch" required=""></td>
                    </tr>
                    <tr>
                        <td>A :</td>
                        <td><input type="text" name="a" required=""></td>
                    </tr>
                    <tr>
                        <td>B :</td>
                        <td><input type="text" name="b" required=""></td>
                    </tr>
                    <tr>
                        <td>C :</td>
                        <td><input type="text" name="c" required=""></td>
                    </tr>
                    <tr>
                        <td>D :</td>
                        <td><input type="text" name="d" required=""></td>
                    </tr>
                    <tr>
                        <td>Anwser</td>
                        <td>            
                            <select name="da" required="">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="id" value="${requestScope.collection.id}" hidden="">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit"></td>
                    </tr>
                </table>

            </form>



        </div>
        <c:forEach var="i" items="${requestScope.list}">
            <div class="learning">

                <div class="learning-content">
                    <p>Q${i.id - list.get(0).id+1}: ${i.detail}</p>
                    <p>A.${i.answerA}</p>
                    <p>B.${i.answerB}</p>
                    <p>C.${i.answerC}</p>
                    <p>D.${i.answerD}</p>                  
                </div>
                <div class="leaning-anwser">
                    <p>TrueAnswer. ${i.trueAnswer}</p>    
                </div>
            </div>
        </c:forEach>


    </body>
</html>
