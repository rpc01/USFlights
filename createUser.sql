CREATE USER 'testUser'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON USAirlineFlights.* TO 'testUser'@'localhost';

FLUSH PRIVILEGES;