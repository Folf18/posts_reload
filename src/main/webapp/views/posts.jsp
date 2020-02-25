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

    <div class="row w-100 justify-content-center">
    <nav aria-label="Navigation for ads">
        <ul class="pagination">

            <c:if test="${page != 1}">
                <li class="page-item"><a class="page-link"
                                         href="/post?v=${page-1}">Previous</a>
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
                        <li class="page-item"><a class="page-link"
                                                 href="/post?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${page lt noOfPages}">
                <li class="page-item"><a class="page-link"
                                         href="/post?page=${page+1}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
    </div>
</div>
</div>
</body>


</html>

