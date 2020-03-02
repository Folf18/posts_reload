<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 10:37 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>


<div class="container">
    <ul class="nav nav-pills row justify-content-center">
        <c:choose>
            <c:when test="${param.status == 'NEW'}">
                <li class="nav-item ">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:when test="${param.status == 'APPROVED'}">
                <li class="nav-item ">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:when test="${param.status == 'DECLINED'}">
                <li class="nav-item ">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item ">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
    <br>

    <c:forEach items="${newPosts}" var="newPost">
        <hr>
        <div class="row w-100 justify-content-center tab-pane">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                            ${newPost.summary}

                    </div>
                    <div class="card-body">
                        <p class="card-text">${newPost.description}</p>
                    </div>
                    <div class="card-footer text-muted">
                        <div class="row">
                            <div class="col-6 text-left">
                                <a class="font-weight-bold">${newPost.user.username}</a> in

                                <c:choose>
                                    <c:when test="${newPost.postType.name=='Buy'}">
                                        <span class="badge badge-success">${newPost.postType.name}</span>
                                    </c:when>
                                    <c:when test="${newPost.postType.name=='Sale'}">
                                        <span class="badge badge-primary">${newPost.postType.name}</span>
                                    </c:when>
                                    <c:when test="${newPost.postType.name=='Trade'}">
                                        <span class="badge badge-info">${newPost.postType.name}</span>
                                    </c:when>
                                </c:choose>
                            </div>

                            <div class="col-6 text-right">
                                    ${newPost.createdAt}
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-right row">

                    <c:choose>
                        <c:when test="${param.status=='NEW'}">
                            <form action="${pageContext.request.contextPath}/manage/approve" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/manage/decline" method="post">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='APPROVED'}">
                            <form action="${pageContext.request.contextPath}/manage/decline" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='DECLINED'}">
                            <form action="${pageContext.request.contextPath}/manage/approve" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>
                        </c:when>
                        <c:when test="${empty param.status}">
                            <form action="${pageContext.request.contextPath}/manage/approve" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/manage/decline" method="post">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <a>Actions aren't available</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <hr>
    </c:forEach>

    <!-- NAVIGATION-->
    <div class="row w-100 justify-content-center">
        <nav aria-label="Navigation for ads">
            <ul class="pagination">

                <c:if test="${page != 1}">
                    <li class="page-item">
                    <c:if test="${empty param.status}"><a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=NEW&page=${page-1}">Previous</a></c:if>
                    <c:if test="${not empty param.status}"><a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=${param.status}&page=${page-1}">Previous</a></c:if>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${noOfPages}" var="i">
                    <c:choose>
                        <c:when test="${page eq i}">
                            <li class="page-item active"><a class="page-link">
                                    ${i} <span class="sr-only">(current)</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <c:if test="${empty param.status}"><a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=NEW&page=${i}">${i}</a></c:if>
                                <c:if test="${not empty param.status}"><a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=${param.status}&page=${i}">${i}</a></c:if>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${page lt noOfPages}">
                    <li class="page-item">
                                        <c:if test="${empty param.status}"> <a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=NEW&page=${page+1}">Next</a></c:if>
                                        <c:if test="${not empty param.status}"> <a class="page-link" href="${pageContext.request.contextPath}/ads-management?status=${param.status}&page=${page+1}">Next</a></c:if>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

</div>



</body>

</html>
