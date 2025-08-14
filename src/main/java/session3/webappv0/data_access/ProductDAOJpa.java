package session3.webappv0.data_access;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import session3.webappv0.model.Product;

import java.util.List;

public class ProductDAOJpa implements IproductDAO{



    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("CertiPU");


    @Override
    public List<Product> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Product findById(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }
    }

