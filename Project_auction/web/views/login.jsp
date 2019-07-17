<%@ include file="header.jsp"%>

<div class="container">
    <div class="row">
        <div class="offset-md-3 col-md-6" id="login_container">
            <h2 class="text-center">Login</h2>

            <form action="/Project_auction/login" method="post">
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" name="username" value="${username}" class="form-control" id="email">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" name="password" class="form-control" id="pwd">
                </div>
                <div class="checkbox">
                    <label ><input type="checkbox" ${remember_me} name="remember_me"> Remember me</label>
                    <label style="float:right;"> you don't have an account? <a href="/Project_auction/signup">Sign up</a></label>
                </div>
                <c:if test="${requestScope.error}">
                    <div class="form-group">
                        <div class="alert alert-danger" role="alert" >
                            Username or password incorrect!
                        </div>
                    </div>
                </c:if>


                <button type="submit" class="btn btn-success">Login</button>
            </form>
        </div>

    </div>
</div>

<%@ include file="footer.jsp"%>
