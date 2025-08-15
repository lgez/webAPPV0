<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-13
  Time: 12:54 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XIRTAM</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<!-- Header images -->
<div class="container-fluid p-0">
    <div class="row g-0">
        <div class="col-12 col-md-4">
            <img src="${pageContext.request.contextPath}/img/hh4.jpeg" class="img-fluid w-100 header-image" alt="Header 1">
        </div>
        <div class="col-12 col-md-4">
            <img src="${pageContext.request.contextPath}/img/hh2.jpg" class="img-fluid w-100 header-image" alt="Header 2">
        </div>
        <div class="col-12 col-md-4">
            <img src="${pageContext.request.contextPath}/img/hh1.png" class="img-fluid w-100 header-image" alt="Header 3">
        </div>
    </div>
</div>

<!-- Navbar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">XIRTAM</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp"><fmt:message key="menu.welcome"/></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><fmt:message key="menu.contact"/></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><fmt:message key="menu.about"/></a></li>
                </ul>

                <!-- Cart icon -->
                <a href="${pageContext.request.contextPath}/checkout" class="nav-link position-relative me-3">
                    <i class="bi bi-cart" style="font-size: 1.5rem;"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        <c:out value="${sessionScope.cart != null ? sessionScope.cart.size() : 0}" />
                    </span>
                </a>

                <!-- Language selector -->
                <form class="d-flex">
                    <select class="form-select" onchange="location.href='changeLanguage?lang=' + this.value">
                        <option value="en" ${sessionScope.lang == 'en' ? 'selected' : ''}>English</option>
                        <option value="fr" ${sessionScope.lang == 'fr' ? 'selected' : ''}>Français</option>
                    </select>
                </form>
            </div>
        </div>
    </nav>
</header>
