<%--
  Created by IntelliJ IDEA.
  User: binia
  Date: 7/13/2019
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="offset-md-2 col-md-8">
            <h1>Login</h1>
            <form action="/Servlet_2/login" method="post">
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" name="username" value="${username}" class="form-control" id="email">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name="password" class="form-control" id="pwd">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" ${remember_me} name="remember_me"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
