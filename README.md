# EU-gas-imports-(2021-2025)
## Overview
This project aims to understand what was the impact on Europe after reducing its imports of Natural Gas from Russia due to the invasion of Ukraine in February 2022 and if there was any risks.\
In this project we'll answer the following questions:
*	How much did Europe reduce its imports from Russia after the war ?
*	Which European countries were the most dependent on Russia ?
*	Which countries replaced Russian Gas ?
*	Have Gas prices stabilized after switching suppliers ?
## Data Collecting & Structuring
The data was collected from 3 sources :
- [Eurostat](https://ec.europa.eu/eurostat/databrowser/view/nrg_ti_gas__custom_19017962/default/table):\
   An xlsx file containing datasets of the annual gas imports of each European country by supplier, from 2014 to 2023.
- [Bruegel](https://www.bruegel.org/dataset/european-natural-gas-imports):\
   A csv file indicating the daily gas imports of Europe from 2021 to October 2025.
- [YahooFinance](https://finance.yahoo.com/quote/TTF%3DF/history/?period1=1611273600&period2=1703203200&frequency=1mo):\
  Daily natural gas prices data (TTF) from 2021 to October 2025 and it was collected using the Yahoo Finance API in Python via the yfinance library.

  
