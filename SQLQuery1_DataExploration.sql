


-- Covid Vaccinations Data by Country and Date
Select * from DAProject1..CovidVaccinations$
order by 3,4

-- Find Country, Date, Total Covid Cases, New Covid Cases of the day, Total Deaths by Country and Continent
select Location, date, total_cases, new_cases, total_deaths
From DAProject1..CovidDeaths$
order by 1,2;

-- Change all zero values and NULL values into a single value
UPDATE DAProject1..CovidDeaths$ SET total_cases=0 WHERE total_cases IS NULL
UPDATE DAProject1..CovidDeaths$ SET total_deaths=0 WHERE total_deaths IS NULL

-- Find percentage death by calculationg total deaths by total cases for each day
select Location, date, total_cases, new_cases, total_deaths, (total_deaths/NULLIF(total_cases,0))*100 as DeathPercentage
From DAProject1..CovidDeaths$
order by 1,2;

-- Find percentage infected by calculationg total cases by population for each day
select Location, date, total_cases, population, (total_cases/population)*100 as InfectPercentage
From DAProject1..CovidDeaths$
order by 1,2;

--Countries with Highest Infection Rate compared to Population
select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From DAProject1..CovidDeaths$
Group By Location, Population
order by 1,2;

--Countries with Highest Death Count per Population
select Location, population, MAX(total_deaths) as HighestDeathCount, MAX((total_deaths/population))*100 as PercentPopulationDead
From DAProject1..CovidDeaths$
Group By Location, Population
order by HighestDeathCount desc

--Join CovidDeaths and CovidVaccinations Tables
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_cases, vac.new_vaccinations
FROM DAProject1..CovidDeaths$ dea
JOIN DAProject1..CovidVaccinations$ vac
	ON dea.location = vac.location 
	and dea.date=vac.date
order by 2,6

-- Join CovidDeaths and CovidVaccinations Tables to find total deaths of smokers by country
SELECT dea.location, SUM(dea.population) AS total_population, SUM(dea.new_cases) AS total_cases, (SUM(vac.female_smokers) + SUM(vac.male_smokers))/2 AS total_smokers, SUM(dea.total_deaths)/NULLIF((SUM(vac.female_smokers) + SUM(vac.male_smokers))/2,0)*100 AS PercentageSmokerDeath
FROM DAProject1..CovidDeaths$ dea
JOIN DAProject1..CovidVaccinations$ vac
	ON dea.location = vac.location 
	GROUP BY dea.location
order by 1,2

