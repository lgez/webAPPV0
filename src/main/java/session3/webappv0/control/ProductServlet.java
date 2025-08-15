package session3.webappv0.control;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import session3.webappv0.data_access.IproductDAO;
import session3.webappv0.data_access.ProductDAOJpa;
import session3.webappv0.model.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private final IproductDAO productDAO = new ProductDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        int id = Integer.parseInt(idParam);
        Product product = productDAO.findById(id);

        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        request.setAttribute("product", product);
        request.getRequestDispatcher("/WEB-INF/views/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        int id = Integer.parseInt(idParam);
        Product product = productDAO.findById(id);

        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        HttpSession session = request.getSession(); // keeps existing lang and other attributes

        // Retrieve or create cart
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Retrieve or create total
        BigDecimal total = (BigDecimal) session.getAttribute("cartTotal");
        if (total == null) {
            total = BigDecimal.ZERO;
            session.setAttribute("cartTotal", total);
        }

        if ("add".equals(action)) {
            cart.add(product);
            total = total.add(product.getPrix());
            session.setAttribute("cartTotal", total);

            response.sendRedirect(request.getContextPath() + "/products");
        } else if ("buyNow".equals(action)) {
            cart.add(product);
            total = total.add(product.getPrix());
            session.setAttribute("cartTotal", total);

            response.sendRedirect(request.getContextPath() + "/checkout");
        } else {
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }
}

