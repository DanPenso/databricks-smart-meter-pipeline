-- Gold layer export for Tableau (hour, day, tariff, neighborhood type)
CREATE OR REPLACE TABLE default.gold_peak_usage_tableau AS
SELECT
    Acorn_grouped,
    stdorToU,
    HOUR(tstp) AS hour_of_day,
    DAYOFWEEK(tstp) AS day_of_week,
    DATE_FORMAT(tstp, 'EEEE') AS day_name,
    ROUND(AVG(energy_kwh), 4) AS avg_kwh_usage,
    COUNT(*) AS reading_count
FROM default.silver_smart_meter
WHERE Acorn_grouped IS NOT NULL
    AND stdorToU IS NOT NULL
GROUP BY Acorn_grouped, stdorToU, HOUR(tstp), DAYOFWEEK(tstp), DATE_FORMAT(tstp, 'EEEE')
ORDER BY Acorn_grouped, stdorToU, day_of_week, hour_of_day;
