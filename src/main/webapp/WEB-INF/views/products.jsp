<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<div class="container mt-4">
  <div class="row">
    <!-- Main content -->
    <div class="col-lg-8">
      <section class="intro mb-4">
        <!-- Section title (i18n) -->
        <h2><fmt:message key="products.title" /></h2>

        <div class="row row-cols-1 row-cols-md-2 g-4">
          <c:forEach var="product" items="${products}">
            <div class="col">
              <div class="card h-100">
                <div class="card-body">

                  <!-- Product Title (i18n by productKey) -->
                  <h5 class="card-title">
                    <fmt:message key="product.title.${product.productKey}" />
                  </h5>

                  <!-- Product Details: Mode and Duration (i18n) -->
                  <p class="card-text">
                    <strong><fmt:message key="products.mode" />:</strong>
                    <fmt:message key="product.mode.${product.mode}" /><br>
                    <strong><fmt:message key="products.level" />:</strong>
                    <fmt:message key="product.level.${product.certificationLevel}" /><br>
                    <strong><fmt:message key="products.price" />:</strong>
                    $${product.prix}
                  </p>

                  <!-- View Details Button -->
                  <a href="${pageContext.request.contextPath}/product?id=${product.id}"
                     class="btn btn-primary">
                    <fmt:message key="products.viewDetails" />
                  </a>

                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </section>
    </div>

    <!-- End Main content -->

    <!-- Aside -->
    <aside class="col-lg-4 mt-4 mt-lg-0">
      <div class="asside">
        <ul>
          <li><a href="#"><fmt:message key="aside.link1" /></a></li>
          <li><a href="#"><fmt:message key="aside.link2" /></a></li>
          <li><a href="#"><fmt:message key="aside.link3" /></a></li>
        </ul>
      </div>
    </aside>
  </div>
</div>

<jsp:include page="footer.jsp" />
