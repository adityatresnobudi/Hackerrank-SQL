select sum(city.population) as sum_population
from city
inner join country on city.countrycode = country.code
where country.continent = 'Asia';
