use banking;

select * from  accounts;
select * from  transactions;

--1. Retrieve all customer names who have a balance greater than 50,000.

Query:
mysql> select * from accounts where current_balance > 50000;

Answer:
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1001 | Amit Shah     |           58500 | savings      |
|           1002 | Priya Mehta   |           77000 | current      |
|           1004 | Sneha Patil   |           63200 | current      |
|           1005 | Karan Desai   |           54500 | savings      |
|           1006 | Neha Gupta    |           97000 | current      |
|           1008 | Pooja Nair    |           69000 | current      |
|           1009 | Vikas Singh   |           58300 | savings      |
+----------------+---------------+-----------------+--------------+
7 rows in set (0.00 sec)


--2. Display account number, customer name, and account type of all customers having SAVINGS accounts.

Query:
mysql> select account_number, customer_name, account_type from accounts where account_type = 'savings';

Answer:
+----------------+---------------+--------------+
| account_number | customer_name | account_type |
+----------------+---------------+--------------+
|           1001 | Amit Shah     | savings      |
|           1003 | Rahul Verma   | savings      |
|           1005 | Karan Desai   | savings      |
|           1007 | Ravi Iyer     | savings      |
|           1009 | Vikas Singh   | savings      |
+----------------+---------------+--------------+
5 rows in set (0.01 sec)


--3. List all transactions made in the current month.

Query:
mysql> select * from transactions where month(date_time) = month(curdate());

Answer:
+----------+------------------+--------+---------------------+----------------+
| trans_id | transaction_type | amount | date_time           | account_number |
+----------+------------------+--------+---------------------+----------------+
|      101 | deposit          |   9500 | 2025-11-03 18:35:41 |           1003 |
|      102 | withdraw         |   2000 | 2025-11-03 18:36:00 |           1008 |
|      103 | deposit          |  15000 | 2025-11-03 18:36:09 |           1002 |
|      104 | withdraw         |   4000 | 2025-11-03 18:36:17 |           1010 |
|      105 | deposit          |  12000 | 2025-11-03 18:36:23 |           1005 |
|      106 | withdraw         |   3500 | 2025-11-03 18:36:29 |           1001 |
|      107 | deposit          |   7800 | 2025-11-03 18:36:36 |           1007 |
|      108 | withdraw         |   1500 | 2025-11-03 18:36:42 |           1009 |
|      109 | deposit          |   6200 | 2025-11-03 18:36:47 |           1004 |
|      110 | withdraw         |  10000 | 2025-11-03 18:36:52 |           1002 |
|      111 | deposit          |   5000 | 2025-11-03 18:36:57 |           1006 |
|      112 | deposit          |   8800 | 2025-11-03 18:37:03 |           1009 |
|      113 | withdraw         |   2400 | 2025-11-03 18:37:10 |           1003 |
|      114 | deposit          |   3000 | 2025-11-03 18:37:16 |           1008 |
|      115 | withdraw         |   7000 | 2025-11-03 18:37:26 |           1007 |
|      116 | deposit          |   9200 | 2025-11-03 18:37:35 |           1010 |
|      117 | withdraw         |   4500 | 2025-11-03 18:37:41 |           1005 |
|      118 | deposit          |   6000 | 2025-11-03 18:38:05 |           1001 |
|      119 | withdraw         |   8000 | 2025-11-03 18:38:17 |           1004 |
|      120 | deposit          |  11000 | 2025-11-03 18:38:27 |           1006 |
+----------+------------------+--------+---------------------+----------------+
20 rows in set (0.00 sec)


--4. Show customers who have not made any transactions yet.

Query:
mysql> select * from accounts where account_number not in (select distinct account_number from transactions);

Answer:
Empty set (0.01 sec)


--5. Show customers who have not made any withdrawal transactions yet.

Query:
mysql> select * from accounts where account_number not in (select distinct account_number from transactions where transaction_type = 'withdraw');

Answer:
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1006 | Neha Gupta    |           97000 | current      |
+----------------+---------------+-----------------+--------------+
1 row in set (0.01 sec)


--6. Display the top 3 customers with the highest account balance.

