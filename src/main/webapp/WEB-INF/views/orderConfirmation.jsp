<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-15
  Time: 10:51 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />


<div class="container mt-5 text-center">
    <h2 class="text-success">
        <fmt:message key="order.success" />
    </h2>
    <p><fmt:message key="order.thankYou" /></p>
    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">
        <fmt:message key="order.continueShopping" />
    </a>
</div>

<jsp:include page="footer.jsp" />
