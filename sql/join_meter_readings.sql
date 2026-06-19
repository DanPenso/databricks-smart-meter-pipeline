-- Join smart meter readings with household ACORN classifications
CREATE OR REPLACE TABLE default.silver_smart_meter AS
SELECT
    sm.LCLid,
    sm.tstp,
    CAST(sm.`energy(kWh/hh)` AS DOUBLE) AS energy_kwh,
    a.stdorToU,
    a.Acorn,
    a.Acorn_grouped
FROM default.block_0 sm
LEFT JOIN default.informations_households a ON sm.LCLid = a.LCLid
WHERE sm.`energy(kWh/hh)` IS NOT NULL
    AND sm.`energy(kWh/hh)` != 'Null';
