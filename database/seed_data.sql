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
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Historical'), (2, 'Museum'), (3, 'Park'), (4, 'Religious'), (5, 'Monument'), (6, 'Beach'), (7, 'Shopping'), (8, 'Nature');

-- 3. Users
INSERT INTO users (user_id, name, email, password) VALUES
(1, 'Neha Chavan','neha@email.com','$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e'),
(2, 'Rahul Sharma','rahul@email.com','$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e'),
(9, 'Demo User', 'demo@example.com', '$2a$10$7bE7VYh5kE3gG0Xg0pX9W.6Q3n5E5V1h2k0Zp4G5v8cF1YzQ7uK6e');

-- 4. Cities (5 per country)
INSERT INTO cities (city_id, name, pincode, country_code) VALUES
-- India
(1, 'Mumbai', '400001', 'IN'),
(2, 'Delhi', '110001', 'IN'),
(3, 'Bangalore', '560001', 'IN'),
(4, 'Hyderabad', '500001', 'IN'),
(5, 'Chennai', '600001', 'IN'),
-- US
(6, 'New York', '10001', 'US'),
(7, 'Los Angeles', '90001', 'US'),
(8, 'Chicago', '60601', 'US'),
(9, 'San Francisco', '94101', 'US'),
(10, 'Miami', '33101', 'US'),
-- France
(11, 'Paris', '75000', 'FR'),
(12, 'Lyon', '69000', 'FR'),
(13, 'Marseille', '13000', 'FR'),
(14, 'Nice', '06000', 'FR'),
(15, 'Bordeaux', '33000', 'FR'),
-- Japan
(16, 'Tokyo', '100-0001', 'JP'),
(17, 'Osaka', '530-0001', 'JP'),
(18, 'Kyoto', '600-0001', 'JP'),
(19, 'Yokohama', '220-0001', 'JP'),
(20, 'Nagoya', '450-0001', 'JP'),
-- Italy
(21, 'Rome', '00100', 'IT'),
(22, 'Milan', '20100', 'IT'),
(23, 'Venice', '30100', 'IT'),
(24, 'Florence', '50100', 'IT'),
(25, 'Naples', '80100', 'IT');

