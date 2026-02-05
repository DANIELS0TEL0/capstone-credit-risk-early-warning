import pandas as pd

df = pd.read_csv (
    r"C:\Users\bdgsg\Downloads\Capstone Project Dataset\loan.csv",
    low_memory=False
)

payments = df[
    [
        "id",
        "installment",
        "total_pymnt",
        "last_pymnt_amnt",
        "last_pymnt_d",
        "next_pymnt_d",
        "out_prncp",
        "loan_status"
    ]
].copy()


payments["missed_payment_flag"] = payments["out_prncp"] > 0
payments["payment_ratio"] = (
    payments["total_pymnt"] /
    (payments["installment"] * 6)
)
payments["late_payment_flag"] = payments["loan_status"].isin(
    ["Late (31-120 days)", "Late (16-30 days)"]
)

payments.to_csv(
    "data/processed/payments_derived.csv",
    index=False
)
