package session3.webappv0.control;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import session3.webappv0.data_access.IproductDAO;
import session3.webappv0.data_access.ProductDAOJpa;
import session3.webappv0.model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private IproductDAO productDAO = new ProductDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productDAO.findAll();
        request.setAttribute("products", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/products.jsp");
        dispatcher.forward(request, response);
    }
}