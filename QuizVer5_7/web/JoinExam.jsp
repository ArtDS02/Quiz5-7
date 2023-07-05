<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
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
                background-color: #eee;
            }
            .countdown-container {
                margin: 20px;
                text-align: center;
            }
            .countdown-input {
                width: 200px;
                height: 30px;
                font-size: 16px;
            }
            .countdown-button {
                margin-top: 10px;
                width: 100px;
                height: 30px;
                font-size: 16px;
            }
            .countdown-display {
                margin-top: 20px;
                font-size: 24px;
            }
            form{
                background-color: #fff;
                width: 50%;
                padding: 50px;

                /*height: 50%;*/
            }
            .countdown-input {
                margin-left: 10px;
                padding: 10px;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                color: #333;
                outline: none;
                transition: border-color 0.3s ease;
            }

            .countdown-input:focus {
                border-color: #5cace0;
            }
            .countdown-button {
                margin: 10px;
                /*padding: 10px 20px;*/
                background-color: #5cace0;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .countdown-button:hover {
                background-color: #4488b9;
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
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 180px;">
            <form style="border-radius:10px " action="examJoin" id="form" method="post">
                <h1 style="color: #06BBCC; margin-bottom: 30px; text-transform: uppercase; font-weight: bolder; text-align: center">Join Exam</h1>
                <div class="countdown-container">
                    <p>Enter password Exam:</p>
                    <input id="countdown-input" class="countdown-input" name="pass" type="password" value="">
                    <input style="display: none" id="countdown-input" class="countdown-input" name="ExamId" type="text" value="${ExamId}">
                    <h2 style="color: red; font-size: 16px">${message}</h2>
                    <button id="countdown-button" class="countdown-button">Join in</button>
                    <div id="countdown-display" class="countdown-display"></div>
                </div>
            </form>
        </div>



    </body>
</html>