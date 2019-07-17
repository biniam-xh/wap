<%--
  Created by IntelliJ IDEA.
  User: binia
  Date: 7/15/2019
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Roboto:100,300,400,500,700|Philosopher:400,400i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="resources/css/style.css" rel="stylesheet">
</head>
<body>

<nav class="navigation">
    <ul class="nav justify-content-end ">

        <li class="nav-item">
            <a class="nav-link active" href="/Project_auction/home">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/Project_auction/MyProducts">My Products</a>
        </li>
        <li class="nav-item">
            <c:if test="${sessionScope['username'] != null }">
                <a class="nav-link" href="/Project_auction/logout" tabindex="-1" aria-disabled="true">Logout</a>
            </c:if>


        </li>
    </ul>
</nav>


<div class="main">
