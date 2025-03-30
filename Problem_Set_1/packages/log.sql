
-- *** The Lost Letter ***
SELECT address, type
FROM addresses
WHERE id = (SELECT address_id
            FROM scans
            WHERE package_id = (SELECT id
                                FROM packages
                                WHERE from_address_id = (SELECT id
                                                         FROM addresses
                                                         WHERE address = "900 Somerville Avenue")
                                AND to_address_id = (SELECT id
                                                     FROM addresses
                                                     WHERE address = "2 Finnigan Street"))
            AND action = "Drop");

-- *** The Devious Delivery ***

-- Find package contents information
SELECT contents
FROM packages
WHERE from_address_id IS NULL;

-- Find address type for where the package drop location
SELECT type
FROM addresses
WHERE id = (SELECT address_id
            FROM scans
            WHERE package_id = (SELECT id
                                FROM packages
                                WHERE from_address_id IS NULL)
                  AND action = "Drop");


-- *** The Forgotten Gift ***

-- Find package contents information
SELECT contents
FROM packages
WHERE from_address_id = (SELECT id
                         FROM addresses
                         WHERE address = "109 Tileston Street")
AND to_address_id = (SELECT id
                     FROM addresses
                     WHERE address = "728 Maple Place");

-- Find driver who currently has the package
SELECT name
FROM drivers
WHERE id = (SELECT driver_id
            FROM scans
            WHERE package_id = (SELECT id
                                FROM packages
                                WHERE from_address_id = (SELECT id
                                                         FROM addresses
                                                         WHERE address = "109 Tileston Street")
                                AND to_address_id = (SELECT id
                                                     FROM addresses
                                                     WHERE address = "728 Maple Place"))
            ORDER BY timestamp DESC
            LIMIT 1);
