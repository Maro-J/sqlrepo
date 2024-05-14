SELECT COUNT("english_title") AS "titles with fuji" FROM "views"
WHERE "artist" = 'Hokusai' AND "english_title" LIKE '%fuji%';