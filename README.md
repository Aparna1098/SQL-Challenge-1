# SQL-Challenge-1
Project to extract covid deaths and vaccinations data from https://ourworldindata.org/coronavirus. 
Used SQL to find Death percentage by country in all Asian countries.
## Created the following Queries:
1. Covid Vaccinations Data by Country and Date
2. Find Country, Date, Total Covid Cases, New Covid Cases of the day, Total Deaths by Country and Continent
3. Change all zero values and NULL values into a single value
4. Find percentage death by calculationg total deaths by total cases for each day
5. Find percentage infected by calculationg total cases by population for each day
6. Countries with Highest Infection Rate compared to Population
7. Countries with Highest Death Count per Population
8. Join CovidDeaths and CovidVaccinations Tables
9. Join CovidDeaths and CovidVaccinations Tables to find total deaths of smokers by country


### SQL Functions used in Query: SELECT, UPDATE, INSERT, JOINS, NULLIF, GROUP BY, Order By

## Power BI for Data Visualisation
Map Visual : To color code countries by gradient to indicate the sum of total deaths
Table: To calculate death percentage (using DAX functions) by country
Stacked Column Chart : Total deaths by Total Vaccinations for each country. Joined Covid Deaths data and CovidVaccinations data on Power BI model view
