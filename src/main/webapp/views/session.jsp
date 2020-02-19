<%--
  Created by IntelliJ IDEA.
  User: fhavr
  Date: 2/18/20
  Time: 9:53 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${sessionScope.user_id}</p>
<hr>
<p>${sessionScope.user_username}</p>
<hr>
<p>${sessionScope.user_role}</p>
<hr>
</body>
</html>
