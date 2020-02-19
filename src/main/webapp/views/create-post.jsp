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
            Choose advertisement type:
            <select class="form-control col-md-6" name="post_type_id">
                <c:forEach items="${postTypes}" var="postType">
                   <option value="${postType.id}">${postType.name}</option>
                </c:forEach>
            </select>
            </br>
        </div>


        <div class="form-group">
            <p>user id = ${sessionScope.user_id}</p> </br>
        </div>

        <div class="row justify-content-center">
            <button class="btn btn-primary" type="submit">Publish advertisement</button>
        </div>
    </form>
</div>




<%@ include file="/common/footer.jspf" %>
