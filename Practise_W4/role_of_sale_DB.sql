USE sale_db;

-- Create User Accounts
CREATE USER 'sales'@'localhost' IDENTIFIED BY 'sales$7@7$';
CREATE USER 'marketing'@'localhost' IDENTIFIED BY 'marketing$8@8$';
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev$9@9$';

-- Define Roles
CREATE ROLE 'sales_analyst';
CREATE ROLE 'marketing_viewer';
CREATE ROLE 'developer';

-- Grant Privileges to Roles
GRANT SELECT ON sale_db.sales_data TO 'sales_analyst';
GRANT SELECT ON sale_db.contact_info TO 'marketing_viewer';
GRANT UPDATE ON sale_db.user_accounts TO 'developer';

-- Assign Users To Roles
GRANT 'sales_analyst' TO 'sales'@'localhost';
GRANT 'marketing_viewer' TO 'marketing'@'localhost';
GRANT 'developer' TO 'dev'@'localhost';