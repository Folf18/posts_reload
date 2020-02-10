<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.02.2020
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Users</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>



</head>
<body>
<h1>List of users</h1>
<br class="container">



<a class="btn btn-primary" href="/admin/user/add">Add user</a>


<table border="1" class="table table-hover" id="datatable">
    <thead class="thead-dark">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Is Blocked</th>
        <th>Role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <!-- Loop over the list-->
    <c:forEach items="${users}" var="user">
        <tr class="thead-light">
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.isBlocked}</td>
            <td>${user.role.name}</td>
            <td>
                <a href="/admin/user/edit?id=${user.id}" >Edit</a>
                <a href="/admin/user/delete?id=${user.id}" > Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
</html>
