<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
    <head>
        <jsp:useBean id="a" class="dao.AccountDAO" scope="request"></jsp:useBean>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="utf-8">
            <meta name="description" content="">
            <title>Home</title>
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
            <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/nicepage.css" media="screen">
            <link rel="stylesheet" href="css/Home.css" media="screen">
            <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
            <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
            <style>
                #carousel_bd30{
                    /*background-image: url("images/manageUserBg.jpg");*/
                    background-color: #eee;
                }
                h1{
                    margin-top: 50px;
                    color:#000;
                    opacity: 0.8;
                }
                .table-wrapper {
                    width: 100%;
                    margin: 30px auto;
                    background: #fff;
                    padding: 20px;
                    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
                }

                .table-title {
                    padding-bottom: 10px;
                    margin: 0 0 10px;
                }

                .table-title h2 {
                    margin: 6px 0 0;
                    font-size: 22px;
                }

                .table-title .add-new {
                    float: right;
                    height: 30px;
                    font-weight: bold;
                    font-size: 12px;
                    text-shadow: none;
                    min-width: 100px;
                    border-radius: 50px;
                    line-height: 13px;
                }

                .table-title .add-new i {
                    margin-right: 4px;
                }

                table.table {
                    table-layout: fixed;
                }

                table.table tr th,
                table.table tr td {
                    border-color: #ccc;
                    text-align: center;
                }

                table.table th i {
                    font-size: 13px;
                    margin: 0 5px;
                    cursor: pointer;
                }

                table.table th:last-child {
                    width: 100px;
                }

                table.table td a {
                    cursor: pointer;
                    display: inline-block;
                    margin: 0 5px;
                    min-width: 24px;
                }

                table.table td a.add {
                    color: #27C46B;
                }

                table.table td a.edit {
                    color: #FFC107;
                }

                table.table td a.delete {
                    color: #E34724;
                }

                table.table td i {
                    font-size: 19px;
                }

                table.table td a.add i {
                    font-size: 24px;
                    margin-right: -1px;
                    position: relative;
                    top: 3px;
                }

                table.table .form-control {
                    height: 32px;
                    line-height: 32px;
                    box-shadow: none;
                    border-radius: 2px;
                }

                table.table .form-control.error {
                    border-color: #f50000;
                }

                table.table td .add {
                    display: none;
                }

            </style>
        </head>
        <body class="u-body u-xl-mode" data-lang="en">
            <header style="background-color: #4a3348;" class="u-clearfix u-header u-header" id="sec-f2d3">
                <div class="u-clearfix u-sheet u-sheet-1">
                    <nav class="u-align-left u-menu u-menu-hamburger u-offcanvas u-menu-1" data-responsive-from="XL">
                        <div class="menu-collapse">
                            <a class="u-button-style u-nav-link" href="#" style="padding: 4px 0px; font-size: calc(1em + 8px);">
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="svg-5c50" x="0px" y="0px" viewBox="0 0 302 302" style="enable-background:new 0 0 302 302;" xml:space="preserve" class="u-svg-content">
                                <rect y="36" width="302" height="30"></rect>
                                <rect y="236" width="302" height="30"></rect>
                                <rect y="136" width="302" height="30"></rect>
                                </svg>
                            </a>
                        </div>

                        <div class="u-nav-container-collapse">
                            <div class="u-align-center u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                                <div class="u-inner-container-layout u-sidenav-overflow">
                                    <div class="u-menu-close"></div>
                                    <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                                        <li class="u-nav-item">
                                            <a class="u-button-style u-nav-link" href="home.jsp" style="padding: 10px 20px;">Home</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                        </div>
                    </nav>
                </div>
            </header>

            <section class="u-clearfix u-image u-section-2" id="carousel_bd30" data-image-width="1620" data-image-height="1080">
                <center> 
                    <h1>List User</h1>
                    <h2 style="color:#000;">Number of Users: ${a.getListAccounts().size()}</h2>
                <div class="container-fluid-lg">

                    <div class="table-responsive">

                        <table class="table table-bordered" style="text-align: ">

                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>UserName</th>
                                    <th>Password</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>DOB</th>
                                    <th>Role</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="pagesize" value="6"></c:set>
                                <c:set var="page" value="${not empty param.page?param.page : 1}"></c:set>
                                <c:set var="NumPage" value="${a.getListAccounts().size()/6+1}"></c:set>
                                <c:forEach items="${a.getListAccounts()}" var="b" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}">
                                    <tr>
                                        <td>${b.id}</td>
                                        <td>${b.firstname}</td>
                                        <td>${b.lastname}</td>
                                        <td>${b.username}</td>
                                        <td>${b.password}</td>
                                        <td>${b.phone}</td>
                                        <td style="overflow-x: scroll">${b.email}</td>
                                        <td>${b.DOB}</td>
                                        <c:if test = "${b.role == 1}">
                                            <td>Teacher</td>
                                        </c:if>
                                        <c:if test = "${b.role == 2}">
                                            <td>Student</td>
                                        </c:if>
                                        <c:if test = "${b.role == 0}">
                                            <td>Admin</td>
                                        </c:if>
                                        <td style="padding-left: 4px;padding-right: 4px;">
                                            <c:set var="check" value="a${b.getId()}"></c:set>
                                            <a class="edit" title="Edit" data-toggle="tooltip" style="padding-left: 4px;padding-right: 4px;" href="Update?id=${check}"><i
                                                    class="material-icons">&#xE254;</i></a>
                                            <a class="delete" title="Delete" data-toggle="tooltip" style="padding-left: 4px;padding-right: 4px;" href="Delete?id=${check}"><i
                                                    class="material-icons">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <button style="background-color: black;margin-bottom: 10px;border-radius: 20px;border-color: white;"><a style="color:white;" href="CreateUser.jsp">Create new User</a></button>

                        </table>
                    </div>
                </div>
                <a href="?page=1" class="previous"><<</a>




                <c:if  var="result" test="${page > 1.0}">
                    <a href="?page=${page-1}" class="previous"> < </a>
                </c:if>

                <c:if  var="result" test="${page == 1.0}">
                    <a href="?page=1" class="previous"> < </a>
                </c:if>

                <a style="color:#000;" href="">${page}</a>

                <c:if  var="result" test="${page < NumPage.intValue()}">
                    <a href="?page=${page+1}" class="next"> > </a>
                </c:if>

                <c:if  var="result" test="${page == NumPage.intValue()}">
                    <a href="?page=${page}" class="next"> > </a>
                </c:if>
                <a href="?page=${NumPage.intValue()}" class="next"> >> </a>
                <br><br>
                <a href="admin.jsp" class="">Go to admin control &raquo;</a>
        </section>



        <footer  style="background-color: #333333; padding-top: 10px; padding-bottom: 5px; color: white;">
            <section style="text-align:center;">
                <p style="margin: 0;" class="u-text">
                    <span>Flearn - Quiz & Exam</span>
                </p>
                <p style="margin: 0;" class="u-text">
                    <span>Summer2023</span>
                </p>
            </section>
        </footer>

    </body>
</html>