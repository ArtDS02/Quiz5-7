<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.AccountDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="b" class="dao.EnrollDAO" scope="request"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="css/nav.css"/>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
            <style>
                body{
                    background-color: #f6f7fb;
                    font-family: courier, arial, helvetica;
                }

                .container{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-wrap: wrap;
                }
                .tittle{
                    padding: 10px 0 30px 0;
                }

                .content{
                    border: 1px solid black;
                    /*width: 30%;*/
                    margin: 0 20px 20px 10px;
                    text-align: center;
                    border-radius: 15px;
                    background-color: #fff;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                    padding: 20px;
                }
                .content:hover{
                    box-shadow: 10px 10px 5px lightblue;
                    cursor: pointer;
                }
                .content p {
                    font-size: 20px;
                    font-weight: bold;
                }
                /*                .header-content > #nav > li {
                                    margin-bottom:15px;
                                }*/

                @media (max-width: 800px) {
                    .container {
                        flex-direction: column;
                    }
                    .content{
                        width: 60%;
                    }
                }
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
                .add:hover{
                    background-color: #4CAF50;
                    color:#fff;
                    text-decoration: none;

                }
                .add{
                    color: #000;
                    background-color: #fff;
                }
                .ani:hover img {
                    transform: scale(1.1);
                    transition: 0.7s;
                    cursor: pointer;
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

        <h1 style="margin: 80px 0;"></h1>  
        <section style="margin-top: 30px">


            <form style="margin: 20px auto; width: 75% " action="SearchExam" method="post">
                <div class="input-group">
                    <input style="display:none" type="text" class="form-control" name="searchName" value="${searchName}">
                    <input type="text" class="form-control" placeholder="Search for Collection"  name="search" value="${searchName}">
                    <div class="input-group-append">
                        <button type="submit" class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <div class="container-xxl py-5">
                <div class="container">
                    <div  class="row g-4 justify-content-center">
                        <c:set var="pagesize" value="3"></c:set>
                        <c:set var="page" value="${not empty param.page?param.page : 1}"></c:set>
                        <c:set var="NumPage" value="${requestScope.listExam.size()/3+1}"></c:set>
                        <c:forEach var="i" items="${requestScope.listExam}" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                            <c:set var="ExamId" value="20"></c:set>
                                <div class="col-lg-4 col-md-6 wow fadeInUp ani" data-wow-delay="0.1s">
                                    <div style="margin: 10px 0; border-radius: 10px" class="course-item bg-white">
                                        <div class="position-relative overflow-hidden">
                                            <img class="img-fluid" src="img/course-2.jpg" alt="">
                                        </div>
                                        <div class="text-center p-4 pb-0">
                                            <h3 class="mb-0">${i.name}</h3>
                                        <h5 class="mb-4"></h5>
                                        <c:if test="${sessionScope.accountS!=null}">
                                            <a href="examJoin?id=${i.id}" style="text-decoration: none">
                                                <h1>Join</h1>
                                            </a>
                                        </c:if>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i
                                                class="fa fa-user-tie text-primary me-2"></i> ${i.date}</small>
                                        <small class="flex-fill text-center border-end py-2"><i
                                                class="fa fa-clock text-primary me-2"></i> ${i.timeLimit}</small>
                                        <small class="flex-fill text-center py-2"><i
                                                class="fa fa-user text-primary me-2"></i> ${i.questionNumber} Question</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div style="display: flex; justify-content: center; margin-top: 50px">

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
