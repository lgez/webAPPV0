<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-14
  Time: 10:32 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<div class="container mt-5">
  <div class="row">
    <!-- Product Image -->
    <div class="col-md-6 d-flex align-items-center justify-content-center">
      <div class="shadow rounded overflow-hidden border border-light" style="max-width: 500px; transition: transform 0.3s;">
        <img src="${pageContext.request.contextPath}/img/${product.productKey}.jpg"
             alt="${product.title}"
             class="img-fluid"
             style="width: 100%; height: 300px; object-fit: cover;">
      </div>
    </div>

    <!-- Product Details -->
    <div class="col-md-6">
      <h2>  <fmt:message key="product.title.${product.productKey}" /></h2>
      <p><strong><fmt:message key="products.mode" />:</strong> <fmt:message key="product.mode.${product.mode}" /></p>
      <p><strong><fmt:message key="products.duration" />:</strong> ${product.durationHours}h</p>
      <p><strong><fmt:message key="products.price" />:</strong> ${product.prix} $</p>
      <p><strong><fmt:message key="products.level" />:</strong>  <fmt:message key="product.level.${product.certificationLevel}" /></p>
      <p><strong><fmt:message key="products.releaseDate" />:</strong> ${product.releaseDate}</p>
      <p><strong><fmt:message key="products.description" />:</strong> <fmt:message key="product.description.${product.productKey}"/></p>
      <form method="post" action="${pageContext.request.contextPath}/product">
        <input type="hidden" name="id" value="${product.id}" />
        <button type="submit" name="action" value="add" class="btn btn-primary me-2">
          <fmt:message key="products.addToCart" />
        </button>
        <button type="submit" name="action" value="buyNow" class="btn btn-success">
          <fmt:message key="products.buyNow" />
        </button>
      </form>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp" />

