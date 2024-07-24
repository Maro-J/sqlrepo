DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "schools_and_universities";
DROP TABLE IF EXISTS "companies";
DROP TABLE IF EXISTS "connections_with_people";
DROP TABLE IF EXISTS "connections_with_school";
DROP TABLE IF EXISTS "connections_with_company";

CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT,
    "password" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools_and_universities" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "type" TEXT,
    "location" TEXT,
    "year_founded" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id") 
);

CREATE TABLE "connections_with_people" (
    "id" INTEGER,
    "connector_1" INTEGER,
    "connector_2" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY("connector_1") REFERENCES "users"("id") ,
    FOREIGN KEY("connector_2") REFERENCES "users"("id")
);

CREATE TABLE "connections_with_school" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start-date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    PRIMARY KEY ("id"),
    FOREIGN KEY("school_id") REFERENCES "school_and_universities"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_with_company" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start-date" NUMERIC,
    "end_date" NUMERIC,
    "title_held" TEXT,
    PRIMARY KEY ("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);


INSERT INTO "users" ("id", "first_name", "last_name", "username", "password")
VALUES
(1, 'Alan', 'Garber', 'alan', 'password'),
(2, 'Reid', 'Hoffman', 'reid', 'password');

INSERT INTO "schools_and_universities" ("name", "type", "location", "year_founded")
VALUES
('Harvard University', 'University', 'Cambridge, Massachusetts', '1636');

INSERT INTO "companies" ("name", "industry", "location")
VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');
('FirstBank', 'Banking & Finance', 'Lagos, Nigeria');

INSERT INTO "connections_with_school" ("user_id", "school_id", "start-date", "end_date", "degree")
VALUES
((SELECT "id" FROM "users" WHERE "first_name" = 'Alan'),(SELECT "id" FROM "schools_and_universities" WHERE "name" = 'Harvard University'), '1973-09-01', '1976-06-01', 'BA')

INSERT INTO "connections_with_company" ("user_id", "company_id", "start-date", "end_date", "title_held")
VALUES
((SELECT "id" FROM "users" WHERE "first_name" = 'Reid'),(SELECT "id" FROM "companies" WHERE "name" = 'LinkedIn'), '2003-01-01', '2007-02-01', 'CEO and Chairman')