-- 5. Places (5 per city) with estimated_cost
INSERT INTO places (city_id, name, description, address, category_id, estimated_cost) VALUES
-- Mumbai
(1, 'Gateway of India', 'Colonial monument', 'Apollo Bandar', 5, 0),
(1, 'Marine Drive', 'Oceanfront promenade', 'Netaji Subhash Chandra Bose Road', 6, 0),
(1, 'Elephanta Caves', 'Ancient rock-cut caves', 'Elephanta Island', 1, 600),
(1, 'Siddhivinayak Temple', 'Famous Hindu temple', 'Prabhadevi', 4, 0),
(1, 'Chhatrapati Shivaji Maharaj Terminus', 'Historic railway station', 'Fort', 1, 0),
-- Delhi
(2, 'Red Fort', 'Historic fort', 'Netaji Subhash Marg', 1, 500),
(2, 'Qutub Minar', 'Victory tower', 'Mehrauli', 1, 500),
(2, 'India Gate', 'War memorial', 'Rajpath', 5, 0),
(2, 'Lotus Temple', 'Baháʼí House of Worship', 'Kalkaji', 4, 0),
(2, 'Humayun’s Tomb', 'Mughal mausoleum', 'Nizamuddin East', 1, 500),
-- Bangalore
(3, 'Lalbagh Botanical Garden', 'Sprawling garden', 'Mavalli', 3, 50),
(3, 'Bangalore Palace', 'Tudor-style palace', 'Vasanth Nagar', 1, 480),
(3, 'Cubbon Park', 'Landmark park', 'Kasturba Road', 3, 0),
(3, 'Bannerghatta Biological Park', 'Wildlife park', 'Bannerghatta', 8, 300),
(3, 'ISKCON Temple Bangalore', 'Modern temple complex', 'Rajajinagar', 4, 0),
-- Hyderabad
(4, 'Charminar', 'Iconic mosque and monument', 'Ghansi Bazaar', 1, 100),
(4, 'Golconda Fort', 'Medieval fort', 'Ibrahim Bagh', 1, 100),
(4, 'Ramoji Film City', 'Film studio complex', 'Anaspur Village', 7, 1150),
(4, 'Hussain Sagar Lake', 'Heart-shaped lake', 'Necklace Road', 8, 50),
(4, 'Salar Jung Museum', 'Art museum', 'Darulshifa', 2, 50),
-- Chennai
(5, 'Marina Beach', 'Long sandy beach', 'Beach Road', 6, 0),
(5, 'Kapaleeshwarar Temple', 'Ancient Dravidian temple', 'Mylapore', 4, 0),
(5, 'Fort St. George', 'British-built fort', 'Rajaji Salai', 1, 100),
(5, 'Government Museum', 'Archaeology museum', 'Egmore', 2, 50),
(5, 'Edward Elliot’s Beach', 'Quiet urban beach', 'Besant Nagar', 6, 0),
-- New York
(6, 'Statue of Liberty', 'Iconic symbol of freedom', 'Liberty Island', 5, 2000),
(6, 'Central Park', 'Large urban park', 'Manhattan', 3, 0),
(6, 'Empire State Building', 'Art Deco skyscraper', '350 5th Ave', 5, 3500),
(6, 'Metropolitan Museum of Art', 'World-class art museum', '1000 5th Ave', 2, 2100),
(6, 'Times Square', 'Vibrant commercial hub', 'Manhattan', 7, 0),
-- Los Angeles
(7, 'Hollywood Sign', 'Famous landmark', 'Mount Lee', 5, 0),
(7, 'Griffith Observatory', 'Astronomy museum and views', 'Griffith Park', 2, 0),
(7, 'Santa Monica Pier', 'Amusement park on a pier', 'Santa Monica', 6, 1500),
(7, 'The Getty', 'Art museum and gardens', '1200 Getty Center Dr', 2, 0),
(7, 'Universal Studios Hollywood', 'Film studio and theme park', 'Universal City', 7, 8000),
-- Chicago
(8, 'Millennium Park', 'Civic center and park', '201 E Randolph St', 3, 0),
(8, 'Art Institute of Chicago', 'Fine arts museum', '111 S Michigan Ave', 2, 2000),
(8, 'Willis Tower', 'Iconic skyscraper', '233 S Wacker Dr', 5, 2500),
(8, 'Navy Pier', 'Entertainment destination', '600 E Grand Ave', 7, 0),
(8, 'Shedd Aquarium', 'Indoor public aquarium', '1200 S DuSable Lake Shore Dr', 8, 3000),
-- San Francisco
(9, 'Golden Gate Bridge', 'Famous suspension bridge', 'San Francisco', 5, 0),
(9, 'Alcatraz Island', 'Former prison island', 'San Francisco Bay', 1, 3500),
(9, 'Fisherman’s Wharf', 'Popular tourist area', 'Jefferson St', 7, 0),
(9, 'Lombard Street', 'Crookedest street', 'Russian Hill', 5, 0),
(9, 'Golden Gate Park', 'Large urban park', 'San Francisco', 3, 0),
-- Miami
(10, 'South Beach', 'Iconic beach and nightlife', 'Miami Beach', 6, 0),
(10, 'Vizcaya Museum and Gardens', 'Historic estate', '3251 S Miami Ave', 2, 1500),
(10, 'Everglades National Park', 'Wetland preserve', 'Homestead', 8, 2500),
(10, 'Wynwood Walls', 'Outdoor mural gallery', '2520 NW 2nd Ave', 2, 0),
(10, 'Little Havana', 'Cuban cultural hub', 'Calle Ocho', 7, 0),
-- Paris
(11, 'Eiffel Tower', 'Iconic iron tower', 'Champ de Mars', 5, 2200),
(11, 'Louvre Museum', 'World’s largest art museum', 'Rue de Rivoli', 2, 1500),
(11, 'Notre-Dame Cathedral', 'Medieval Catholic cathedral', '6 Parvis Notre-Dame', 1, 0),
(11, 'Arc de Triomphe', 'Triumphal arch', 'Place Charles de Gaulle', 5, 1100),
(11, 'Sacré-Cœur Basilica', 'Roman Catholic church', 'Montmartre', 4, 0),
-- Lyon
(12, 'Basilica of Notre-Dame de Fourvière', 'Minor basilica', 'Place de Fourvière', 4, 0),
(12, 'Parc de la Tête d’Or', 'Large urban park', 'Lyon', 3, 0),
(12, 'Musée des Confluences', 'Science and anthropology museum', '86 Quai Perrache', 2, 800),
(12, 'Vieux Lyon', 'Old town renaissance district', 'Lyon', 1, 0),
(12, 'Place Bellecour', 'Large town square', 'Lyon', 5, 0),
-- Marseille
(13, 'Basilique Notre-Dame de la Garde', 'Byzantine-style basilica', 'Marseille', 4, 0),
(13, 'Vieux-Port de Marseille', 'Old harbor', 'Marseille', 1, 0),
(13, 'Mucem', 'Museum of European Civilizations', '7 Prom. Robert Laffont', 2, 1000),
(13, 'Calanques National Park', 'Natural preserve', 'Marseille', 8, 0),
(13, 'Palais Longchamp', 'Monument housing museums', 'Marseille', 5, 0),
-- Nice
(14, 'Promenade des Anglais', 'Famous seaside walk', 'Nice', 6, 0),
(14, 'Castle Hill', 'Park with city views', 'Nice', 3, 0),
(14, 'Musée Matisse', 'Art museum', '164 Av. des Arènes de Cimiez', 2, 800),
(14, 'Old Town (Vieux Nice)', 'Charming historic center', 'Nice', 1, 0),
(14, 'Nice Cathedral', 'Baroque cathedral', 'Place Rossetti', 4, 0),
-- Bordeaux
(15, 'Place de la Bourse', 'Iconic square', 'Place de la Bourse', 5, 0),
(15, 'Cité du Vin', 'Wine museum', '134 Quai de Bacalan', 2, 1800),
(15, 'Bordeaux Cathedral', 'Gothic cathedral', 'Place Pey Berland', 4, 0),
(15, 'Grand Théâtre de Bordeaux', 'Historic opera house', 'Place de la Comédie', 1, 0),
(15, 'Jardin Public', 'Historic city park', 'Cours de Verdun', 3, 0),
-- Tokyo
(16, 'Senso-ji Temple', 'Ancient Buddhist temple', 'Asakusa', 4, 0),
(16, 'Tokyo Skytree', 'Observation and broadcast tower', 'Sumida', 5, 2500),
(16, 'Meiji Jingu Shrine', 'Shinto shrine', 'Shibuya', 4, 0),
(16, 'Shinjuku Gyoen National Garden', 'Large park and garden', 'Shinjuku', 3, 400),
(16, 'Tokyo National Museum', 'Oldest and largest museum', 'Ueno Park', 2, 800),
-- Osaka
(17, 'Osaka Castle', 'Historic Japanese castle', 'Chuo Ward', 1, 500),
(17, 'Universal Studios Japan', 'Theme park', 'Konohana Ward', 7, 7000),
(17, 'Dotonbori', 'Entertainment and food district', 'Namba', 7, 0),
(17, 'Umeda Sky Building', 'Skyscraper with observation deck', 'Kita Ward', 5, 1200),
(17, 'Osaka Aquarium Kaiyukan', 'Large public aquarium', 'Minato Ward', 8, 2000),
-- Kyoto
(18, 'Fushimi Inari-taisha Shrine', 'Shinto shrine with torii gates', 'Fushimi Ward', 4, 0),
(18, 'Kinkaku-ji (Golden Pavilion)', 'Zen Buddhist temple', 'Kita Ward', 4, 400),
(18, 'Kiyomizu-dera Temple', 'Buddhist temple', 'Higashiyama Ward', 4, 300),
(18, 'Arashiyama Bamboo Grove', 'Scenic bamboo path', 'Ukyo Ward', 8, 0),
(18, 'Nijo Castle', 'Historic castle and residence', 'Nakagyo Ward', 1, 500),
-- Yokohama
(19, 'Yokohama Landmark Tower', 'Skyscraper with observation deck', 'Minato Mirai', 5, 800),
(19, 'Sankeien Garden', 'Traditional Japanese garden', 'Naka Ward', 3, 600),
(19, 'Cup Noodles Museum', 'Interactive food museum', 'Naka Ward', 2, 400),
(19, 'Yokohama Red Brick Warehouse', 'Historic complex', 'Naka Ward', 1, 0),
(19, 'Cosmo World', 'Amusement park', 'Naka Ward', 7, 0),
-- Nagoya
(20, 'Nagoya Castle', 'Historic castle', 'Naka Ward', 1, 400),
(20, 'Atsuta Jingu Shrine', 'Ancient Shinto shrine', 'Atsuta Ward', 4, 0),
(20, 'Toyota Commemorative Museum', 'Industrial history museum', 'Nishi Ward', 2, 400),
(20, 'Nagoya City Science Museum', 'Science museum', 'Naka Ward', 2, 700),
(20, 'Osu Kannon Temple', 'Buddhist temple', 'Naka Ward', 4, 0),
-- Rome
(21, 'Colosseum', 'Iconic Roman amphitheatre', 'Piazza del Colosseo', 1, 1500),
(21, 'Pantheon', 'Ancient Roman temple/church', 'Piazza della Rotonda', 1, 0),
(21, 'Trevi Fountain', 'Famous Baroque fountain', 'Piazza di Trevi', 5, 0),
(21, 'Vatican Museums', 'World-class art collections', 'Vatican City', 2, 1500),
(21, 'St. Peters Basilica', 'Renaissance papal church', 'Vatican City', 4, 0),
-- Milan
(22, 'Duomo di Milano', 'Gothic cathedral', 'Piazza del Duomo', 4, 300),
(22, 'Galleria Vittorio Emanuele II', 'Historic shopping gallery', 'Piazza del Duomo', 7, 0),
(22, 'Sforza Castle', 'Renaissance fortress', 'Piazza Castello', 1, 0),
(22, 'Teatro alla Scala', 'Opera house', 'Via Filodrammatici', 1, 2000),
(22, 'Pinacoteca di Brera', 'Public art gallery', 'Via Brera', 2, 1200),
-- Venice
(23, 'St. Marks Basilica', 'Italo-Byzantine cathedral', 'Piazza San Marco', 4, 0),
(23, 'Doge’s Palace', 'Venetian Gothic palace', 'Piazza San Marco', 1, 2200),
(23, 'Rialto Bridge', 'Oldest bridge across Grand Canal', 'San Polo', 5, 0),
(23, 'Canal Grande', 'Main waterway of Venice', 'Venice', 8, 0),
(23, 'Peggy Guggenheim Collection', 'Modern art museum', 'Dorsoduro', 2, 1300),
-- Florence
(24, 'Florence Cathedral (Duomo)', 'Iconic dome cathedral', 'Piazza del Duomo', 4, 0),
(24, 'Uffizi Gallery', 'World-famous art museum', 'Piazzale degli Uffizi', 2, 1800),
(24, 'Ponte Vecchio', 'Medieval stone arch bridge', 'Florence', 5, 0),
(24, 'Palazzo Vecchio', 'Historic town hall', 'Piazza della Signoria', 1, 1000),
(24, 'Boboli Gardens', 'Historical park', 'Piazza de Pitti', 3, 800),
-- Naples
(25, 'Castel dell’Ovo', 'Seaside castle', 'Via Eldorado', 1, 0),
(25, 'Naples National Archaeological Museum', 'Classical archaeology museum', 'Piazza Museo', 2, 1000),
(25, 'Piazza del Plebiscito', 'Grand public square', 'Naples', 5, 0),
(25, 'Mount Vesuvius', 'Famous volcano', 'Naples Bay', 8, 1500),
(25, 'Catacombs of San Gennaro', 'Ancient underground burials', 'Via Capodimonte', 1, 800);

-- 6. Reviews (Initial reviews for some places)
INSERT INTO reviews (rating, comment, user_id, place_id) VALUES
(5, 'Absolutely breathtaking views!', 1, 1),
(4, 'Beautiful at sunset, but very crowded.', 2, 2),
(5, 'A must-visit historical site.', 9, 6),
(3, 'Nice but expensive entry fee.', 1, 11),
(5, 'Peaceful and spiritual experience.', 2, 18),
(4, 'Great food nearby!', 9, 1),
(5, 'The architecture is stunning.', 1, 21),
(5, 'Amazing collection of art.', 2, 24);

-- 7. Itineraries (Demo data)
INSERT INTO itineraries (itinerary_id, user_id, start_date, end_date, budget, city_id) VALUES
(1, 1, '2025-06-10', '2025-06-12', 8000, 1),
(2, 9, '2025-12-25', '2025-12-28', 5000, 1);

-- 8. Itinerary Details
INSERT INTO itinerary_details (itinerary_id, day_no, place_id) VALUES
(1, 1, 1), (1, 2, 2),
(2, 1, 1), (2, 2, 3);
