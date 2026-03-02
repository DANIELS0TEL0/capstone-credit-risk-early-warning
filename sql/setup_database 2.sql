CREATE DATABASE IF NOT EXISTS credit_risk_capstone;
USE credit_risk_capstone;

SET GLOBAL local_infile = 1;


DROP TABLE IF EXISTS stg_scoring_base;
CREATE TABLE stg_scoring_base (
    id INT AUTO_INCREMENT PRIMARY KEY,
    issue_d DATE,
    early_default TINYINT,
    unemployment_rate DECIMAL(10,4),
    fed_funds_rate DECIMAL(10,4),
    cpi DECIMAL(10,4),
    model_score DECIMAL(10,8)
);


DROP TABLE IF EXISTS stg_scoring_macro;
CREATE TABLE stg_scoring_macro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    issue_d DATE,
    early_default TINYINT,
    unemployment_rate DECIMAL(10,4),
    fed_funds_rate DECIMAL(10,4),
    cpi DECIMAL(10,4),
    model_score DECIMAL(10,8)
);

TRUNCATE TABLE stg_scoring_base;
TRUNCATE TABLE stg_scoring_macro;

LOAD DATA LOCAL INFILE 'C:/Users/bdgsg/Downloads/Capstone Project Dataset/GitHub/capstone-credit-risk-early-warning/data/processed/base_scoring_sql.csv'
INTO TABLE stg_scoring_base
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(issue_d, early_default, unemployment_rate, fed_funds_rate, cpi, model_score);

LOAD DATA LOCAL INFILE 'C:/Users/bdgsg/Downloads/Capstone Project Dataset/GitHub/capstone-credit-risk-early-warning/data/processed/macro_scoring_sql.csv'
INTO TABLE stg_scoring_macro
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(issue_d, early_default, unemployment_rate, fed_funds_rate, cpi, model_score);

SELECT 'BASE' AS table_name, COUNT(*) AS n_rows FROM stg_scoring_base
UNION ALL
SELECT 'MACRO' AS table_name, COUNT(*) AS n_rows FROM stg_scoring_macro;

SELECT * FROM stg_scoring_base  LIMIT 5;
SELECT * FROM stg_scoring_macro LIMIT 5;

