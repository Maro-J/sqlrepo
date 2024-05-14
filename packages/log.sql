
-- *** The Lost Letter ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue' 
    )
    AND "contents" LIKE 'Congratulatory%'
);

-- *** The Devious Delivery ***
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
);

-- *** The Forgotten Gift ***
SELECT * FROM "packages" WHERE "from_address_id" = '109 Tileston Street'
