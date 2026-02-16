# Credit Default Early-Warning System

## Project Overview

This repository contains the capstone project for the **Master of Data Analytics** program.

The project develops an **early-warning credit default prediction system** for unsecured consumer loans, simulating a real-world credit risk analytics consulting engagement.

The objective is to estimate the **probability of early default**, defined as:

> **Charged Off within six months of loan origination**

using borrower characteristics, loan attributes, and macroeconomic indicators.

---

## Business Problem

Unsecured consumer lending exposes financial institutions to elevated credit default risk.

Traditional underwriting models rely primarily on static application-stage variables and may fail to identify borrowers who default shortly after origination.

This project addresses the following question:

> How can early-stage borrower information and economic context be used to predict early default risk and enable proactive credit risk management?

---

## Data Sources

- **LendingClub Loan Data (Public, Anonymized)**  
  Historical unsecured consumer loan performance data.

- **Federal Reserve Economic Data (FRED)**  
  Macroeconomic indicators including unemployment rate and CPI.

All data used in this project is publicly available and complies with TCPS 2 ethical standards.

⚠️ Raw datasets are **not included in this repository** due to size constraints.

---

## Reproducibility Instructions

### 1️⃣ Place Raw Data

Download the LendingClub dataset and place it at:


### 2️⃣ Run Notebooks in Order

1. `01_EDA.ipynb`
2. `02_Data_Preprocessing_and_Feature_Engineering.ipynb`
3. `03_modeling_baseline.ipynb`

This pipeline will:

- Create the early default target
- Engineer origination features
- Train logistic regression and XGBoost models
- Generate evaluation metrics
- Export model artifacts

---

## Modeling Approach

The modeling framework includes:

- Time-based train/test split (pre-2015 vs post-2015)
- Logistic Regression (baseline model)
- XGBoost (gradient boosting classifier)
- Class imbalance handling via `scale_pos_weight`
- ROC-AUC and PR-AUC evaluation
- Threshold optimization for operational policy scenarios
- Lift analysis and risk decile segmentation

---

## Repository Structure

data/
  raw/          (ignored – local only)
  processed/    (ignored – generated locally)

models/
  log_model.joblib
  xgb_model.joblib
  scaler.joblib
  policy_threshold.joblib

notebooks/
  01_EDA.ipynb
  02_Data_Preprocessing_and_Feature_Engineering.ipynb
  03_modeling_baseline.ipynb

sql/
  (SQL schema and analytical views)

powerbi/
  (Power BI dashboard)

report/
  final_report/


---

## SQL & Dashboard Layer

The project includes:

- MySQL schema for analytical tables
- SQL views for:
  - Default rates by month
  - Risk segmentation
  - Lift by decile
  - Operational review scenarios (10% / 20% / 30%)

These views are designed for integration with **Power BI dashboards**.

---

## Ethics & Responsible Use

This project uses anonymized secondary data and is TCPS 2 exempt.

The model is designed as a **decision-support tool**, not an automated approval or rejection system.

Key considerations include:

- Model transparency
- Threshold-based policy decisions
- Recall-focused risk mitigation
- Responsible use of predictive analytics

---

## Authors

- Daniel Sotelo  
- Javier Correa  
- Jorge Corzo  
- Anisha K C  
