# EU-gas-imports-(2021-2025)
## Overview
This project aims to analyze the overall change in EU Natural Gas imports from Russia -specifically- and its impact on EU since the Russian invasion of Ukraine in February 2022.
## Research Questions
This project provides an answer to the following questions:
*	How much did Europe reduce its imports from Russia after the war ?
*	Which European countries were the most dependent on Russia ?
*	Which suppliers replaced Russia ?
*	Have Gas prices stabilized after switching suppliers ?
## Dataset
The data was collected from 3 different sources :
- [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table): annual Gas imports of each European country by supplier.
- [Bruegel](https://www.bruegel.org/dataset/european-natural-gas-imports): daily Gas imports of EU by supplier.
- [YahooFinance](https://finance.yahoo.com/quote/TTF%3DF/history/?period1=1611273600&period2=1703203200&frequency=1mo): daily TTF Natural Gas prices.
## Tools & Technologies
* **Excel**
* **Python** (pandas, yfinance)
* **MySQL**
* **Power BI**
## Methodology 
**A. Data Collecting :**\
   In this project we have 3 main tables :
   * raw_daily_imports (2021 - Oct 2025):
      The data was downloaded as an xlsx file.
   * raw_imports_by_country (2014-2023):
      The data was downloaded as an xlsx file.
   * raw_natural_gas_prices (2021-2025):
      The data was collected using the yfinance library(API) in Python.\

**B. Data Cleaning :**\
   Excel was used to just reformulate the dataset imported from [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table).\
   The main tool for data cleaning was MySQL.\
   The detailed data cleaning process is documented in the [/Data Cleaning](https://github.com/Khaoula-Jarray/EU-gas-imports-pre-and-post-war/tree/main/Data%20Cleaning) directory.

**C. Data Analysis :**
   - Aggregated the monthly imports of EU from 2021 to 2025 from Russia to compare the pre- and post-February 2022 supplying trends.
   - Calculated the dependency ratio of European countries on Russian Gas before 2022 to identify the most exposed countries.
   - Identified the suppliers Europe turned to (LNG,Norway,Algeria) by aggregating the EU imports in 2022 and grouping by supplier.
   - Analyzed TTF price trends before and after 2022 to assess market stabilization.
   All the SQL queries are documented in [/Data Analysis/data_analysis.sql](https://github.com/Khaoula-Jarray/EU-gas-imports-pre-and-post-war/blob/main/Data%20Analysis/data_analysis.sql).
## Analysis & Key Insights
- Russian imports reduced by approximately 80% (117K Million m<sup>3</sup>) from **150K** Million m<sup>3</sup> in 2021 to **33K** Million m<sup>3</sup> in 2024, and simultaneously the LNG and Norway imports increased to fulfill the gap (see Figure 2&3).
- The 7 most dependent countries on Russian Gas before 2022 are :\
  100% dependency : Czechia, Latvia, Bosnia and Herzegovina, North Macedonia, Serbia.\
  \>95% dependency : Moldova, Hungary (see Figure 4).
- TTF price increased significantly in 2022, from **47.6** €/MWh in 2021 to **133.3** €/MWh in 2022, and it was back to normal (**41.2** €/MWh) in 2023 (see Figure 5).
## Visualizations
The report :

<img width="1307" height="726" alt="Screenshot 2025-12-23 170449" src="https://github.com/user-attachments/assets/a05711d0-2610-43a2-9275-b04536633e8f" />
>-Figure 1-

EU Monthly Russian Gas imports (Million m³):

<img width="1320" height="714" alt="Screenshot 2025-12-23 170719" src="https://github.com/user-attachments/assets/52b75509-cb7d-49ee-a557-0ea7eaf1c1e3" />
>-Figure 2-

EU monthly Gas imports by supplier in 2022 (Million m³):

<img width="1359" height="703" alt="Screenshot 2025-12-23 170901" src="https://github.com/user-attachments/assets/3f50f6b4-baa1-4214-9c03-d4594442896d" />
>-Figure 3-

The 7 most dependent countries on Russian gas (2021):

<img width="1358" height="702" alt="Screenshot 2025-12-23 170949" src="https://github.com/user-attachments/assets/eba23430-555d-41e3-8ec6-f3b6bfc315f7" />
>-Figure 4-

TTF Natural Gas Prices (€/MWh) - Monthly Average :

<img width="1355" height="698" alt="Screenshot 2025-12-23 171118" src="https://github.com/user-attachments/assets/b088001f-619e-4488-9410-e9d468b1a71c" />
>-Figure 5-

## Limitations
- **Suppliers**: Not all the suppliers were mentioned, the focus was only on few of them.
- **Time Range**: The last date in data is October 31st 2025 because the data was downloaded in the mid of November 2025. And the year 2025 was not treated as a full year in any comparison.
## Conclusion 







  
