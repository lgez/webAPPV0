package session3.webappv0.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import session3.webappv0.data_access.*;
import session3.webappv0.model.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/checkout.jsp").forward(request, response);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        BigDecimal total = (BigDecimal) session.getAttribute("cartTotal");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        if (total == null) {
            total = BigDecimal.ZERO;
            session.setAttribute("cartTotal", total);
        }

        String removeId = request.getParameter("removeId");

        if (removeId != null && !removeId.isEmpty()) {
            // Remove a single product from the cart
            int idToRemove = Integer.parseInt(removeId);

            Iterator<Product> iterator = cart.iterator();
            while (iterator.hasNext()) {
                Product p = iterator.next();
                if (p.getId() == idToRemove) {
                    total = total.subtract(p.getPrix());
                    iterator.remove();
                    break;
                }
            }
            session.setAttribute("cartTotal", total);
            response.sendRedirect(request.getContextPath() + "/checkout");
            return;
        }


        String customerName = request.getParameter("customerName");

        if (customerName != null && !customerName.trim().isEmpty() && !cart.isEmpty()) {

            IproductDAO productDAO = new ProductDAOJpa();
            ICustomerDAO customerDAO = new CustomerDAOJpa();
            ITransactionDAO transactionDAO = new TransactionDAOJpa();

            CheckoutService checkoutService = new CheckoutService(productDAO, customerDAO, transactionDAO);

            // Extract product IDs
            List<Integer> productIds = cart.stream().map(Product::getId).toList();

            try {
                checkoutService.processCheckout(customerName, productIds);
            } catch (Exception e) {
                e.printStackTrace();

                request.setAttribute("error", "Checkout failed. Try again.");
                request.getRequestDispatcher("/WEB-INF/views/checkout.jsp").forward(request, response);
                return;
            }

            // Clear cart after successful purchase
            cart.clear();
            session.setAttribute("cartTotal", BigDecimal.ZERO);
        }


        response.sendRedirect(request.getContextPath() + "/orderConfirmation");
    }

}