use data_marketing_customer_analysis_round2;
SELECT * from lab_group_by_db.data_marketing_customer_analysis_round2;

-- Change column names: replace empty spaces, lower letters, change data types

ALTER TABLE `lab_group_by_db`.`data_marketing_customer_analysis_round2` 
CHANGE COLUMN `Customer` `customer` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `State` `state` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer_Lifetime_Value` `customer_lifetime_value` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Response` `response` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Coverage` `coverage` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Education` `education` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Effective_To_Date` `effective_to_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Employment_Status` `employment_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Gender` `gender` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Income` `income` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Location_Code` `location_code` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Marital_Status` `marital_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Monthly_Premium_Auto` `monthly_premium_auto` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Months_Since Last_Claim` `months_since_last_claim` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Months_Since_Policy_Inception` `months_since_policy_inception` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Number_of_Open_Complaints` `number_of_open_complaints` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Number_of_Policies` `number_of_policies` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy_Type` `policy_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy` `policy` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Renew_Offer_Type` `renew_offer_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Sales_Channel` `sales_channel` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Total_Claim_Amount` `total_claim_amount` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle_Class` `vehicle_class` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle_Size` `vehicle_size` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle_Type` `vehicle_type` TEXT NULL DEFAULT NULL ;

-- 
ALTER TABLE `lab_group_by_db`.`customer_analysis` 
CHANGE COLUMN `customer_lifetime_value` `customer_lifetime_value` INT NULL DEFAULT NULL;

ALTER TABLE customer
MODIFY COLUMN number_of_open_complaints INT;

-- rename the table 
ALTER TABLE `lab_group_by_db`.`data_marketing_customer_analysis_round2` 
RENAME TO  `lab_group_by_db`.`customer_analysis` ;

-- Delete column customer 
ALTER TABLE `lab_group_by_db`.`customer_analysis` 
DROP COLUMN `customer`;





-- Replacing null values in number of open complaints

SELECT number_of_open_complaints FROM customer_analysis
WHERE number_of_open_complaints NOT IN (1,2,3,4,5);

UPDATE customer_analysis
SET number_of_open_complaints = 0
WHERE number_of_open_complaints NOT IN (1,2,3,4,5);

-- Uneabling safe update mode in order to apply replace null values 
SET SQL_SAFE_UPDATES = 0;

-- Change the column to integer

ALTER TABLE customer_analysis
MODIFY COLUMN number_of_open_complaints INT; 

-- Now the column months_since_last_claim

SELECT months_since_last_claim
FROM customer_analysis
WHERE months_since_last_claim="";

SELECT ROUND(AVG(months_since_last_claim))
FROM customer_analysis;

UPDATE customer_analysis     
SET months_since_last_claim = 14
WHERE months_since_last_claim="";

SELECT months_since_last_claim, customer  ### doesnt work because customer has been dropped 
FROM customer_analysis
GROUP BY customer 
order by months_since_last_claim;

-- SET months_since_last_claim = (SELECT ROUND(AVG(months_since_last_claim)) FROM customer_analysis)
-- WHERE months_since_last_claim="";

