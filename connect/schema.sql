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
    "location" TEXT
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
