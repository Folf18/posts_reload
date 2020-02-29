<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 6:04 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>


<div class="container">
    <c:if test="${not empty message}">
    <div class="row justify-content-center">
        <div class="col-6">

            <div class="alert alert-warning text-center" role="alert">
                ${message}
            </div>

        </div>
    </div>
    </c:if>
<div class="row justify-content-center">
    <form action="/signin" method="post" class="col-md-4">
        <h2>Login</h2><br>
        <div class="form-group">
            Enter username: <input type="text" name="username" placeholder="Username" class="form-control" value="${enteredUsername}"/> </br>
        </div>
        <div class="form-group">
            Enter password: <input type="password" name="password" placeholder="Password" value="${enteredPassword}" class="form-control"/> </br>
        </div>
        <div class="row justify-content-end">
            <button class="btn btn-primary" type="submit">Login</button>
        </div>
    </form>
</div>
</div>

</body>


</html>