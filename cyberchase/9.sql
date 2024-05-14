SELECT COUNT("episode_in_season") AS "six_year_count" FROM "episodes" WHERE "air_date" 
BETWEEN date('2002-01-01') AND date('2007-12-31');