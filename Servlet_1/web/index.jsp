<%--
  Created by IntelliJ IDEA.
  User: binia
  Date: 7/13/2019
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Servlet assignment 1</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>

  <div class="container">
    <div class="row">
      <div class="offset-md-2 col-md-8">
        <h1>Servlets 1</h1>
        <form action="/servlet_1/support" method="post">
          <div class="form-group">
            <label for="name">Name:</label>
            <input name="name" type="text" class="form-control" id="name">
          </div>
          <div class="form-group">
            <label for="email">Email address:</label>
            <input name="email" type="email" class="form-control" id="email">
          </div>
          <div class="form-group">
            <label for="problem">Problem:</label>
            <input name="problem" type="text" class="form-control" id="problem">
          </div>
          <div class="form-group">
            <label for="problem_description">Problem Description:</label>
            <textarea name="problem_description" rows="5" class="form-control" id="problem_description">
      </textarea>
          </div>

          <button type="submit" class="btn btn-primary">Help</button>
        </form>
      </div>
    </div>

  </div>





  </body>
</html>
