<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/22/20
  Time: 9:01 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>

<!--Dropdown with post statuses-->
<div align="center">
    <h2>Ads created by ${sessionScope.global_user_username}</h2>
    <form action="${pageContext.request.contextPath}/my-ads" method="post">
        Select a Status:&nbsp;
        <select name="status">
            <c:forEach items="${postStatuses}" var="status">
                <option value="${status.name}"
                        <c:if test="${param.status eq status.name}">selected="selected"</c:if>
                >
                        ${status.name}
                </option>
            </c:forEach>
        </select>
        <br/><br/>
        <input class="btn btn-info" type="submit" value="Filter" />
    </form>
</div>


<div class="container">
    <br>

    <c:forEach items="${approvedForUser}" var="approvedForUser">
        <hr>
        <div class="row w-100 justify-content-center tab-pane">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header font-weight-bold">
                            ${approvedForUser.summary}
                    </div>
                    <div class="card-body">
                        <p class="card-text">${approvedForUser.description}</p>
                    </div>
                    <div class="card-footer text-muted">
                        <div class="row">
                            <div class="col-6 text-left">  in
                                <c:choose>
                                    <c:when test="${approvedForUser.postType.name=='Buy'}">
                                        <span class="badge badge-success">${approvedForUser.postType.name}</span>
                                    </c:when>
                                    <c:when test="${approvedForUser.postType.name=='Sale'}">
                                        <span class="badge badge-primary">${approvedForUser.postType.name}</span>
                                    </c:when>
                                    <c:when test="${approvedForUser.postType.name=='Trade'}">
                                        <span class="badge badge-info">${approvedForUser.postType.name}</span>
                                    </c:when>
                                </c:choose>
                            </div>

                            <div class="col-6 text-right">
                                    ${approvedForUser.createdAt}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </c:forEach>
</div>

</body>


</html>