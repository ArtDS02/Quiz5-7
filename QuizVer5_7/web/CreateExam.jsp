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
        
        <!-- Navbar End -->
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 80px">

            <form action="CreateExam" method="post">
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
                        <td>AccountId:</td>
                        <td><input name="AccountId" type="text" class="form-control" value="${sessionScope.accountS.getId()}"></td>
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