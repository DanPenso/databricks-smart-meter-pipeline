# Data

Raw smart meter files are not stored in this repository (too large for GitHub).

## Source

[Smart Meters in London (Kaggle)](https://www.kaggle.com/datasets/jeanmidev/smart-meters-in-london)

Download:

- `halfhourly_dataset/block_0.csv` — half-hourly meter readings
- `informations_households.csv` — household metadata (ACORN group, tariff type)

Upload both to Databricks before running the SQL scripts in [`../sql/`](../sql/).

## Exports

Pre-aggregated outputs for Tableau live in [`exports/`](exports/):

- `london_energy.csv` — ACORN group × hour of day
- `london_energy_tableau.csv` — ACORN group × tariff × hour × day of week
