# the monthly imports by supplier in 2022 
SELECT MONTHNAME(`date`) AS 'month',
       MONTH(`date`) 'MonthNum', 
	   supplier, 
       SUM(volume) AS volume
FROM daily_imports_clean
WHERE YEAR(`date`) = 2022 AND supplier NOT LIKE 'total'
GROUP BY 1,2,3;

# the monthly imports from russia from 2021 to Oct-2025
SELECT YEAR(`date`) AS 'year',
	   MONTHNAME(`date`) 'month',
       MONTH(`date`) 'MonthNum',
       SUM(volume) AS 'imports'
FROM daily_imports_clean
WHERE supplier LIKE 'russia'
GROUP BY 1,2,3;

# how much the imports from russia decreased
SELECT YEAR(`date`) 'year', SUM(volume) 'volume'
FROM daily_imports_clean
WHERE (YEAR(`date`) = 2021 OR YEAR(`date`) = 2024) AND supplier LIKE 'russia'
GROUP BY 1;

# The most dependent countries on Russian gas by country in 2021 
WITH  total_imports AS (
SELECT country, volume
FROM imports_by_country_staging
WHERE supplier LIKE "Total" AND year = 2021)
SELECT A.country, round((A.volume/B.volume),2) AS 'dependency_on_Russia'
FROM imports_by_country_staging AS A 
JOIN total_imports AS B
ON A.country = B.country
WHERE A.year = 2021 AND A.supplier LIKE "russia" AND round((A.volume/B.volume),2) >= 0.9
ORDER BY 2 DESC; -- 7 countries

# the dependency by supplier of the same 7 countries from 2021 to 2023
WITH  total_imports AS (
SELECT country, volume, year
FROM imports_by_country_staging
WHERE supplier LIKE "Total")
SELECT A.year, A.country, A.supplier, round((A.volume/B.volume),2) AS 'dependency'
FROM imports_by_country_staging AS A 
JOIN total_imports AS B
ON A.country = B.country AND A.year = B.year
WHERE A.country IN ( 'Czechia','Latvia' ,'Bosnia and Herzegovina','North Macedonia','Serbia','Moldova','Hungary');


# The gas prices change from 2021 to 2025 (monthly)
SELECT ROUND(AVG(price),2) AS 'price', MONTHNAME(`date`) AS 'month', MONTH(`date`) 'MonthNum', YEAR(`date`) AS 'year'
FROM natural_gas_prices_staging
GROUP BY 2,3,4;
