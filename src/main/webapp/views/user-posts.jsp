<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/22/20
  Time: 9:01 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>


<div class="container">
    <ul class="nav nav-pills row justify-content-center">

        <li class="nav-item ">
            <a class="nav-link" href="/posts-management?status=NEW">NEW</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/posts-management?status=APPROVED">APPROVED</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/posts-management?status=DECLINED">DECLINED</a>

        </li>


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
                    <div class="card-footer text-muted text-left col">
                            ${newPost.user.username} in ${newPost.postType.name}
                    </div>
                </div>
                <br>
                <div class="text-right row">

                    <c:choose>
                        <c:when test="${param.status=='NEW'}">
                            <form action="/approve" method="post" class="col text-right">
                                <input  type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="/decline" method="post">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='APPROVED'}">
                            <form action="/decline" method="post" class="col text-right">
                                <input type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-danger" type="submit">Decline</button>
                            </form>
                        </c:when>
                        <c:when test="${param.status=='DECLINED'}">
                            <form action="/approve" method="post" class="col text-right">
                                <input  type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>
                        </c:when>
                        <c:when test="${empty param.status}">
                            <form action="/approve" method="post" class="col text-right">
                                <input  type="hidden" value="${newPost.id}" name="id"/>
                                <input type="hidden" value="${param.status}" name="status"/>
                                <button class="btn btn-success" type="submit">Approve</button>
                            </form>

                            <form action="/decline" method="post">
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