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

        <li class="nav-item">
            <a class="nav-link active" href="/posts-management?status=NEW">NEW</a>
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
        <form class="form " style="border:1px silver">
            <div class="row w-100 justify-content-center">
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
                    <div class="text-right col">
                        <a href="/approve?id=${newPost.id}" class="btn btn-success">Approve</a>
                        <a href="/decline?id=${newPost.id}" class="btn btn-danger">Decline</a>
                    </div>
                </div>
            </div>
            <hr>
        </form>
    </c:forEach>

</div>
<%@ include file="/common/footer.jspf" %>
