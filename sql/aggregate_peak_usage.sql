-- Aggregate peak usage by ACORN group and hour of day
CREATE OR REPLACE TABLE default.gold_peak_usage AS
SELECT
    Acorn_grouped,
    HOUR(tstp) AS hour_of_day,
    ROUND(AVG(energy_kwh), 4) AS avg_kwh_usage
FROM default.silver_smart_meter
WHERE Acorn_grouped IS NOT NULL
GROUP BY Acorn_grouped, HOUR(tstp)
ORDER BY hour_of_day, Acorn_grouped;
