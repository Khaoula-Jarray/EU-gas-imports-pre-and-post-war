CREATE DATABASE EU_gas_dataset;

USE EU_gas_dataset;

-- data cleaning for the 'raw_daily_imports' dataest :

# create another dataset and keep the raw one untouched
CREATE TABLE daily_imports_staging
LIKE raw_daily_imports;

INSERT INTO daily_imports_staging
SELECT * FROM raw_daily_imports; -- insert the same data

# drop the columns we'll not use in our analysis
ALTER TABLE daily_imports_staging 
DROP COLUMN `Azerbaijan`,
DROP COLUMN `UK net flows`,
DROP COLUMN `Nord Stream`,
DROP COLUMN `Ukraine Gas Transit`,
DROP COLUMN `Yamal (BY,PL)`,
DROP COLUMN `Turkstream`,
DROP COLUMN `Libya`;

# datatype conversion 
-- date column
UPDATE daily_imports_staging
SET dates = CASE
					WHEN dates LIKE "%Oct" THEN CONCAT( SUBSTRING_INDEX(dates,"-",1),"/10/2025")
                    WHEN dates LIKE "%Nov" THEN CONCAT(SUBSTRING_INDEX(dates,"-",1),"/11/2025")
                    ELSE dates
			END;

UPDATE daily_imports_staging
SET dates = STR_TO_DATE(dates, "%d/%m/%Y"); 

ALTER TABLE daily_imports_staging
MODIFY COLUMN dates DATE;
-- 'EU Total' column and the rest
UPDATE daily_imports_staging
SET `EU Total` = CASE
					WHEN LENGTH(`EU Total`)>3 THEN CONCAT(SUBSTRING_INDEX(`EU Total`,",",1),SUBSTRING_INDEX(`EU Total`,",",-1))
                    ELSE `EU Total`
				END;
                
ALTER TABLE daily_imports_staging
MODIFY Norway INT,
MODIFY Russia INT,
MODIFY Algeria INT,
MODIFY LNG INT,
MODIFY `EU total` INT;

# renaming some columns
ALTER TABLE daily_imports_staging
RENAME COLUMN dates TO `date`,
RENAME COLUMN `EU Total` TO EU_Total;

# checking for null values
SELECT *
FROM daily_imports_staging
WHERE `date` IS NULL
	OR Norway IS NULL
    OR Russia IS NULL
    OR Algeria IS NULL
    OR LNG IS NULL
    OR EU_Total IS NULL; -- 0 null values

# checking for duplicates
SELECT *, COUNT(*) AS 'duplicates_count'
FROM daily_imports_staging
GROUP BY `date`, Norway, Russia, Algeria, LNG, EU_Total
HAVING COUNT(*)>1; -- 0 duplicates

# removing rows of imports after October 2025
DELETE FROM daily_imports_staging
WHERE `date`> "2025-10-31";
# creating another dataset which is more structered
CREATE TABLE daily_imports_clean(
 `date` DATE,
 supplier VARCHAR(20),
 volume int);

INSERT INTO daily_imports_clean(`date`,supplier,volume)
SELECT `date`,'Norway',Norway FROM daily_imports_staging
UNION ALL
SELECT `date`,'Algeria',Algeria FROM daily_imports_staging
UNION ALL
SELECT `date`,'Russia',Russia FROM daily_imports_staging
UNION ALL
SELECT `date`,'LNG',LNG FROM daily_imports_staging
UNION ALL
SELECT `date`,'Total',EU_Total FROM daily_imports_staging;



