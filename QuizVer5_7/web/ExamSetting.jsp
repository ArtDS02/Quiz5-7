<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Exam</title>
        <link rel="stylesheet" href="css/nav.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body{
                font-family: courier, arial, helvetica;
                background-color: #eee;

            }
            form{
                margin-top: 100px;
            }
            form {
                width:50%;
                margin: 0 auto;
                background-color: #fff;
                padding: 8%;
                border-radius: 10px;
                font-size: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);

            }
            input[type="text"]{
                margin: 0 10px;

            }

            input[type="text"], input[type="radio"],input[type="date"], input[type="password"] {
                margin-bottom: 10px;
                outline: none;
                width: 100%;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                margin: 0 10px;

            }

            input[type="submit"]:hover {
                background-color: #45a049;
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
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 80px">

            <form action="ShowExam" method="post">
                <h1 style="color: #06BBCC; margin-bottom: 30px; text-transform: uppercase; font-weight: bolder; margin-top: -50px">Create Exam</h1>
                <table>
                    <tr>
                        <td>Name Exam:</td>
                        <td><input name="name" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input style="margin-left: 10px" name="password" type="password" class="form-control" checked="" required=""></td>
                    </tr>
                    <tr>
                        <td>Show Password:</td>
                        <td><input style="margin-left: 10px" type="checkbox" id="showPassword"></td>

                    </tr>
                    <tr>
                        <td>Time Limit:</td>
                        <td><input name="timeLimit" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>Date:</td>
                        <td><input style="margin-left: 10px" name="date" type="date" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td>QuestionNumber:</td>
                        <td><input name="questionNumber" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input style="display:none" name="AccountId" type="text" class="form-control" value="${sessionScope.accountS.getId()}"></td>
                    </tr>
                    <tr>
                        <td>CollectionId:</td>
                        <td><input name="CollectionId" type="text" class="form-control" required=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" class="btn btn-success" value="Submit"></td>
                    </tr>
                </table>
                <!--            <input name="name" type="text" class="form-control" placeholder="name">
                            <input name="password" type="text" class="form-control" placeholder="password">
                            <input name="timeLimit" type="text" class="form-control" placeholder="timeLimit">
                            <input name="date" type="date" class="form-control" placeholder="date">
                            <input name="questionNumber" type="text" class="form-control" placeholder="questionNumber">
                            <input style="display:none" name="AccountId" type="text" class="form-control" value="${sessionScope.accountS.getId()}">
                            <input name="CollectionId" type="text" class="form-control" placeholder="CollectionId">
                            <input type="submit" class="btn btn-success" value="Submit">-->

            </form>
        </div>

        <script class="u-script" type="text/javascript" src="js/Exam.js" defer=""></script>
        <script>
            var passwordInput = document.querySelector('input[name="password"]');
            var showPasswordCheckbox = document.getElementById('showPassword');

            showPasswordCheckbox.addEventListener('change', function () {
                if (showPasswordCheckbox.checked) {
                    passwordInput.setAttribute('type', 'text');
                } else {
                    passwordInput.setAttribute('type', 'password');
                }
            });
        </script>
    </body>
</html>