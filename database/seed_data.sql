USE travel_planner;

-- Clear existing data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE itinerary_details;
TRUNCATE TABLE itineraries;
TRUNCATE TABLE reviews;
TRUNCATE TABLE places;
TRUNCATE TABLE cities;
TRUNCATE TABLE categories;
TRUNCATE TABLE users;
TRUNCATE TABLE countries;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Countries
INSERT INTO countries (country_code, country_name) VALUES
('IN','India'), ('US','United States'), ('FR','France'), ('JP','Japan'), ('IT','Italy');

-- 2. Categories
INSERT INTO categories (category_name) VALUES
('Historical'), ('Museum'), ('Park'), ('Religious'), ('Monument'), ('Beach'), ('Shopping'), ('Nature');

-- 3. Cities
INSERT INTO cities (city_id, name, pincode, country_code) VALUES
(1, 'Mumbai','400001','IN'),
(2, 'Pune','411001','IN'),
(3, 'Delhi','110001','IN'),
(6, 'New York','10001','US'),
(11, 'Paris','75000','FR'),
(16, 'Tokyo','100000','JP');

-- 4. Users (Demo User is ID 9)
INSERT INTO users (user_id, name, email, password) VALUES
(1, 'Neha Chavan','neha@email.com','$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e'),
(2, 'Rahul Sharma','rahul@email.com','$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e'),
(9, 'Demo User', 'demo@example.com', '$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e');

-- 5. Places
INSERT INTO places (place_id, city_id, name, description, address, category_id) VALUES
(1, 1, 'Gateway of India', 'Historic monument', 'Mumbai', 5),
(2, 1, 'Marine Drive', 'Seaside promenade', 'Mumbai', 6),
(3, 1, 'Juhu Beach', 'Popular beach', 'Mumbai', 6);

-- 6. Itineraries (One for Demo User ID 9)
INSERT INTO itineraries (itinerary_id, user_id, start_date, end_date, budget, city_id) VALUES
(1, 1, '2025-06-10', '2025-06-12', 8000, 1),
(2, 9, '2025-12-25', '2025-12-28', 5000, 1);

-- 7. Itinerary Details
INSERT INTO itinerary_details (itinerary_id, day_no, place_id) VALUES
(1, 1, 1), (1, 2, 2),
(2, 1, 1), (2, 2, 3);
