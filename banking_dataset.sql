show databases;
create database banking;
 use banking;


CREATE TABLE accounts (
    account_number INT PRIMARY KEY,
    customer_name VARCHAR(100),
    current_balance DECIMAL(10,2),
    account_type VARCHAR(20)
);

CREATE TABLE transactions (
    trans_id INT PRIMARY KEY,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    date_time DATETIME,
    account_number INT,
    FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);


-- Inserting values

-- accounts table values 
INSERT INTO accounts VALUES (1001, 'Amit Shah', 58500, 'savings');
INSERT INTO accounts VALUES (1002, 'Priya Mehta', 77000, 'current');
INSERT INTO accounts VALUES (1003, 'Rahul Verma', 40100, 'savings');
INSERT INTO accounts VALUES (1004, 'Sneha Patil', 63200, 'current');
INSERT INTO accounts VALUES (1005, 'Karan Desai', 54500, 'savings');
INSERT INTO accounts VALUES (1006, 'Neha Gupta', 97000, 'current');
INSERT INTO accounts VALUES (1007, 'Ravi Iyer', 30300, 'savings');
INSERT INTO accounts VALUES (1008, 'Pooja Nair', 69000, 'current');
INSERT INTO accounts VALUES (1009, 'Vikas Singh', 58300, 'savings');
INSERT INTO accounts VALUES (1010, 'Tanya Joshi', 49200, 'current');


-- transactions table values  
INSERT INTO transactions VALUES (101, 'deposit', 9500, 'now()', 1003);
INSERT INTO transactions VALUES (102, 'withdraw', 2000, 'now()', 1008);
INSERT INTO transactions VALUES (103, 'deposit', 15000, 'now()', 1002);
INSERT INTO transactions VALUES (104, 'withdraw', 4000, 'now()', 1010);
INSERT INTO transactions VALUES (105, 'deposit', 12000, 'now()', 1005);
INSERT INTO transactions VALUES (106, 'withdraw', 3500, 'now()', 1001);
INSERT INTO transactions VALUES (107, 'deposit', 7800, 'now()', 1007);
INSERT INTO transactions VALUES (108, 'withdraw', 1500, 'now()', 1009);
INSERT INTO transactions VALUES (109, 'deposit', 6200, 'now()', 1004);
INSERT INTO transactions VALUES (110, 'withdraw', 10000, 'now()', 1002);
INSERT INTO transactions VALUES (111, 'deposit', 5000, 'now()', 1006);
INSERT INTO transactions VALUES (112, 'deposit', 8800, 'now()', 1009);
INSERT INTO transactions VALUES (113, 'withdraw', 2400, 'now()', 1003);
INSERT INTO transactions VALUES (114, 'deposit', 3000, 'now()', 1008);
INSERT INTO transactions VALUES (115, 'withdraw', 7000, 'now()', 1007);
INSERT INTO transactions VALUES (116, 'deposit', 9200, 'now()', 1010);
INSERT INTO transactions VALUES (117, 'withdraw', 4500, 'now()', 1005);
INSERT INTO transactions VALUES (118, 'deposit', 6000, 'now()', 1001);
INSERT INTO transactions VALUES (119, 'withdraw', 8000, 'now()', 1004);
INSERT INTO transactions VALUES (120, 'deposit', 11000, 'now()', 1006);
