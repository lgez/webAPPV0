
CREATE TABLE costumer (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(100)
);
CREATE TABLE comment (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         costumer_id INT,
                         content TEXT,
                         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (costumer_id) REFERENCES customer(id)
);



CREATE TABLE product (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         title VARCHAR(100) NOT NULL,
                         release_date DATE,
                         mode VARCHAR(50),
                         certification_level VARCHAR(20),
                         description VARCHAR(500),
                         duration_hours INT,
                         product_key VARCHAR(50) UNIQUE,
                         path VARCHAR(100)
);

ALTER TABLE product
    DROP COLUMN path;

CREATE TABLE transaction (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             customer_id INT NOT NULL,
                             product_id INT NOT NULL,
                             purchase_date DATE NOT NULL,
                             quantity INT,
                             price_at_purchase DECIMAL(10, 2),
                             CONSTRAINT fk_transaction_customer
                                 FOREIGN KEY (customer_id) REFERENCES customer(id),
                             CONSTRAINT fk_transaction_product
                                 FOREIGN KEY (product_id) REFERENCES product(id)
);
