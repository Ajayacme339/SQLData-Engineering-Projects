/*--------------------------------Overview of Data------------------------------------------------------------------------------------------------------------------*/
select * from facts LIMIT 5;
/*-------------------------------------------------Summary Statistics-------------------------------------------------------------------------------------------------------------*/
select MIN(population) AS MIN_POPULATION,MAX(population) AS MAX_POPULATION,MIN(population_growth) AS MIN_POPULATION_GROWTH,MAX(population_growth) AS MAX_POPULATION_GROWTH
from facts;
/*--------------------------------------------------Exploring Outliers------------------------------------------------------------------------------------------------------------*/
select * from facts 
where population = (select MIN(population) from facts);
/*--------------------------------------------------Summary Statistics Recalculated---------------------------------------------------------------------------------------------*/
select MIN(population) AS MIN_POPULATION,MAX(population) AS MAX_POPULATION,MIN(population_growth) AS MIN_POPULATION_GROWTH,MAX(population_growth) AS MAX_POPULATION_GROWTH
from facts where name <> 'World';
/*---------------------------------------------------------Exploring Average Population and Area------------------------------------------------------------------------------*/
select AVG(population) as AVERAGE_POPULATION,AVG(area) as AVERAGE_AREA from facts;
/*---------------------------------------------------Find Densly Populated Countries--------------------------------------*/
select name from facts 
where population > (select AVG(population) from facts where name <> 'World');
/*-----------------------------------------------------------------Finding Countries with the most people-------------------------------------------*/
select * from facts 
where population = (select MAX(population) from facts
                   where name <> 'World');
/*-----------------------------------------------------------Find Country with Highest population growth--------------------------------------*/
select * from facts 
where population_growth = (select MAX(population_growth) from facts where name <> 'World');
/*-------------------------------------------------------------Finding Country with less young population where death rate is more than birth rate-------------*/
select name,population,death_rate,birth_rate from facts 
where death_rate > birth_rate
ORDER BY population ASC;
/*--------------------------------------------------Finding Countries with young population-----------------------------------------------------------*/
select name,population,death_rate,birth_rate from facts 
where birth_rate > death_rate
ORDER BY population;
/*---------------------------------------------------------Find Countries with more water than land----------------------------------------*/
select * from facts 
where area_water > area_land;
/*------------------------------------------------------------------------------------------------------------------------------------------*/
				   
				   


