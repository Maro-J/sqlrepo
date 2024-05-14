SELECT COUNT("english_title") AS "east_cap_count" 
FROM "views" WHERE "artist" = 'Hiroshige'
AND "english_title" LIKE '%Eastern Capital%';