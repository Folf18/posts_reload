<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/21/20
  Time: 6:31 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>
<div class="container">
        <div class="row w-100 justify-content-center">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                        <a href="/post/?id=${postInfo.id}">
                                ${postInfo.summary}</a>
                    </div>
                    <div class="card-body">
                        <p class="card-text">${postInfo.description}</p>
                    </div>
                    <div class="card-footer text-muted si text-right">
                            ${postInfo.user.username} in ${postInfo.postType.name} and email: ${postInfo.user.email}
                    </div>
                </div>
            </div>
        </div>
        <br>
</div>
</div>
</body>


</html>
