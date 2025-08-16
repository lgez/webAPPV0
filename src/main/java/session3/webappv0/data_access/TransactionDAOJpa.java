package session3.webappv0.data_access;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import session3.webappv0.model.Transaction;

public class TransactionDAOJpa implements ITransactionDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("CertiPU");

    @Override
    public void save(Transaction transaction) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(transaction);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to save transaction", e);
        } finally {
            em.close();
        }
    }
}
