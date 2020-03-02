<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.02.2020
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>


<div class="container justify-content-center">

    <h1 class="row justify-content-center">List of users</h1>
    <br>
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
        </tr>
        </thead>
        <tbody>
        <!-- Loop over the list-->
        <c:forEach items="${users}" var="user">
            <tr class="thead-light">
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.role.name}
                    <c:if test="${sessionScope.global_user_role == 'ADMIN'}">
                    <div>
                        <c:choose>
                            <c:when test="${user.role.name == 'USER'}">
                                <form action="${pageContext.request.contextPath}/admin/changeRole" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.role.id}" name="roleId"/>
                                    <input type="hidden" value="${user.role.name}" name="roleName"/>
                                    <input type="hidden" value="${param.page}" name="page"/>
                                    <button class="btn btn-light" type="submit">Upgrade Role</button>
                                </form>
                            </c:when>
                            <c:when test="${user.role.name == 'MANAGER'}">
                                <form action="${pageContext.request.contextPath}/admin/changeRole" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.role.id}" name="roleId"/>
                                    <input type="hidden" value="${user.role.name}" name="roleName"/>
                                    <input type="hidden" value="${param.page}" name="page"/>
                                    <button class="btn btn-dark" type="submit">Downgrade Role</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <a>Action isn't available</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </c:if>
                </td>
                <td>${user.isBlocked}
                    <div>
                        <c:choose>
                            <c:when test="${user.isBlocked == true}">
                                <form action="${pageContext.request.contextPath}/admin/changeBlocking" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.isBlocked}" name="isBlocked"/>
                                    <input type="hidden" value="${param.page}" name="page"/>
                                    <button class="btn btn-info" type="submit">UnBlock</button>
                                </form>
                            </c:when>

                            <c:when test="${user.isBlocked == false}">
                                <form action="${pageContext.request.contextPath}/admin/changeBlocking" method="post">
                                    <input type="hidden" value="${user.id}" name="userId"/>
                                    <input type="hidden" value="${user.isBlocked}" name="isBlocked"/>
                                    <input type="hidden" value="${param.page}" name="page"/>
                                    <button class="btn btn-danger" type="submit">Block</button>
                                </form>
                            </c:when>
                        </c:choose>
                    </div>
                </td>

                <td>${user.isActive}</td>


            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- NAVIGATION-->
    <div class="row w-100 justify-content-center">
        <nav aria-label="Navigation for ads">
            <ul class="pagination">

                <c:if test="${page != 1}">
                    <li class="page-item"><a class="page-link"
                                             href="${pageContext.request.contextPath}/users-management?page=${page-1}">Previous</a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${noOfPages}" var="i">
                    <c:choose>
                        <c:when test="${page eq i}">
                            <li class="page-item active"><a class="page-link">${i}<span class="sr-only">(current)</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/users-management?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${page lt noOfPages}">
                    <li class="page-item"><a class="page-link"
                                             href="${pageContext.request.contextPath}/users-management?page=${page+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>


</body>
</html>
