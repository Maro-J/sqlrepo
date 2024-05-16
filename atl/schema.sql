CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "check_in_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id") 
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourses" TEXT NOT NULL,
    PRIMARY KEY("id") 
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" NUMERIC,
    "airline_id" INTEGER,
    "departure_code" TEXT,
    "arival_code" TEXT,
    "expected_departure_datetime" DATETIME,
    "expected_arrival_datetime" DATETIME,
    PRIMARY KEY ("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id") 
);


-- Inserting values--

INSERT INTO "passengers" ("id", "first_name", "last_name", "age")
VALUES
(1, 'Amelia', 'Earhart', 39);

INSERT INTO "check_ins" ("check_in_datetime", "flight_id")
VALUES
('2023-08-03 15:03', 1);

INSERT INTO "airlines" ("name", "concourses")
VALUES
('Delta', 'A, B, C, D, T');

INSERT INTO "flights" ("flight_number", "airline_id", "departure_code", "arival_code", "expected_departure_datetime", "expected_arrival_datetime")
VALUES
(300, 1, 'ALT300','BOS300', '2023-08-03 18:46', '2023-08-03 21:09');