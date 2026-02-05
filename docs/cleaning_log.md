Payments table was derived from the LendingClub accepted loans dataset.
No synthetic data was generated. Payment behavior features were constructed
using installment amounts, total payments received, outstanding principal,
and loan status fields to approximate early delinquency signals.


## Raw Data Storage and Access

Raw LendingClub loan data and macroeconomic datasets are stored locally
within the project directory under data/raw and are excluded from version
control. Large datasets were loaded directly using Python to avoid data
truncation and integrity issues associated with spreadsheet software.
