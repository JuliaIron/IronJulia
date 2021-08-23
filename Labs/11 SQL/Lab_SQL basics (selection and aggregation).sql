-- query 1: Get the id values of the first 5 clients from district_id with a value equals to 1.
select * from bank.client;
select distinct client_id from bank.client where district_id = 1 limit 5;

-- query 2: In the client table, get an id value of the last client where the district_id equals to 72.
select distinct client_id from bank.client where district_id = 72 ORDER BY client_id DESC limit 1;

-- query 3: Get the 3 lowest amounts in the loan table.
select * from bank.loan;
select amount from bank.loan order by amount asc limit 3;

-- query 4: What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select * from bank.loan;
select distinct status from bank.loan order by status asc;

-- query 5: What is the loan_id of the highest payment received in the loan table?
select * from bank.loan;
select loan_id from bank.loan where payments order by payments asc limit 1;

-- query 6: What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
select * from bank.loan;
select account_id, amount from bank.loan where amount order by account_id asc limit 5;

-- query 7: What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select * from bank.loan;
select account_id from bank.loan where duration = 60 order by amount asc;

-- query 8: What are the unique values of k_symbol in the order table?
-- Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
select * from bank.order;
#ELECT distinct k_symbol from bank.order AS bank.orderings;

-- query 9:In the order table, what are the order_ids of the client with the account_id 34?
select * from bank.order;
select order_id from bank.order where account_id=34;

-- query 10: In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select * from bank.order;
select distinct account_id from bank.order where order_id>29540 and order_id<=29560;

-- query 11: In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select * from bank.order;
select amount from bank.order where account_to=30067122;

-- query 12: In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select * from bank.trans;
select trans_id, `date`, `type`, amount from bank.trans where account_id = 793 order by `date`desc limit 10;

-- query 13: In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
select * from bank.client;
select distinct district_id, count(*) from bank.client
where district_id<10
group by district_id
order by district_id asc;

-- query 14:
-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select distinct type, count(card_id)
from bank.card
group by type
order by card_id desc;

-- query 15:
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select distinct account_id, sum(amount)
from bank.loan
group by account_id
order by amount desc
limit 10;

-- query 16:   SOLUTION? 
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select count(loan_id), `date`
from bank.loan
group by `date`
order by `date`
having `date`>930907;

-- query 17: SOLUTION?
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
-- ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
select `date`, duration, count(loan_id)
from bank.loan
where date regexp"^9312"
group by duration
order by date desc, duration desc;

-- query 18:
-- In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). 
-- Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
select account_id, type, sum(amount) AS total_amount
from bank.trans
where account_id=396
group by type
order by type asc;

-- query 19: SOLUTION TRANSLATE? 
-- From the previous output, translate the values for type to English, 
-- rename the column to transaction_type, round total_amount down to an integer
select account_id, type, ceiling(sum(amount)) AS total_amount
from bank.trans
where account_id=396
group by type
order by type asc;

-- query 20:
-- From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.
select account_id, 
from bank.trans
where account_id=396
group by type 

-- query 21:
-- Continuing with the previous example, rank the top 10 account_ids based on their difference.
select account_id
from bank.trans
where 
order by difference;




