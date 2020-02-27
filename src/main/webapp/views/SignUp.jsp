<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 5:05 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>

<c:if test="${not empty emailExists}">

    <div class="row justify-content-center">
        <div class="alert alert-warning" role="alert">
            <div class="col col-lg-12">
                <ul>
                    <li>${emailExists}</li>
                </ul>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${not empty usernameExists}">

    <div class="row justify-content-center">
        <div class="alert alert-warning" role="alert">
            <div class="col col-lg-12">
                <ul>
                    <li>${usernameExists}</li>
                </ul>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${not empty errors}">

    <div class="row justify-content-center">
        <div class="alert alert-warning" role="alert">
            <div class="col col-lg-12">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error.message}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</c:if>

<div class="row justify-content-center">
    <form action="/signup" method="post" class="col-md-4">
        <div class="form-group">
            Enter username: <input type="text" name="username" placeholder="Username  e.g. User228"
                                   class="form-control" value="${oldUsername}"/> </br>
        </div>

        <div class="form-group">
            Enter email: <input type="text" name="email" placeholder="Email" class="form-control" value="${oldEmail}"/> </br>
        </div>

        <div class="form-group">
            Enter password: <input type="password" name="password" placeholder="Password" class="form-control" /> </br>
        </div>

        <div class="row justify-content-end">
            <button class="btn btn-primary" type="submit">Sign Up</button>
        </div>
    </form>
</div>
</body>


</html>
