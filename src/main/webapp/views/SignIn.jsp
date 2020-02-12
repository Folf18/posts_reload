<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 6:04 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>

<h1 style="alignment: center"> ${message}</h1>
<div class="row justify-content-center">
    <form action="/signin" method="post" class="col-md-4">
        <div class="form-group">
            Enter username: <input type="text" name="username" placeholder="Username" class="form-control"/> </br>
        </div>
        <div class="form-group">
            Enter password: <input type="password" name="password" placeholder="Password" class="form-control"/> </br>
        </div>
        <button class="btn btn-primary" type="submit">Sign In</button>
    </form>
</div>


<%@ include file="/common/footer.jspf" %>