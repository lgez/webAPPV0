package session3.webappv0.data_access;

import session3.webappv0.model.Product;

import java.util.List;

public interface IproductDAO {

    public List<Product> findAll();

    public Product findById(int id);

    List<Product> findFiltered(String[] modes, String[] levels, boolean under200);

}
