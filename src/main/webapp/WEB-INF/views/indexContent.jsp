
<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-13
  Time: 12:57 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<div class="container mt-4">
  <div class="row">
    <!-- Main content -->
    <div class="col-lg-8">
      <section class="intro mb-4">
        <h2><fmt:message key="intro.title"/></h2>
        <p><fmt:message key="intro.text"/></p>
      </section>
      <section class="first">
        <h1><fmt:message key="products.title"/></h1>
        <p><fmt:message key="products.text"/></p>
        <ul class="list-group">
          <li class="list-group-item"><fmt:message key="products.item1"/></li>
          <li class="list-group-item"><fmt:message key="products.item2"/></li>
          <li class="list-group-item"><fmt:message key="products.item3"/></li>
          <li class="list-group-item"><fmt:message key="products.item4"/></li>
          <li class="list-group-item"><fmt:message key="products.item5"/></li>
          <li class="list-group-item"><fmt:message key="products.item6"/></li>
        </ul>
      </section>
    </div>
    <!-- End Main content -->

    <!-- Aside -->
    <aside class="col-lg-4 mt-4 mt-lg-0">
      <div class="asside">
        <ul>
          <li><a href="products"><fmt:message key="aside.link1"/></a></li>
          <li><a href="#"><fmt:message key="aside.link2"/></a></li>
          <li><a href="#"><fmt:message key="aside.link3"/></a></li>
        </ul>
      </div>
    </aside>
  </div>
</div>
