package session3.webappv0.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import session3.webappv0.data_access.ProductDAOJpa;
import session3.webappv0.model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/testProducts")
public class ProductTestServlet extends HttpServlet {

    private ProductDAOJpa productDAO = new ProductDAOJpa();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        List<Product> products = productDAO.findAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }
}
