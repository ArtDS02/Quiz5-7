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
                <form style="margin: 20px 0" action="SearchCollection" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for Collection"  name="search" value="${searchName}">
                        <div class="input-group-append">
                            <button type="submit" class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <div class="row">
                    <c:set var="pagesize" value="3"></c:set>
                    <c:set var="page" value="${not empty param.page?param.page : 1}"></c:set>
                    <c:set var="NumPage" value="${requestScope.listCollectionDetail.size()/3+1}"></c:set>
                    <c:forEach var="i" items="${requestScope.listCollectionDetail}" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                        <div class="col-lg-4 col-md-12 mb-4">
                            <div style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); overflow: hidden" class="card">
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
                                    <a style="font-size: 30px" href="QuestionList?id=${i.id}" class="mb-3">Learn</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="pagination">
                    <c:if  var="result" test="${NumPage > 2.0}">
                        <a href="?page=1" class="previous">&laquo;</a>
                        <c:if  var="result" test="${page > 1.0}">
                            <a href="?page=${page-1}" class="previous"> Previous</a>
                        </c:if>

                        <c:if  var="result" test="${page == 1.0}">
                            <a href="?page=1" class="previous"> Previous </a>
                        </c:if>
                    </c:if>
                    <a href="#" class="active">${page}</a>
                    <c:if  var="result" test="${NumPage > 2.0}">
                        <c:if  var="result" test="${page < NumPage.intValue()}">
                            <a href="?page=${page+1}" class="next"> Next </a>
                        </c:if>

                        <c:if  var="result" test="${page == NumPage.intValue()}">
                            <a href="?page=${page}" class="next"> Next </a>
                        </c:if>
                        <a href="?page=${NumPage.intValue()}" class="next"> &raquo; </a>
                    </c:if>
                </div>
            </div>
        </section>
    </body>
</html>
