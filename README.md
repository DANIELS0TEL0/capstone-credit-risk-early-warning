# Credit Default Early-Warning System

## Project Overview
This repository contains the capstone project for the **Master of Data Analytics** program.  
The project develops an **early-warning credit default prediction system** for unsecured consumer loans, simulating a real-world credit risk analytics consulting engagement.

The objective is to estimate the **probability of default (90+ days delinquent within six months of loan origination)** using borrower characteristics, loan attributes, early payment behavior, and macroeconomic indicators.

---

## Business Problem
Unsecured consumer lending exposes financial institutions to elevated credit default risk.  
Traditional underwriting models rely primarily on static application-stage variables and may fail to detect early behavioral signals that indicate increased default risk.

This project addresses the following question:

> *How can early payment behavior and economic context improve the prediction of loan default, enabling proactive risk management and loss mitigation?*

---

## Data Sources
- **LendingClub Loan Data (Public, Anonymized)**  
  Historical unsecured consumer loan performance data.
- **Federal Reserve Economic Data (FRED)**  
  Macroeconomic indicators including unemployment rate and interest rates.

All data used in this project is publicly available and complies with TCPS 2 ethical standards.

---

## Analytical Approach
The project follows a full analytics lifecycle:
1. Data collection and cleaning
2. Feature engineering (application and early behavioral signals)
3. Exploratory data analysis
4. Predictive modeling and validation
5. Model diagnostics and fairness checks
6. Visualization and actionable recommendations

Advanced analytics methods include:
- Logistic regression
- Gradient boosting classifiers
- Time-based validation
- Model calibration and diagnostics

---

## Repository Structure
- `/data` – Raw and processed datasets  
- `/sql` – Database schema and ETL scripts  
- `/src` – Python notebooks for analysis and modeling  
- `/powerbi` – Dashboard for insight delivery  
- `/report` – Proposal and final report drafts  
- `/docs` – Documentation, data dictionary, and ethics certification  

---

## Ethics & Compliance
This project uses anonymized secondary data and is **TCPS 2 exempt**.  
All analyses are conducted as decision-support tools, with attention to fairness, transparency, and responsible use of analytics.

---

## Authors
- Daniel Sotelo  
- Javier Correa 
- Jorge Corzo
- Anisha K C
