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
        <c:forEach items="${postStatuses}" var="postStatus">
            <li class="nav-item">
                <a class="nav-link active" href="/posts-management?status=${postStatus.name}">${postStatus.name}</a>
            </li>
        </c:forEach>
    </ul>
    <br>
    <div class="row flex-sm-row">
        <c:forEach items="${newPosts}" var="newPost">
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-header">
                        <a href="/post/${newPost.id}">${newPost.summary}</a>
                    </div>
                    <div class="card-body">
                        <blockquote class="blockquote mb-0">
                            <p>${newPost.description}</p>
                            <footer class="blockquote-footer">${newPost.user.username} in <cite
                                    title="Source Title">${newPost.postType.name}</cite></footer>
                        </blockquote>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</div>
<%@ include file="/common/footer.jspf" %>
