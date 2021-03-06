<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/11/20
  Time: 5:53 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>
<c:if test="${not empty emptyError}">
    <div class="row justify-content-center">
        <div class="alert alert-warning" role="alert">
            <div class="col">
                <ul>
                        <li>${emptyError}</li>
                </ul>
            </div>
        </div>
    </div>

</c:if>


<c:if test="${not empty errors}">

    <div class="row justify-content-center">
        <div class="alert alert-warning" role="alert">
            <div class="col">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error.message}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</c:if>


<div class="row justify-content-center">
    <form class="col-md-4" action="${pageContext.request.contextPath}/add-ads" method="post">
        <div class="form-group">
            Enter short summary: <input type="text" name="summary" value="${enteredSummary}"
                                        placeholder="Summary e.g. 'Selling a cow'"
                                        class="form-control"/> </br>
        </div>

        <div class="form-group">
            Enter description: <br>
            <textarea class="form-control" name="description" rows="5" cols="70"
                      placeholder="e.g. For sale cow in the village ###. Call the number 000-000-00-00"><c:if test="${not empty enteredDescription}">${enteredDescription}</c:if></textarea>
            </br>
        </div>


        <div class="form-group">
            Choose advertisement type:
            <select class="form-control col-md-6" name="post_type_id">
                <c:forEach items="${postTypes}" var="postType">
                    <option value="${postType.id}"
                            <c:if test="${enteredPostTypeId eq postType.id}">selected="selected"</c:if>>${postType.name}</option>
                </c:forEach>
            </select>
            </br>
        </div>

        <div class="row justify-content-center">
            <button class="btn btn-primary" type="submit">Publish advertisement</button>
        </div>
    </form>
</div>


</body>


</html>
