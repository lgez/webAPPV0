<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-15
  Time: 10:47 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp" />
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<div class="container mt-5">
    <h2><fmt:message key="checkout.title" /></h2>

    <c:choose>
        <c:when test="${empty sessionScope.cart}">
            <div class="alert alert-info">
                <fmt:message key="checkout.emptyCart" />
            </div>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">
                <fmt:message key="checkout.backToProducts" />
            </a>
        </c:when>

        <c:otherwise>
            <table class="table table-striped align-middle mt-4">
                <thead>
                <tr>
                    <th><fmt:message key="checkout.image" /></th>
                    <th><fmt:message key="checkout.product" /></th>
                    <th><fmt:message key="checkout.price" /></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${sessionScope.cart}">
                    <tr>
                        <td style="width: 100px;">
                            <img src="${pageContext.request.contextPath}/img/${item.productKey}.jpg"
                                 alt="${item.title}"
                                 class="img-fluid rounded" />
                        </td>
                        <td>${item.title}</td>
                        <td>${item.prix} $</td>
                        <td>
                            <!-- Optional Remove Button -->
                            <form method="post" action="${pageContext.request.contextPath}/checkout">
                                <input type="hidden" name="removeId" value="${item.id}" />
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <fmt:message key="checkout.remove" />
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="d-flex justify-content-between align-items-center mt-4">
                <h4>
                    <fmt:message key="checkout.total" />:
                    <span class="text-success fw-bold">
                        ${sessionScope.cartTotal} $
                    </span>
                </h4>
                <form method="post" action="${pageContext.request.contextPath}/checkout">
                    <button type="submit" class="btn btn-success btn-lg">
                        <fmt:message key="checkout.confirmPurchase" />
                    </button>
                </form>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp" />
