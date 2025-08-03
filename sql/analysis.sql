CREATE OR REPLACE VIEW startup_metrics_view AS
SELECT
	g."Country Name",
    g."Country Code",
    g."Year",
	g."Value" AS gdp_value,
    i."Value" AS inflation_value,
    n."Value" AS new_business_density_value,
    r."Value" AS rnd_value
FROM gdp_data g
LEFT JOIN inflation_data i 
    ON g."Country Code" = i."Country Code" AND g."Year" = i."Year"
LEFT JOIN new_business_density_data n 
    ON g."Country Code" = n."Country Code" AND g."Year" = n."Year"
LEFT JOIN "r&d_data" r 
    ON g."Country Code" = r."Country Code" AND g."Year" = r."Year"
WHERE g."Year" BETWEEN 2006 AND 2022
    AND g."Value" IS NOT NULL
    AND i."Value" IS NOT NULL
    AND n."Value" IS NOT NULL
    AND r."Value" IS NOT NULL;

SELECT 
    (SELECT COUNT(*) FROM startup_metrics_view) AS total_records,
    (SELECT COUNT(DISTINCT "Country Code") FROM startup_metrics_view) AS total_countries;

SELECT
    "Country Name",
    ROUND(AVG(gdp_value)::numeric, 2) AS avg_gdp,
    ROUND(AVG(inflation_value)::numeric, 2) AS avg_inflation,
    ROUND(AVG(new_business_density_value)::numeric, 2) AS avg_new_business_density,
    ROUND(AVG(rnd_value)::numeric, 2) AS avg_rnd
FROM startup_metrics_view
GROUP BY "Country Name"
ORDER BY avg_gdp DESC
LIMIT 10;

SELECT 
    "Year",
    ROUND(AVG(gdp_value)::numeric,2) AS avg_gdp,
    ROUND(AVG(inflation_value)::numeric,2) AS avg_inflation,
    ROUND(AVG(new_business_density_value)::numeric,2) AS avg_new_business_density,
    ROUND(AVG(rnd_value)::numeric,2) AS avg_rnd
FROM startup_metrics_view
GROUP BY "Year"
ORDER BY "Year";
