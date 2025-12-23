-- data cleaning for the 'raw_imports by_country' dataset :

# create another dataset and keep the raw one untouched
CREATE TABLE imports_by_country_staging
LIKE raw_imports_by_country;

INSERT INTO imports_by_country_staging
SELECT * FROM raw_imports_by_country;

# counting all rows before handling nulls
SELECT COUNT(*)
FROM imports_by_country_staging; -- 678 row

# removing all countries' data where their total imports is 0
SELECT DISTINCT country FROM imports_by_country_staging
WHERE supplier LIKE 'total' AND volume = 0; -- find the list of countries to remove

SELECT * FROM imports_by_country_staging
WHERE country IN ('Cyprus','Iceland','Montenegro','Albania'); -- to check that they have 0 for all their data

DELETE FROM imports_by_country_staging
WHERE country IN ('Cyprus','Iceland','Montenegro','Albania');

# counting rows after removing some of them
SELECT COUNT(*)
FROM imports_by_country_staging; -- 612 row