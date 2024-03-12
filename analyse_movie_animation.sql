-- Decouverte de données 

select * from movie_animation;

-- *** Supression des colonnes indesirables **** --

ALTER TABLE movie_animation DROP COLUMN backdrop_path;

ALTER TABLE movie_animation DROP COLUMN homepage;

ALTER TABLE movie_animation DROP COLUMN overview;

ALTER TABLE movie_animation DROP COLUMN imdb_id;

ALTER TABLE movie_animation DROP COLUMN overview;


-- **Verification des doublons ** --
select * from (
			select *, ROW_NUMBER() OVER(PARTITION BY id, title  ORDER BY id) AS rn 
			FROM movie_animation 
) t 
WHERE rn > 1;


-- Nombres des animes par langues originals --
select original_language, COUNT(*) as count
from movie_animation
GROUP BY original_language
ORDER BY count DESC 
LIMIT 10;

Nombre des status par animes 
select status, COUNT(*) as count
from movie_animation
GROUP BY status
ORDER BY count DESC;

-- Nombres de productions par pays --
select production_countries, COUNT(*) as count
from movie_animation
GROUP BY production_countries
ORDER BY count DESC 
LIMIT 10;

-- Nombres production par compagnies --
select production_companies, COUNT(*) as count
from movie_animation
GROUP BY production_companies
ORDER BY count DESC 
LIMIT 10;

-- Anime le plus rentable --
select title, revenue
FROM movie_animation 
ORDER BY revenue DESC
LIMIT 10;

Anime qui a dépensé le plus de budget dans le réalisation --
select title, budget
FROM movie_animation 
ORDER BY budget DESC
LIMIT 10;

Animes le plus long durées -- 
select title, runtime
FROM movie_animation 
ORDER BY runtime DESC
LIMIT 10;

--Anime le plus populaire --
select title, popularity
FROM movie_animation 
ORDER BY popularity DESC
LIMIT 10;



SELECT strftime('%Y', release_date) AS release_year, COUNT(title) AS title_count
FROM movie_animation
GROUP BY strftime('%Y', release_date)
ORDER BY release_year;


select 
	AVG(vote_average) AS vote_min
FROM movie_animation;


SELECT 
	SUM(revenue) AS revenue_total
FROM movie_animation;


SELECT 
	SUM(revenue) AS revenue_total
FROM movie_animation;


SELECT 
    max(revenue) AS max_revenue
FROM movie_animation;


SELECT 
    max(budget) AS max_budget
FROM movie_animation;


SELECT 
    max(runtime) AS max_runtime
FROM movie_animation;

SELECT DISTINCT production_countries
FROM movie_animation;
