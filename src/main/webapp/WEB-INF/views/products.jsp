<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<div class="container mt-4">
  <div class="row">
    <!-- section one -->
    <div class="col-lg-8">
      <section class="intro mb-4">
        <h2><fmt:message key="products.title" /></h2>
        <div class="row row-cols-1 row-cols-md-2 g-4">
          <c:forEach var="product" items="${products}">
            <div class="col">
              <div class="card h-100">
                <div class="card-body">
                  <h5 class="card-title">
                    <fmt:message key="product.title.${product.productKey}" />
                  </h5>
                  <p class="card-text">
                    <strong><fmt:message key="products.mode" />:</strong>
                    <fmt:message key="product.mode.${product.mode}" /><br>
                    <strong><fmt:message key="products.level" />:</strong>
                    <fmt:message key="product.level.${product.certificationLevel}" /><br>
                    <strong><fmt:message key="products.price" />:</strong>
                    $${product.prix}
                  </p>


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



    <aside class="col-lg-4 mt-4 mt-lg-0">
      <div class="asside mb-4">
        <ul>
          <li><a href="#"><fmt:message key="aside.link1" /></a></li>
          <li><a href="#"><fmt:message key="aside.link2" /></a></li>
          <li><a href="${pageContext.request.contextPath}/about.jsp"><fmt:message key="menu.about"/></a></li>
        </ul>
      </div>


      <form method="get" action="${pageContext.request.contextPath}/products" class="border p-3 rounded bg-light">
        <h5><fmt:message key="filter.title" /></h5>
        <div class="row">
          <!-- Mode -->
          <div class="col-12 mb-2">
            <label><fmt:message key="products.mode" /></label><br>
            <input type="checkbox" name="mode" value="Online"
                   <c:if test="${param.mode == 'Online'}">checked</c:if> />
            <fmt:message key="product.mode.Online" /><br>
            <input type="checkbox" name="mode" value="Offline"
                   <c:if test="${param.mode == 'Offline'}">checked</c:if> />
            <fmt:message key="product.mode.Offline" />
          </div>


          <div class="col-12 mb-2">
            <label><fmt:message key="products.level" /></label><br>
            <c:forEach var="lvl" items="${['Beginner', 'Intermediate', 'Expert']}">
              <input type="checkbox" name="level" value="${lvl}"
                     <c:if test="${param.level == lvl}">checked</c:if> />
              <fmt:message key="product.level.${lvl}" /><br>
            </c:forEach>
          </div>


          <div class="col-12 mb-2">
            <label>
              <input type="checkbox" name="under200"
                     <c:if test="${not empty param.under200}">checked</c:if> />
              <fmt:message key="filter.under200" />
            </label>
          </div>
        </div>

        <button type="submit" class="btn btn-primary mt-2">
          <fmt:message key="filter.apply" />
        </button>
      </form>
    </aside>

  </div>
</div>

<jsp:include page="footer.jsp" />
