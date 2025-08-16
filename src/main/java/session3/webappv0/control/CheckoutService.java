package session3.webappv0.control;

import session3.webappv0.data_access.ICustomerDAO;
import session3.webappv0.data_access.ITransactionDAO;
import session3.webappv0.data_access.IproductDAO;
import session3.webappv0.model.Customer;
import session3.webappv0.model.Product;
import session3.webappv0.model.Transaction;

import java.util.Date;
import java.util.List;

public class CheckoutService {

    private final IproductDAO productDAO;
    private final ICustomerDAO customerDAO;
    private final ITransactionDAO transactionDAO;

    public CheckoutService(IproductDAO productDAO,
                           ICustomerDAO customerDAO,
                           ITransactionDAO transactionDAO) {
        this.productDAO = productDAO;
        this.customerDAO = customerDAO;
        this.transactionDAO = transactionDAO;
    }

    public void processCheckout(String customerName, List<Integer> productIds) {
        // 1. Create and save customer
        Customer customer = new Customer();
        customer.setName(customerName);
        customer = customerDAO.save(customer);

        // 2. For each product ID, create a transaction
        for (Integer productId : productIds) {
            Product product = productDAO.findById(productId);
            if (product == null) {
                throw new RuntimeException("Product not found: " + productId);
            }

            Transaction transaction = new Transaction();
            transaction.setCustomer(customer);
            transaction.setProduct(product);
            transaction.setPurchaseDate(new Date());
            transaction.setQuantity(1); // default or get from form
            transaction.setPriceAtPurchase(product.getPrix());

            transactionDAO.save(transaction);
        }
    }
}
