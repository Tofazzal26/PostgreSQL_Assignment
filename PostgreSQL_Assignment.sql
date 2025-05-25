-- Active: 1747459435807@@127.0.0.1@5432@conservation_db

-- 1️⃣ rangers table create
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)
)

-- 2️⃣ species table create
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
)

-- 3️⃣ sightings table create
CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    FOREIGN KEY (ranger_id) REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES species (species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes VARCHAR(100)
)

-- 1 rangers data insert
INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    )

-- 2 species table insert data
INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    )

-- 3 sightings table data insert
INSERT INTO
    sightings (
        ranger_id,
        species_id,
        sighting_time,
        location,
        notes
    )
VALUES (
        1,
        1,
        '2024-05-10 07:45:00',
        'Peak Ridge',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        '2024-05-12 16:20:00',
        'Bankwood Area',
        'Juvenile seen'
    ),
    (
        3,
        3,
        '2024-05-15 09:10:00',
        'Bamboo Grove East',
        'Feeding observed'
    ),
    (
        2,
        1,
        '2024-05-18 18:30:00',
        'Snowfall Pass',
        NULL
    )

-- 1️⃣ PROBLEM ONE SOLVED
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains')

-- 2️⃣ PROBLEM TWO SOLVED
SELECT COUNT(DISTINCT sightings.species_id) as unique_species_count
FROM sightings

-- 3️⃣ PROBLEM ONE SOLVED
SELECT * FROM sightings WHERE location LIKE '%Pass'

-- 4️⃣ PROBLEM ONE SOLVED
SELECT rangers.name, COUNT(sighting_id) AS total_sightings
FROM sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY
    rangers.name

-- 5️⃣ PROBLEM ONE SOLVED
SELECT common_name
FROM species
WHERE
    species_id NOT IN (
        SELECT DISTINCT
            species_id
        FROM sightings
    )

-- 6️⃣ PROBLEM ONE SOLVED
SELECT common_name, sighting_time, name
FROM
    sightings
    JOIN species ON sightings.species_id = species.species_id
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2

-- 7️⃣ PROBLEM ONE SOLVED
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01'

-- 8️⃣ PROBLEM ONE SOLVED
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- 9️⃣ PROBLEM ONE SOLVED
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        FROM sightings
    )

SELECT * FROM sightings

SELECT * FROM rangers

SELECT * FROM species