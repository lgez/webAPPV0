<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-13
  Time: 11:10 p.m.
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Test Products</title>
</head>
<body>
<h2>Testing Database Connection: Product List</h2>
<c:forEach var="product" items="${products}">
  <div>
    <strong>${product.title}</strong> - ${product.durationHours} hours<br>
    Mode: ${product.mode}, Level: ${product.certificationLevel}<br>
    Release: ${product.releaseDate}<br>
    <p>${product.description}</p>
    <hr>
  </div>
</c:forEach>
</body>
</html>