Query:
mysql> select * from accounts order by current_balance desc limit 3;

Answer:
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1006 | Neha Gupta    |           97000 | current      |
|           1002 | Priya Mehta   |           77000 | current      |
|           1008 | Pooja Nair    |           69000 | current      |
+----------------+---------------+-----------------+--------------+
3 rows in set (0.00 sec)


--7. Retrieve all transactions where the amount is greater than 10,000.

Query:
mysql> select * from transactions where amount > 10000;

Answer:
+----------+------------------+--------+---------------------+----------------+
| trans_id | transaction_type | amount | date_time           | account_number |
+----------+------------------+--------+---------------------+----------------+
|      103 | deposit          |  15000 | 2025-11-03 18:36:09 |           1002 |
|      105 | deposit          |  12000 | 2025-11-03 18:36:23 |           1005 |
|      120 | deposit          |  11000 | 2025-11-03 18:38:27 |           1006 |
+----------+------------------+--------+---------------------+----------------+
3 rows in set (0.01 sec)


--8. Show the total balance of all accounts combined.

Query:
mysql> select sum(current_balance) as Total_Combined_Balance from accounts;

Answer:
+------------------------+
| Total_Combined_Balance |
+------------------------+
|                 597100 |
+------------------------+
1 row in set (0.00 sec)


--9. List customers along with their total deposited amount.

Query:
mysql> SELECT customer_name, sum(transactions.amount) AS Total_Deposited_Amount FROM accounts JOIN transactions ON accounts.account_number = transactions.account_number WHERE transaction_type = 'deposit' GROUP BY customer_name;

Answer:
+---------------+------------------------+
| customer_name | Total_Deposited_Amount |
+---------------+------------------------+
| Rahul Verma   |                   9500 |
| Priya Mehta   |                  15000 |
| Karan Desai   |                  12000 |
| Ravi Iyer     |                   7800 |
| Sneha Patil   |                   6200 |
| Neha Gupta    |                  16000 |
| Vikas Singh   |                   8800 |
| Pooja Nair    |                   3000 |
| Tanya Joshi   |                   9200 |
| Amit Shah     |                   6000 |
+---------------+------------------------+
10 rows in set (0.00 sec)


--10. Find customers who made a withdrawal of more than 5,000.

Query:
mysql> SELECT accounts.account_number, customer_name, account_type, trans_id, transaction_type, amount FROM accounts INNER JOIN transactions ON accounts.account_number = transactions.account_number WHERE transaction_type = 'withdraw' and amount > 5000;

Answer:
+----------------+---------------+--------------+----------+------------------+--------+
| account_number | customer_name | account_type | trans_id | transaction_type | amount |
+----------------+---------------+--------------+----------+------------------+--------+
|           1002 | Priya Mehta   | current      |      110 | withdraw         |  10000 |
|           1007 | Ravi Iyer     | savings      |      115 | withdraw         |   7000 |
|           1004 | Sneha Patil   | current      |      119 | withdraw         |   8000 |
+----------------+---------------+--------------+----------+------------------+--------+
3 rows in set (0.00 sec)


--11. Display the most recent transaction date for each account.

Query 1:
mysql> select account_number, max(date_time) as Recent_Transaction_Date from transactions group by account_number 
order by Recent_Transaction_Date desc;

Answer 1:
+----------------+-------------------------+
| account_number | Recent_Transaction_Date |
+----------------+-------------------------+
|           1006 | 2025-11-03 18:38:27     |
|           1004 | 2025-11-03 18:38:17     |
|           1001 | 2025-11-03 18:38:05     |
|           1005 | 2025-11-03 18:37:41     |
|           1010 | 2025-11-03 18:37:35     |
|           1007 | 2025-11-03 18:37:26     |
|           1008 | 2025-11-03 18:37:16     |
|           1003 | 2025-11-03 18:37:10     |
|           1009 | 2025-11-03 18:37:03     |
|           1002 | 2025-11-03 18:36:52     |
+----------------+-------------------------+
10 rows in set (0.01 sec)

