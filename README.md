# EU-gas-imports-(2021-2025)
## Overview
This project aims to analyze the overall change in EU Natural Gas imports from Russia (specifically) and it's impacts on EU since the Russian invasion of Ukraine in February 2022. Given that Russian Gas was around 40% of the total Gas imports for EU.
## Research Questions
This project provide an answer to the following questions:
*	How much did Europe reduce its imports from Russia after the war ?
*	Which European countries were the most dependent on Russia ?
*	Which suppliers replaced Russia ?
*	Have Gas prices stabilized after switching suppliers ?
## Dataset
In this project the data was collected from 3 differents sources :
- [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table)
- [Bruegel](https://www.bruegel.org/dataset/european-natural-gas-imports)
- [YahooFinance](https://finance.yahoo.com/quote/TTF%3DF/history/?period1=1611273600&period2=1703203200&frequency=1mo)
## Tools & Technologies
* **Excel**
* **Python** (pandas, yfinance)
* **MySQL**
* **Power BI**
## Methodology 
**A. Data Collecting :**\
   In this project we have 3 main tables :
   1. raw_daily_imports (2021 - Oct 2025):
      The data was downloaded from [Bruegel](https://www.bruegel.org/dataset/european-natural-gas-imports).
   2. raw_imports_by_country (2014-2023):
      The data was downloaded from [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table).
   3. raw_natural_gas_prices (2021-2025):
      The data was collected from [YahooFinance](https://finance.yahoo.com/quote/TTF%3DF/history/?period1=1611273600&period2=1703203200&frequency=1mo) using the
      yfinance library(API) in Python.\

**B. Data Cleaning :**\
   Excel was used to just reformulate the dataset imported from [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table).\
   And the main tool for data cleaning was MySQL.\
   The cleaning process detailed in [Data Cleaning](https://github.com/Khaoula-Jarray/EU-gas-imports-pre-and-post-war/tree/main/Data%20Cleaning).

**C. Data Analysis :**
## Analysis & Key Insights
- The 






  
