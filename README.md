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
  Source: Adarsh S. (Kaggle). *Lending Club Loan Data CSV*.  
  Available at: https://www.kaggle.com/datasets/adarshsng/lending-club-loan-data-csv



- **Federal Reserve Economic Data (FRED)**  
  Macroeconomic indicators from 2007-06-01 TO 2018-11-01, including:
  
  - Unemployment Rate (UNRATE)
    https://fred.stlouisfed.org/series/UNRATE
  
  - Federal Funds Effective Rate (FEDFUNDS)
    https://fred.stlouisfed.org/series/FEDFUNDS
  
  - Consumer Price Index for All Urban Consumers (CPIAUCSL)
    https://fred.stlouisfed.org/series/CPIAUCSL 


All data used in this project is publicly available and complies with TCPS 2 ethical standards.

⚠️ Raw datasets are **not included in this repository** due to size constraints.

---

## Reproducibility Instructions

### 1️⃣ Place Raw Data

Place LendingClub dataset at:

'data/raw/lendingclub/loan.csv'

Place FRED macro datasets at:

'data/raw/macro/'
  UNRATE.csv
  FEDFUNDS.csv
  CPIAUCSL.csv

### 2️⃣ Run Notebooks in Order

1. `01_EDA.ipynb`
2. `02_Data_Preprocessing_and_Feature_Engineering.ipynb`
3. `03_Modeling_and_Evaluation.ipynb`

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
- Logistic Regression (interpretable baseline)
- XGBoost (primary nonlinear model)
- Class imbalance handling via `scale_pos_weight`
- ROC-AUC and PR-AUC evaluation
- Threshold optimization for operational policy scenarios
- Calibration analysis
- Lift and risk-decile segmentation

---

## Final Model Selection

Two modeling pipelines were evaluated:

- Baseline (origination-only features)
- Macro-augmented (origination + FRED indicators)

Macroeconomic variables did not improve predictive performance for early default detection.

Final selected model:
- **XGBoost (origination features only)**
- ROC-AUC ≈ 0.72
- Top decile lift ≈ 3.0x

---

## Key Results

- Early default rate in test set: ~2.3%
- Logistic Regression ROC-AUC: ~0.72 (baseline benchmark)
- XGBoost ROC-AUC: ~0.72 (primary production model)
- Top risk decile default rate: ~6.9%
- Top decile lift: ~3.0x relative to portfolio average

Operational scenario example:
- Reviewing top 20% highest-risk loans captures ~47% of early defaults
- Reviewing top 30% captures ~60% of early defaults

---

## Repository Structure

```
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
```

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

## Operational Interpretation

The model is designed to support early intervention strategies.

Instead of binary approve/deny decisions, the model enables:

- Targeted review of high-risk loans
- Early borrower outreach programs
- Risk-adjusted pricing strategies
- Portfolio-level monitoring

Thresholds can be adjusted depending on institutional risk appetite.

---

## Technical Stack

- Python (Pandas, NumPy, Scikit-learn, XGBoost)
- MySQL (Analytical Views & Data Modeling)
- Power BI (Dashboard Visualization)
- Git & GitHub (Version Control)

---

## Limitations

- Dataset limited to LendingClub historical portfolio
- Kaggle version may differ from official LendingClub release
- Macroeconomic features limited to selected indicators
- No causal inference performed (predictive modeling only)

---

## Future Enhancements

- Survival analysis for time-to-default modeling
- SHAP values for advanced model interpretability
- Fairness and bias evaluation across borrower groups
- Real-time scoring pipeline deployment

--

## Ethics & Responsible Use

This project uses anonymized secondary data and is TCPS 2 exempt.

The model is designed as a **decision-support tool**, not an automated approval or rejection system.

Key considerations include:

- Model transparency
- Threshold-based policy decisions
- Recall-focused risk mitigation
- Responsible use of predictive analytics

Final credit decisions should incorporate human review and institutional risk policy.

---

## Authors

- Daniel Sotelo  
- Javier Correa  
- Jorge Corzo  
- Anisha K C  
