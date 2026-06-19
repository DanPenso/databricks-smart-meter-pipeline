# Databricks Smart Meter Pipeline

End-to-end analytics project using **Databricks SQL** and **Tableau** to explore London household electricity usage from smart meter data.

## Pipeline

```
block_0 + informations_households
        ↓  join_meter_readings.sql
   silver_smart_meter
        ↓  gold_peak_usage_tableau.sql
   gold_peak_usage_tableau
        ↓  CSV export
   Tableau dashboard
```

| Layer | Table | Description |
|-------|-------|-------------|
| Bronze | `block_0` | Raw half-hourly readings |
| Reference | `informations_households` | ACORN neighborhood type, tariff (Std / ToU) |
| Silver | `silver_smart_meter` | Joined readings + household metadata |
| Gold | `gold_peak_usage_tableau` | Aggregated for BI (hour, day, group, tariff) |

## Data source

[Smart Meters in London (Kaggle)](https://www.kaggle.com/datasets/jeanmidev/smart-meters-in-london)

Raw files are not committed to this repo. See [`data/README.md`](data/README.md) for download instructions.

## SQL scripts

Run in order from [`sql/`](sql/):

1. `join_meter_readings.sql` — build silver layer
2. `gold_peak_usage_tableau.sql` — build gold layer for Tableau
3. `aggregate_peak_usage.sql` — simpler gold table (ACORN × hour only)

Export `gold_peak_usage_tableau` to CSV for Tableau, or use the committed export in [`data/exports/london_energy_tableau.csv`](data/exports/london_energy_tableau.csv).

## Dashboard

**Workbook:** [`tableau/London_energy.twb`](tableau/London_energy.twb)

![London Affluent Household Electricity Use — Tableau dashboard](tableau/screenshots/dashboard.png)

<!-- Add when published to Tableau Public: -->
<!-- **[View dashboard on Tableau Public](https://public.tableau.com/views/...)** -->

### Findings

- Evening peak demand between **5–9 PM**
- Clear daily load curve: low overnight usage, ramp-up from late afternoon
- Heatmap shows hour × day patterns for affluent households (n=48 in block_0)
- Unclassified households (n=2) excluded from comparative charts — sample too small

## Tools

- Databricks (Community / Free Edition)
- Tableau Desktop / Public
- London Low Carbon London smart meter dataset
