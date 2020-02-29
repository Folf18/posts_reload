<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/16/20
  Time: 1:24 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/header.jspf" %>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <c:if test="${success}">
                <div class="alert alert-success text-center" role="alert">
                        ${greetingMessage}
                </div>
            </c:if>
            <c:if test="${not success}">
                <div class="alert alert-warning text-center" role="alert">
                        ${greetingMessage}
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>


</html>
