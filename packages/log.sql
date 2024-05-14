
-- *** The Lost Letter ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue' 
    )
);

-- *** The Devious Delivery ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
);

-- *** The Forgotten Gift ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
);

-- contents of the Forgotten Gift
SELECT "contents" FROM "packages" WHERE "id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
);

-- The driver with the Forgotten Gift 
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
         SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
            )
        )
    );
