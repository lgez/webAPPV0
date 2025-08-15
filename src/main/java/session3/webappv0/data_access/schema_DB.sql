
CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(100)
);
CREATE TABLE comment (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         user_id INT,
                         content TEXT,
                         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (user_id) REFERENCES user(id)
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

