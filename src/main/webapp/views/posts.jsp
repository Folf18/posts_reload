<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/4/20
  Time: 3:25 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>

<h1>Posts</h1>
<div class="container">

    <c:forEach items="${approvedPosts}" var="approvedPost">
        <div class="row w-100 justify-content-center">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                        <a href="/post?id=${approvedPost.id}">
                                ${approvedPost.summary}</a>
                    </div>
                    <div class="card-body">
                        <p class="card-text">${approvedPost.description}</p>
                    </div>
                    <div class="card-footer text-muted si text-right">
                            ${approvedPost.user.username} in

                                <c:choose>
                                    <c:when test="${approvedPost.postType.name=='Buy'}">
                                <span class="badge badge-success">${approvedPost.postType.name}</span>
                                    </c:when>
                                    <c:when test="${approvedPost.postType.name=='Sale'}">
                                        <span class="badge badge-primary">${approvedPost.postType.name}</span>
                                    </c:when>
                                    <c:when test="${approvedPost.postType.name=='Trade'}">
                                        <span class="badge badge-info">${approvedPost.postType.name}</span>
                                    </c:when>
                                </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </c:forEach>
</div>
</div>
<%@ include file="/common/footer.jspf" %>

