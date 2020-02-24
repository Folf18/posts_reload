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
<div class="container justify-content-center">
    <p>${message}</p>

    <table border="1" class="table table-hover">
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
                    <div>
                        <c:choose>
                            <c:when test="${user.isBlocked == true}">
                                <form action="/admin/changeBlocking" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.isBlocked}" name="isBlocked"/>
                                    <button class="btn btn-info" type="submit">UnBlock</button>
                                </form>
                            </c:when>

                            <c:when test="${user.isBlocked == false}">
                                <form action="/admin/changeBlocking" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.isBlocked}" name="isBlocked"/>
                                    <button class="btn btn-danger" type="submit">Block</button>
                                </form>
                            </c:when>

                        </c:choose>
                    </div>

                    <div>
                        <c:choose>
                            <c:when test="${user.role.name == 'USER'}">
                                <form action="/admin/changeRole" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.role.id}" name="roleId"/>
                                    <input type="hidden" value="${user.role.name}" name="roleName"/>
                                    <button class="btn btn-light" type="submit">Upgrade Role</button>
                                </form>
                            </c:when>
                            <c:when test="${user.role.name == 'MANAGER'}">
                                <form action="/admin/changeRole" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.role.id}" name="roleId"/>
                                    <input type="hidden" value="${user.role.name}" name="roleName"/>
                                    <button class="btn btn-dark" type="submit">Downgrade Role</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <a>Action isn't available</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>
