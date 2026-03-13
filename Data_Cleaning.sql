SELECT
    d.date_sold,
    r.region AS region,
    d.suburb AS suburb,
    d.type AS property_type,
    d.price AS price,
    i.weekly_household_income AS weekly_household_income,
    ROUND(i.weekly_household_income * 52, 0) AS estimated_annual_household_income,
    ROUND(1.0 * d.price / (i.weekly_household_income * 52), 2) AS affordability_ratio,
    d.km_from_cbd AS km_from_cbd,
    d.num_bed,
    d.num_bath,
    d.num_parking,
    d.property_size
FROM domain_properties d
JOIN regions r
    ON TRIM(LOWER(d.suburb)) = TRIM(LOWER(r.suburb))
JOIN income_data i
    ON TRIM(LOWER(d.suburb)) = TRIM(LOWER(i.suburb))
WHERE d.type IN ('House', 'Apartment / Unit / Flat')
  AND d.price IS NOT NULL
  AND d.price > 0
  AND i.weekly_household_income IS NOT NULL
  AND i.weekly_household_income > 0;
