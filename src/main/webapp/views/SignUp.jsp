<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 5:05 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>

<div class="row justify-content-center">
    <form action="/signup" method="post" class="col-md-4">
        <div class="form-group">
            Enter username: <input type="text" name="username" placeholder="Username  e.g. User228"
                                   class="form-control"/> </br>
        </div>
        <div class="form-group">
            Enter email: <input type="text" name="email" placeholder="Email" class="form-control"/> </br>
        </div>
        <div class="form-group">
            Enter password: <input type="password" name="password" placeholder="Password" class="form-control"/> </br>
        </div>
        <div class="row justify-content-end">
            <button class="btn btn-primary" type="submit">Sign Up</button>
        </div>
    </form>
</div>
</body>


</html>
