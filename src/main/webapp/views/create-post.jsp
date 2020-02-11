<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 5:53 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>

<div class="row justify-content-center">
    <form class="col-md-4" action="/add-post" method="post">
        <div class="form-group">
            Enter short summary: <input type="text" name="summary" placeholder="Summary e.g. 'Selling a cow'"
                                        class="form-control"/> </br>
        </div>
        <div class="form-group">
            Enter description: <input type="text" name="description" placeholder="Description"
                                      class="form-control"/> </br>
        </div>

        <div class="form-group">
            Choose post type:
            <select name="post_type_id">
                <c:forEach items="${postTypes}" var="postType">
                    <option value="${postType.id}">${postType.name}</option>
                </c:forEach>
            </select>
            </br>
        </div>

        <div class="form-group">
            Enter user_id: <input type="text" name="user_id" placeholder="User_id" class="form-control"/> </br>
        </div>

        <div class="row justify-content-end">
            <button class="btn btn-primary" type="submit">Create post</button>
        </div>
    </form>
</div>

<div class="form-group">
    Enter post_type_id: <input type="text" name="post_type_id" placeholder="Post_type_id"
                               class="form-control"/> </br>
</div>
<%@ include file="/common/footer.jspf" %>
