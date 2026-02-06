Create database CapstomP_Risk_A
Character set utf8mb4
collate utf8mb4_unicode_ci;

USE capstomp_risk_a;

CREATE TABLE payments_derived (
    id BIGINT NOT NULL,
    installment DECIMAL(12,2) NOT NULL
        CHECK (installment > 0),
    total_pymnt DECIMAL(14,2) NOT NULL
        CHECK (total_pymnt >= 0),
    last_pymnt_amnt DECIMAL(14,2)
        CHECK (last_pymnt_amnt >= 0),
    last_pymnt_d DATE,
    next_pymnt_d DATE,
    out_prncp DECIMAL(14,2) NOT NULL
        CHECK (out_prncp >= 0),
    loan_status VARCHAR(50) NOT NULL,
    missed_payment_flag SMALLINT NOT NULL DEFAULT 0
        CHECK (missed_payment_flag IN (0,1)),
    late_payment_flag SMALLINT NOT NULL DEFAULT 0
        CHECK (late_payment_flag IN (0,1)),
    payment_ratio DECIMAL(10,6)
        CHECK (payment_ratio >= 0),
    CONSTRAINT pk_payments_derived
        PRIMARY KEY (id)
);