Query 2:
mysql> select transactions.account_number, customer_name, max(date_time) as Recent_Transaction_Date from transactions join accounts 
on transactions.account_number = accounts.account_number group by account_number order by Recent_Transaction_Date desc;

Answer 2:
+----------------+---------------+-------------------------+
| account_number | customer_name | Recent_Transaction_Date |
+----------------+---------------+-------------------------+
|           1006 | Neha Gupta    | 2025-11-03 18:38:27     |
|           1004 | Sneha Patil   | 2025-11-03 18:38:17     |
|           1001 | Amit Shah     | 2025-11-03 18:38:05     |
|           1005 | Karan Desai   | 2025-11-03 18:37:41     |
|           1010 | Tanya Joshi   | 2025-11-03 18:37:35     |
|           1007 | Ravi Iyer     | 2025-11-03 18:37:26     |
|           1008 | Pooja Nair    | 2025-11-03 18:37:16     |
|           1003 | Rahul Verma   | 2025-11-03 18:37:10     |
|           1009 | Vikas Singh   | 2025-11-03 18:37:03     |
|           1002 | Priya Mehta   | 2025-11-03 18:36:52     |
+----------------+---------------+-------------------------+
10 rows in set (0.00 sec)


--12. Retrieve the number of transactions each customer has made.

Query:
mysql> select distinct accounts.account_number, customer_name, count(transactions.account_number) as Number_Of_Transactions 
from transactions join accounts on transactions.account_number = accounts.account_number group by accounts.account_number, customer_name;

Answer:
+----------------+---------------+------------------------+
| account_number | customer_name | Number_Of_Transactions |
+----------------+---------------+------------------------+
|           1001 | Amit Shah     |                      2 |
|           1002 | Priya Mehta   |                      2 |
|           1003 | Rahul Verma   |                      2 |
|           1004 | Sneha Patil   |                      2 |
|           1005 | Karan Desai   |                      2 |
|           1006 | Neha Gupta    |                      2 |
|           1007 | Ravi Iyer     |                      2 |
|           1008 | Pooja Nair    |                      2 |
|           1009 | Vikas Singh   |                      2 |
|           1010 | Tanya Joshi   |                      2 |
+----------------+---------------+------------------------+
10 rows in set (0.00 sec)


--13. List customers who have both SAVINGS and CURRENT accounts (if allowed).

Query:
mysql> select * from accounts where account_type = 'savings' and account_type = 'current';

Answer:
Empty set (0.00 sec)

Explain: Empty Set means no Customer has both type of accounts


--14. Find all accounts created by customers whose name starts with 'P'.

Query:
mysql> select * from accounts where customer_name like 'P%';

Answer:
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1002 | Priya Mehta   |           77000 | current      |
|           1008 | Pooja Nair    |           69000 | current      |
+----------------+---------------+-----------------+--------------+
2 rows in set (0.01 sec)


--15. Retrieve customers sorted by their account balance in descending order.

Query:
mysql> select * from accounts order by current_balance desc;

Answer:
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1006 | Neha Gupta    |           97000 | current      |
|           1002 | Priya Mehta   |           77000 | current      |
|           1008 | Pooja Nair    |           69000 | current      |
|           1004 | Sneha Patil   |           63200 | current      |
|           1001 | Amit Shah     |           58500 | savings      |
|           1009 | Vikas Singh   |           58300 | savings      |
|           1005 | Karan Desai   |           54500 | savings      |
|           1010 | Tanya Joshi   |           49200 | current      |
|           1003 | Rahul Verma   |           40100 | savings      |
|           1007 | Ravi Iyer     |           30300 | savings      |
+----------------+---------------+-----------------+--------------+
10 rows in set (0.00 sec)


--16. Display the average account balance per account type

Query:
mysql> select distinct account_type as Type_Of_Account, avg(current_balance) as Average_Account_Balance from accounts group by account_type;

Answer:
+-----------------+-------------------------+
| Type_Of_Account | Average_Account_Balance |
+-----------------+-------------------------+
| savings         |              48340.0000 |
| current         |              71080.0000 |
+-----------------+-------------------------+
2 rows in set (0.00 sec)

