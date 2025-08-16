package session3.webappv0.data_access;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
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

    @Override
    public List<Product> findFiltered(String[] modes, String[] levels, boolean under200) {
        EntityManager em = emf.createEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT p FROM Product p WHERE 1=1");

            if (modes != null && modes.length > 0) {
                jpql.append(" AND p.mode IN :modes");
            }

            if (levels != null && levels.length > 0) {
                jpql.append(" AND p.certificationLevel IN :levels");
            }

            if (under200) {
                jpql.append(" AND p.prix < 200");
            }

            TypedQuery<Product> query = em.createQuery(jpql.toString(), Product.class);

            if (modes != null && modes.length > 0) {
                query.setParameter("modes", List.of(modes));
            }

            if (levels != null && levels.length > 0) {
                query.setParameter("levels", List.of(levels));
            }

            return query.getResultList();
        } finally {
            em.close();
        }
    }

}

