<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/19/20
  Time: 10:07 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/header.jspf" %>
<h1><p>Please <a href="/signin">Login</a> to create a new advertisement</p></h1><br>
<p>${sessionScope.user_role}</p>
<%@ include file="/common/footer.jspf" %>
