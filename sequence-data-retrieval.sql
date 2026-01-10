-- Create the investments table
CREATE TABLE investments (
                             id SERIAL PRIMARY KEY,
                             investor_name VARCHAR(100) NOT NULL,
                             company_name VARCHAR(100) NOT NULL,
                             amount DECIMAL(12, 2) NOT NULL,
                             investment_date DATE NOT NULL,
                             investment_type VARCHAR(50),
                             status VARCHAR(20) DEFAULT 'active',
                             expected_return DECIMAL(5, 2),
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE investments;
TRUNCATE TABLE investments;

-- Insert 100 records with Uzbek names
INSERT INTO investments (investor_name, company_name, amount, investment_date, investment_type, status, expected_return) VALUES
                                                                                                                             ('Alisher Karimov', 'Tech Innovations UZ', 50000.00, '2024-01-15', 'Startup', 'active', 25.50),
                                                                                                                             ('Dilnoza Rahimova', 'Green Energy Solutions', 75000.00, '2024-02-20', 'Renewable Energy', 'active', 18.75),
                                                                                                                             ('Bobur Toshmatov', 'UzbekTech Group', 100000.00, '2023-11-10', 'Technology', 'completed', 32.00),
                                                                                                                             ('Nigora Azimova', 'FarmTech Uzbekistan', 45000.00, '2024-03-05', 'Agriculture', 'active', 22.30),
                                                                                                                             ('Jamshid Normatov', 'Silk Road Logistics', 120000.00, '2023-09-18', 'Transportation', 'active', 15.50),
                                                                                                                             ('Malika Saidova', 'Digital Marketing Pro', 30000.00, '2024-04-12', 'Marketing', 'active', 28.00),
                                                                                                                             ('Rustam Yusupov', 'Construction Plus', 200000.00, '2023-07-22', 'Real Estate', 'completed', 20.00),
                                                                                                                             ('Gulnora Hamidova', 'Fashion Boutique UZ', 25000.00, '2024-05-08', 'Retail', 'active', 19.50),
                                                                                                                             ('Sanjar Ergashev', 'Cloud Services Asia', 85000.00, '2024-01-30', 'IT Services', 'active', 26.75),
                                                                                                                             ('Feruza Mavlonova', 'Healthcare Innovation', 95000.00, '2023-12-14', 'Healthcare', 'active', 17.25),
                                                                                                                             ('Otabek Sharipov', 'E-commerce Tashkent', 60000.00, '2024-02-28', 'E-commerce', 'active', 30.00),
                                                                                                                             ('Zarina Ikromova', 'Education Platform UZ', 40000.00, '2024-03-20', 'EdTech', 'pending', 24.50),
                                                                                                                             ('Davron Mirzaev', 'Mobile Apps Studio', 55000.00, '2023-10-05', 'Software', 'completed', 35.00),
                                                                                                                             ('Laylo Kholmatova', 'Organic Foods UZ', 35000.00, '2024-04-18', 'Food Industry', 'active', 21.00),
                                                                                                                             ('Jasur Abdullayev', 'Fintech Solutions', 150000.00, '2023-08-12', 'Finance', 'active', 29.50),
                                                                                                                             ('Aziza Nabiyeva', 'Smart Home Systems', 42000.00, '2024-06-15', 'Technology', 'active', 23.50),
                                                                                                                             ('Sherzod Haydarov', 'Solar Panel Manufacturing', 180000.00, '2023-05-20', 'Renewable Energy', 'completed', 19.00),
                                                                                                                             ('Nodira Qodirova', 'Coffee Chain Tashkent', 65000.00, '2024-07-10', 'Food Industry', 'active', 27.50),
                                                                                                                             ('Umid Rahmonov', 'Cryptocurrency Exchange', 220000.00, '2023-11-25', 'Finance', 'active', 38.00),
                                                                                                                             ('Shoira Ismoilova', 'Online Grocery Delivery', 48000.00, '2024-08-05', 'E-commerce', 'active', 22.00),
                                                                                                                             ('Timur Sultanov', 'AI Research Lab', 175000.00, '2023-09-30', 'Technology', 'active', 31.50),
                                                                                                                             ('Mohinur Akramova', 'Beauty Salon Chain', 38000.00, '2024-05-22', 'Retail', 'active', 20.75),
                                                                                                                             ('Farruh Zokirov', 'Medical Equipment Import', 92000.00, '2024-03-18', 'Healthcare', 'active', 18.25),
                                                                                                                             ('Yulduz Nurmatova', 'Language Learning App', 55000.00, '2024-06-28', 'EdTech', 'pending', 26.00),
                                                                                                                             ('Bekzod Turgunov', 'Warehouse Automation', 135000.00, '2023-08-14', 'Logistics', 'completed', 21.50),
                                                                                                                             ('Komila Rasulova', 'Fitness Studio Network', 52000.00, '2024-04-30', 'Health & Fitness', 'active', 24.25),
                                                                                                                             ('Islom Kamolov', 'Blockchain Solutions', 165000.00, '2023-10-08', 'Technology', 'active', 33.00),
                                                                                                                             ('Sevara Ortiqova', 'Textile Export Business', 78000.00, '2024-02-14', 'Manufacturing', 'active', 19.75),
                                                                                                                             ('Abbos Maxmudov', 'Data Analytics Platform', 88000.00, '2024-07-20', 'IT Services', 'active', 28.50),
                                                                                                                             ('Dildora Xolmatova', 'Children Toy Store', 33000.00, '2024-05-12', 'Retail', 'active', 22.80),
                                                                                                                             ('Ravshan Aliyev', 'Smart Farming Tech', 145000.00, '2023-12-03', 'Agriculture', 'active', 25.00),
                                                                                                                             ('Munisa Sodiqova', 'Event Management Agency', 41000.00, '2024-06-08', 'Services', 'active', 21.30),
                                                                                                                             ('Eldor Safarov', 'Construction Materials', 195000.00, '2023-07-16', 'Real Estate', 'completed', 17.50),
                                                                                                                             ('Kamola Yunusova', 'Fashion Design Studio', 47000.00, '2024-08-25', 'Retail', 'active', 23.75),
                                                                                                                             ('Sardor Axmedov', 'Cybersecurity Consulting', 110000.00, '2024-01-19', 'IT Services', 'active', 29.00),
                                                                                                                             ('Nilufar Jalilova', 'Organic Cosmetics', 58000.00, '2024-03-27', 'Beauty', 'active', 26.50),
                                                                                                                             ('Lochin Eshonov', 'Real Estate Platform', 125000.00, '2023-11-11', 'PropTech', 'active', 24.00),
                                                                                                                             ('Mashxura Baxtiyorova', 'Children Education Center', 44000.00, '2024-05-16', 'Education', 'active', 20.50),
                                                                                                                             ('Shoxrux Valiyev', 'Gaming Studio', 72000.00, '2024-07-02', 'Entertainment', 'pending', 32.00),
                                                                                                                             ('Gulmira Tursunova', 'Eco-Tourism Agency', 53000.00, '2024-04-09', 'Tourism', 'active', 22.25),
                                                                                                                             ('Nodir Ergashev', 'Cloud Storage Provider', 98000.00, '2023-09-21', 'IT Services', 'active', 27.75),
                                                                                                                             ('Zebiniso Qosimova', 'Handmade Crafts Export', 36000.00, '2024-06-19', 'Manufacturing', 'active', 19.00),
                                                                                                                             ('Mansur Jorayev', 'Sports Equipment Store', 61000.00, '2024-02-25', 'Retail', 'active', 21.80),
                                                                                                                             ('Dilfuza Mirzayeva', 'Translation Services', 29000.00, '2024-08-11', 'Services', 'active', 18.50),
                                                                                                                             ('Anvar Nazarov', 'Electric Vehicle Charging', 188000.00, '2023-10-15', 'Renewable Energy', 'active', 23.25),
                                                                                                                             ('Shahnoza Olimova', 'Pet Care Products', 39000.00, '2024-05-28', 'Retail', 'active', 20.00),
                                                                                                                             ('Jasurbek Umarov', 'Virtual Reality Studio', 142000.00, '2024-01-07', 'Technology', 'active', 34.50),
                                                                                                                             ('Muxlisa Berdiyeva', 'Catering Service', 46000.00, '2024-07-14', 'Food Industry', 'active', 22.50),
                                                                                                                             ('Odil Xasanov', 'Insurance Tech Platform', 156000.00, '2023-08-28', 'Finance', 'completed', 26.25),
                                                                                                                             ('Lola Abduraxmanova', 'Jewelry Design', 51000.00, '2024-03-31', 'Retail', 'active', 24.75),
                                                                                                                             ('Botir Yoldoshev', 'Drone Delivery Service', 168000.00, '2024-06-06', 'Logistics', 'pending', 30.50),
                                                                                                                             ('Nasiba Rajabova', 'Mental Health App', 43000.00, '2024-04-22', 'Healthcare', 'active', 25.50),
                                                                                                                             ('Ulugbek Mirzaev', 'Co-Working Spaces', 115000.00, '2023-12-19', 'Real Estate', 'active', 19.25),
                                                                                                                             ('Zuxra Kamilova', 'Baby Products Store', 37000.00, '2024-08-17', 'Retail', 'active', 21.00),
                                                                                                                             ('Muzaffar Usmanov', '3D Printing Services', 82000.00, '2024-02-08', 'Manufacturing', 'active', 28.00),
                                                                                                                             ('Hilola Shermatova', 'Yoga & Wellness Center', 49000.00, '2024-05-05', 'Health & Fitness', 'active', 23.00),
                                                                                                                             ('Baxtiyor Mahmudov', 'Robotics Education', 104000.00, '2023-11-02', 'EdTech', 'active', 29.75),
                                                                                                                             ('Mohira Dustova', 'Interior Design Studio', 54000.00, '2024-07-23', 'Services', 'active', 22.00),
                                                                                                                             ('Sobir Nematov', 'Smart City Solutions', 210000.00, '2023-09-05', 'Technology', 'completed', 31.00),
                                                                                                                             ('Gavhar Ergasheva', 'Organic Tea Plantation', 67000.00, '2024-03-14', 'Agriculture', 'active', 20.25),
                                                                                                                             ('Dilshod Tojiboyev', 'Video Production Studio', 76000.00, '2024-06-21', 'Media', 'active', 26.75),
                                                                                                                             ('Munojat Shakirova', 'Home Cleaning Service', 32000.00, '2024-08-03', 'Services', 'active', 19.50),
                                                                                                                             ('Azamat Bobojonov', 'IoT Smart Devices', 127000.00, '2024-01-26', 'Technology', 'active', 32.50),
                                                                                                                             ('Saida Raxmonova', 'Wedding Planning Agency', 41000.00, '2024-04-17', 'Services', 'active', 21.75),
                                                                                                                             ('Farhod Madaminov', 'Logistics Software', 93000.00, '2023-10-29', 'IT Services', 'active', 27.00),
                                                                                                                             ('Nozima Karimova', 'Pastry Shop Chain', 56000.00, '2024-05-31', 'Food Industry', 'active', 23.50),
                                                                                                                             ('Jamol Asqarov', 'Renewable Energy Consulting', 118000.00, '2024-07-08', 'Renewable Energy', 'active', 24.50),
                                                                                                                             ('Sitora Xodjaeva', 'Photography Studio', 38000.00, '2024-02-19', 'Services', 'active', 20.75),
                                                                                                                             ('Dilmurod Mamadjonov', 'HR Tech Platform', 89000.00, '2024-06-13', 'IT Services', 'pending', 28.25),
                                                                                                                             ('Farida Sharipova', 'Florist Network', 34000.00, '2024-08-29', 'Retail', 'active', 19.80),
                                                                                                                             ('Shavkat Ismatov', 'Automotive Parts Import', 162000.00, '2023-11-18', 'Trade', 'active', 22.50),
                                                                                                                             ('Oydin Alimova', 'Digital Art Gallery', 45000.00, '2024-04-05', 'Art', 'active', 25.25),
                                                                                                                             ('Rustambek Qodirov', 'Aquaponics Farm', 108000.00, '2024-07-27', 'Agriculture', 'active', 26.00),
                                                                                                                             ('Maloxat Usmonova', 'Book Publishing House', 71000.00, '2024-03-09', 'Media', 'active', 21.50),
                                                                                                                             ('Dostonbek Saydullayev', 'Telemedicine Platform', 134000.00, '2024-05-20', 'Healthcare', 'active', 30.00),
                                                                                                                             ('Murod Xolmatov', 'Furniture Manufacturing', 87000.00, '2023-12-08', 'Manufacturing', 'completed', 18.00),
                                                                                                                             ('Shaxnoza Raimova', 'Music School Network', 39000.00, '2024-07-16', 'Education', 'active', 20.50),
                                                                                                                             ('Yorqin Ibragimov', 'Mobile Game Development', 96000.00, '2024-01-11', 'Entertainment', 'active', 33.25),
                                                                                                                             ('Madina Qurbonova', 'Spa & Wellness Resort', 143000.00, '2023-09-27', 'Tourism', 'active', 21.75),
                                                                                                                             ('Eldorbek Samatov', 'Agricultural Drones', 112000.00, '2024-04-26', 'Agriculture', 'active', 27.50),
                                                                                                                             ('Guzal Aminova', 'Fashion E-commerce', 64000.00, '2024-06-03', 'E-commerce', 'active', 29.00),
                                                                                                                             ('Toxir Nasriddinov', 'Cybersport Arena', 79000.00, '2024-08-19', 'Entertainment', 'pending', 24.00),
                                                                                                                             ('Sabohat Nurullayeva', 'Dental Clinic Chain', 105000.00, '2023-11-30', 'Healthcare', 'active', 19.50),
                                                                                                                             ('Firdavs Xusanov', 'Delivery Robot Startup', 158000.00, '2024-02-12', 'Technology', 'active', 35.75),
                                                                                                                             ('Mavjuda Jalolova', 'Artisan Bakery', 42000.00, '2024-05-25', 'Food Industry', 'active', 22.25),
                                                                                                                             ('Akmal Tursunov', 'Waste Recycling Plant', 192000.00, '2023-10-21', 'Environmental', 'completed', 17.00),
                                                                                                                             ('Zulayxo Axmadova', 'Virtual Event Platform', 73000.00, '2024-07-05', 'IT Services', 'active', 28.75),
                                                                                                                             ('Sharofiddin Boqiev', 'Import-Export Trading', 126000.00, '2024-03-22', 'Trade', 'active', 20.00),
                                                                                                                             ('Sabina Valieva', 'Kids Entertainment Center', 57000.00, '2024-06-29', 'Entertainment', 'active', 23.50),
                                                                                                                             ('Jamshid Mamajonov', 'Solar Water Heating', 84000.00, '2023-12-25', 'Renewable Energy', 'active', 22.00),
                                                                                                                             ('Nargiza Xamidova', 'Luxury Car Rental', 148000.00, '2024-01-20', 'Transportation', 'active', 26.50),
                                                                                                                             ('Dilmurod Ismoilov', 'Software Testing Lab', 69000.00, '2024-08-14', 'IT Services', 'active', 27.25),
                                                                                                                             ('Roxsana Yoldasheva', 'Healthy Meal Prep', 44000.00, '2024-04-07', 'Food Industry', 'active', 21.50),
                                                                                                                             ('Inom Botirov', 'Business Consulting Firm', 91000.00, '2023-09-12', 'Services', 'completed', 24.75),
                                                                                                                             ('Zebo Nurmatova', 'Online Fashion Magazine', 36000.00, '2024-07-31', 'Media', 'active', 19.25),
                                                                                                                             ('Furqat Djurayev', 'Electric Scooter Rental', 68000.00, '2024-02-17', 'Transportation', 'active', 25.00),
                                                                                                                             ('Malika Ismailova', 'Veterinary Clinic', 52000.00, '2024-05-10', 'Healthcare', 'active', 20.75),
                                                                                                                             ('Sardorbek Maxmudov', 'Animation Studio', 99000.00, '2024-06-24', 'Media', 'pending', 31.50);
-- --------------------------------------------------------------------------------------------------------------
-- ex:SELECTING *
SELECT * FROM investments;

-- ex:SELECTING fields(column)
SELECT column_name,data_type
FROM information_schema.columns
WHERE table_name = 'investments';

SELECT investor_name,amount,status
FROM investments ORDER BY status;

-- ex:SELECTING fields by joining
SELECT investor_name || ' -- ' || company_name,status FROM investments;

-- ex:SELECTING fields by aliasing fields
SELECT investor_name as ISM,status as hozirda FROM investments;

-- ex:SELECTING fields by adding name fields
SELECT id,'NAME==>' as name,investor_name FROM investments;

-- ex:SELECT fields by ascending & descending order
SELECT investor_name,amount,status
FROM investments
ORDER BY status,amount DESC ;

SELECT investor_name,amount,status
FROM investments
ORDER BY amount;

-- ex:SELECT fields by limit
SELECT investor_name FROM investments LIMIT 10;

-- ex:SELECTING by where clause
SELECT * FROM investments WHERE status = 'active' LIMIT 10;
SELECT * FROM investments WHERE status = 'active' ORDER BY amount DESC LIMIT 1;

SELECT * FROM investments WHERE status not in ('active');

SELECT investor_name FROM investments WHERE investor_name LIKE 'A%';
SELECT count(1) FROM investments WHERE investor_name ILIKE '%a';
SELECT count(1) FROM investments WHERE investor_name ILIKE '%v';






























