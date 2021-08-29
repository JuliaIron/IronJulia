CREATE DATABASE lab_db;
DROP DATABASE IF EXISTS lab_db;
CREATE DATABASE IF NOT EXISTS lab_db CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE lab_db;
-- import csv file with data through Table Data Import Wizard

-- rename the table to a shorter name
ALTER TABLE `lab_db`.`data_marketing_customer_analysis_round2` 
RENAME TO  `lab_db`.`customer_analysis`;

-- standardize column names: replace empty spaces, lower letters, change data types   (manually, using interface)

ALTER TABLE `lab_db`.`customer_analysis` 
CHANGE COLUMN `MyUnknownColumn` `my_unknown_column` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer` `customer` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `State` `state` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer Lifetime Value` `customer_lifetime_value` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Response` `response` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Coverage` `coverage` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Education` `education` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Effective To Date` `effective_to_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `EmploymentStatus` `employment_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Gender` `gender` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Income` `income` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Location Code` `location_code` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Marital Status` `marital_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Monthly Premium Auto` `monthly_premium_auto` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Months Since Last Claim` `months_since_last_claim` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Months Since Policy Inception` `months_since_policy_inception` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Number of Open Complaints` `number_of_open_complaints` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Number of Policies` `number_of_policies` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy Type` `policy_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy` `policy` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Renew Offer Type` `renew_offer_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Sales Channel` `sales_channel` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Total Claim Amount` `total_claim_amount` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Class` `vehicle_class` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Size` `vehicle_size` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Type` `vehicle_type` TEXT NULL DEFAULT NULL ;

-- delete column customer as it is only a unique identifier for each row of data

ALTER TABLE customer_analysis
DROP COLUMN customer;

-- Check data types of all columns and fix incorrect ones (for ex. customer lifetime value and number of complaints )

DESCRIBE lab_db.customer_analysis;
-- customer_lifetime_value is double and has null values 
-- number_of_open_complaints is text and has null values 

ALTER TABLE `lab_db`.`customer_analysis` 
CHANGE COLUMN `customer_lifetime_value` `customer_lifetime_value` INT NULL DEFAULT NULL ;

-- 1. removing the unnecessary digits after the first ".". Only the first number shows the number of complaints
SELECT LEFT(number_of_open_complaints,1) AS number_of_open_complaints_cleaned
FROM customer_analysis;
-- 2. changing from text to integer 
ALTER TABLE customer_analysis
MODIFY COLUMN number_of_open_complaints_cleaned INT;

-- replace null values (instead of empty fields, replace wih 0)
SELECT number_of_open_complaints, COALESCE(number_of_open_complaints,0)
from customer_analysis;

-- alternative to replace null values with 0
--- SELECT IFNULL (number_of_open_complaints,0)
-- from customer_analysis;


 
SELECT * FROM customer_analysis;


-- find dublicates 
-- https://phoenixnap.com/kb/mysql-find-duplicates