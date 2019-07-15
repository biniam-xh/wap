<%--
  Created by IntelliJ IDEA.
  User: binia
  Date: 7/14/2019
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="offset-md-2 col-md-8">
           <h1>Home Page</h1>
            <h2>welcome ${sessionScope.username}</h2>
            <a href="/Servlet_2/logout">Logout</a>
        </div>
    </div>

</div>

</body>
</html>
