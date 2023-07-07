<%-- 
    Document   : allCollectionView
    Created on : May 30, 2023, 5:51:36 PM
    Author     : quoct
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <style>
            body{
                background-color: #eee;
                font-family: courier, arial, helvetica;
            }
            .tittle{
                padding: 10px 0 30px 0;
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
            /*phan trang*/
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border: 1px solid #ddd;
                font-size: 22px;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white;
                border: 1px solid #4CAF50;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }
            .delete-button{
                position: absolute;
                left: 0px;
                top: 0px;
                background-color:grey;
                z-index: 5;
                text-decoration: none;
                color: black;

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


        <section style="margin-top: 30px">

            <div class="text-center container py-5">
                <div style="margin: 20px 0; display: inline-block; text-align: center;">
                    <c:if test="${sessionScope.accountS.getRole()!=2}"> 
                        <c:if test="${sessionScope.accountS!=null}"> 
                            <a href="newCourse.jsp" class="mt-1 mb-1 add" style="text-decoration: none;font-size: 20px; padding: 20px; font-weight: bold;  border-radius: 10px">New course</a>
                        </c:if>
                    </c:if>
                </div>
                <br><br>
                <div class="row">
                    <c:forEach var="i" items="${requestScope.listCollectionDetail}" >
                        <div class="col-lg-4 col-md-12 mb-4">
                            <div style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); overflow: hidden" class="card">
                                <c:set var="check" value="c${i.getId()}"></c:set>
                                <a class="delete-button" href="Delete?id=${check}">Delete ${check}</a>
                                <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light wa"
                                     data-mdb-ripple-color="light">
                                    <img style="height: 180px;" src="https://img.freepik.com/free-vector/set-hand-drawn-questionnaire-elements_23-2147596295.jpg?size=626&ext=jpg&ga=GA1.1.939347458.1685442295&semt=ais"
                                         class="w-100" />
                                    <a href="#!">
                                        <div class="mask">
                                            <div class="d-flex justify-content-start align-items-end h-100">
                                            </div>
                                        </div>
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <p href="" class="text-reset">
                                    <h5 class="card-title mb-3"><strong> ${i.name}</strong></h5>
                                    </p>
                                    <p href="" class="text-reset">
                                    <p><strong>Author: ${i.accountID.firstname} ${i.accountID.lastname}</strong></p>
                                    </p>
                                    <a style="font-size: 30px" href="myCourseDetail?id=${i.id}" class="mb-3">Detail</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>
