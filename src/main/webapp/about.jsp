<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-16
  Time: 3:07 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="WEB-INF/views/header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />


<div class="container mt-4">
  <div class="row">
    <section class="legal" aria-labelledby="legal-title">
      <header>
        <h2 id="legal-title" class="fw-bold"><fmt:message key="legal.title" /></h2>
      </header>
      <div class="legal-content text-muted small">
        <p class="mb-1 fw-semibold"><fmt:message key="legal.text.ownership" /></p>
        <p class="mb-1 fw-semibold"><fmt:message key="legal.text.usage.restriction" /></p>
        <p class="mb-0 fw-semibold"><fmt:message key="legal.text.protection.notice" /></p>
      </div>
    </section>
  </div>
</div>


<jsp:include page="WEB-INF/views/footer.jsp" />