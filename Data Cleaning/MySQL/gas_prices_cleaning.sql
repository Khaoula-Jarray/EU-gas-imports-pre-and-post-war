-- data cleaning for the 'raw_natural_gas_prices' dataset :

# create another dataset and keep the raw one untouched
CREATE TABLE natural_gas_prices_staging
LIKE raw_natural_gas_prices;

INSERT INTO natural_gas_prices_staging
SELECT * FROM raw_natural_gas_prices;

# drop the columns I'll not use
ALTER TABLE natural_gas_prices_staging
DROP COLUMN `Open`,
DROP COLUMN `Low`,
DROP COLUMN `High`,
DROP COLUMN `Volume`;

# Rename the colmumns
ALTER TABLE natural_gas_prices_staging
RENAME COLUMN `Date` TO `date`,
RENAME COLUMN `Close` TO `price`;

# changing the datatype from text to date
UPDATE natural_gas_prices_staging
SET `date` = STR_TO_DATE(LEFT(`date`,10),"%Y-%m-%d");

ALTER TABLE natural_gas_prices_staging
MODIFY COLUMN `date` DATE;

# rounding the price to 3 decimal places
UPDATE natural_gas_prices_staging
SET price = ROUND(price,3);

# removing rows of imports after October 2025
DELETE FROM natural_gas_prices_staging
WHERE `date`> "2025-10-31";

