<%--
  Created by IntelliJ IDEA.
  User: lgezc
  Date: 2025-08-13
  Time: 12:56 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<footer class="bg-dark text-white text-center py-3 mt-5">
  <fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
  <fmt:setBundle basename="messages" />
  <p class="mb-0"><fmt:message key="footer.text"/></p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
