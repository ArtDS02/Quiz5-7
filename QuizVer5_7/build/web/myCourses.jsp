
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/nav.css"/>
        <style>
            body{
                background-color: #eee;
                font-family: courier, arial, helvetica;
            }

            .container{
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                margin-top: 40px;
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
                /*                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.7);*/
                box-shadow: 10px 10px 5px lightblue;
                cursor: pointer;
            }
            .content p {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 15px;
            }
            .header-content>#nav>li {
                padding: 30px;
                list-style-type: none;
                margin-bottom: 15px;
            }

            @media (max-width: 800px) {
                .container {
                    flex-direction: column;
                }
                .content{
                    width: 60%;
                }
            }
            .add:hover{
                background-color: #4CAF50;
                color:#fff;
                text-decoration: none;

            }
            .add{
                color: #000;
                background-color: #fff;
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
        <h1 style="margin: 100px 0;"></h1> 
        <div style="margin: 10px 0; display: flex; justify-content: center">

            <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                <c:if test="${sessionScope.accountS!=null}"> 
                    <a href="newCourse.jsp" class="mt-1 mb-1 add" style="text-decoration: none;font-size: 20px; padding: 20px; font-weight: bold;  border-radius: 10px">New course</a>
                </c:if>
            </c:if>
        </div>

        <div class="container">
            <c:forEach var="i" items="${requestScope.listCollectionDetail}">

                <div class="content">
                    <p> ${i.name}</p>
                    <p>Author: ${i.accountID.firstname} ${i.accountID.lastname}</p>
                    <a href="QuestionList?id=${i.id}" style="text-decoration: none"><h1>Detail</h1></a>
                </div>

            </c:forEach>
        </div>
    </body>
</html>
