package session3.webappv0.data_access;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import session3.webappv0.model.Customer;

public class CustomerDAOJpa implements ICustomerDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("CertiPU");

    @Override
    public Customer save(Customer customer) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(customer);
            tx.commit();
            return customer;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to save customer", e);
        } finally {
            em.close();
        }
    }
}
