<%-- 
    Document   : testResultView
    Created on : Jun 7, 2023, 10:06:48 AM
    Author     : quoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <script>
            function change(id) {
                var x = document.getElementById(id);
                x.style = 'color: red';
            }

            function change2(id) {
                var x = document.getElementById(id);
                x.style = 'color: green';
            }
        </script>

    </head>
    <body>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

            body{
                background: linear-gradient(#eee, #eee);

            }
            .container{
                /*                border: 1px solid black;
                                width: 50%;
                                margin: 0 auto 10px auto;
                                display: flex;
                                border-radius: 20px;
                                font-family: 'Montserrat', sans-serif;
                
                                background-color: #fff;*/
                background-color: #fff;
                color: #000;
                border-radius: 10px;
                padding: 20px;
                font-family: 'Montserrat', sans-serif;

                max-width: 700px;



            }
            .content{
                width: 100%;
                padding: 20px;
            }
            .content p {
                font-size: 20px;
                /*font-weight: bold;*/
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
        <h1 style="margin-top: 100px"></h1>
        <!--<a href="home.jsp"><h2>Home</h2></a>-->
        <h1 style="color: red; text-align: center"> Score: ${score}</h1>
        <c:forEach var="i" items="${requestScope.list.keySet()}">
            <c:set var='x' value="${list.get(i)}"></c:set>
                <div class="container  mt-sm-5 my-1 mb-5" >
                    <div class="content ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" >
                        <h1 class="py-2 h5"> <b>${i.detail}<b></h1>

                                <p id="${i.id}A">A) ${i.answerA}</p>
                                <p id="${i.id}B">B) ${i.answerB}</p>
                                <p id="${i.id}C">C) ${i.answerC}</p>
                                <p id="${i.id}D">D) ${i.answerD}</p>

                                <script>
                                    change2('${i.id}${i.trueAnswer}');
                                </script>

                                <c:if test='${(x != "")}'>                          
                                    <script>
                                        change('${i.id}${x}');
                                    </script>                 
                                </c:if> 

                                </div>
                                </div>

                            </c:forEach>
                            </body>

                            </html>
