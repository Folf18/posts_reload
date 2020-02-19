<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.02.2020
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>

<h1>List of users</h1>
<br class="container">


<table border="1" class="table table-hover" >
    <thead class="thead-dark">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Is Blocked</th>
        <th>Is Active</th>
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
            <td>${user.role.name}</td>
            <td>${user.isBlocked}</td>
            <td>${user.isActive}</td>


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
</html>
