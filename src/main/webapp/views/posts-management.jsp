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
                    <a class="nav-link active" href="/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:when test="${param.status == 'APPROVED'}">
                <li class="nav-item ">
                    <a class="nav-link" href="/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:when test="${param.status == 'DECLINED'}">
                <li class="nav-item ">
                    <a class="nav-link" href="/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/ads-management?status=DECLINED">DECLINED</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item ">
                    <a class="nav-link active" href="/ads-management?status=NEW">NEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=APPROVED">APPROVED</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ads-management?status=DECLINED">DECLINED</a>
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
                            <form action="/manage/decline" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="/manage/decline" method="post">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='APPROVED'}">
                            <form action="/manage/decline" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='DECLINED'}">
                            <form action="/manage/approve" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>
                        </c:when>
                        <c:when test="${empty param.status}">
                            <form action="/manage/approve" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="/manage/decline" method="post">
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
</div>

</body>

<script>
    $('#myTab a:last').tab('show')
</script>
</html>
