package session3.webappv0.data_access;

import session3.webappv0.model.Transaction;

public interface ITransactionDAO {
    void save(Transaction transaction);
}
