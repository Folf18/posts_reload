<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/4/20
  Time: 3:25 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="common/header.jspf" %>

<h1>Posts</h1>
<div class="container">
    <div class="row flex-sm-row">
        <c:forEach items="${approvedPosts}" var="approvedPost">
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-header">
                           <a href="/post/${approvedPost.id}">${approvedPost.summary}</a>
                    </div>
                    <div class="card-body">
                        <blockquote class="blockquote mb-0">
                            <p>${approvedPost.description}</p>
                            <footer class="blockquote-footer">${approvedPost.user.username} in <cite
                                    title="Source Title">${approvedPost.postType.name}</cite></footer>
                        </blockquote>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</div>
<%@ include file="common/footer.jspf" %>

