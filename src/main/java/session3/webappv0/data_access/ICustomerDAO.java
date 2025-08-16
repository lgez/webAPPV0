package session3.webappv0.data_access;

import session3.webappv0.model.Customer;

public interface ICustomerDAO {
    Customer save(Customer customer);
}
