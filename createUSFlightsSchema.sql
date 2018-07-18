DROP SCHEMA IF EXISTS USAirlineFlights;
CREATE DATABASE IF NOT EXISTS USAirlineFlights;
use USAirlineFlights;

CREATE TABLE USAirports (
	IATA			VARCHAR(32) NOT NULL PRIMARY KEY,
	Airport			VARCHAR(32),
	City			VARCHAR(32)
	);

	LOAD DATA LOCAL INFILE 'data/newairports.csv'
	INTO TABLE USAirports
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

CREATE TABLE Carriers (
	CarrierCode		VARCHAR(32) NOT NULL PRIMARY KEY,
	Description		VARCHAR(32)
);

LOAD DATA LOCAL INFILE 'data/carriers.csv'
INTO TABLE Carriers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


CREATE TABLE IF NOT EXISTS Flights(
	flightID		VARCHAR(10),
	colYear			SMALLINT,
	colMonth		SMALLINT,
	UniqueCarrier	VARCHAR(32),
	TailNum			VARCHAR(32),
	ArrDelay		SMALLINT,
	DepDelay		SMALLINT,
	Origin			VARCHAR(32),
	Dest			VARCHAR(32),
	Distance		VARCHAR(32),
	Cancelled		BOOLEAN
);

LOAD DATA LOCAL INFILE 'data/new2000.csv'
INTO TABLE Flights
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
;

ALTER TABLE Flights
ADD ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

FOREIGN KEY (Dest)
	REFERENCES USAirports (IATA),

	FOREIGN KEY (Origin)
	REFERENCES USAirports (IATA),

	FOREIGN KEY (UniqueCarrier)
	REFERENCES Carriers (CarrierCode)

/*
(flightID,
colYear,
colMonth,
@UniqueCarrier,
@TailNum,
@ArrDelay,
@DepDelay,
@Origin,
@Dest,
@Distance,
@Cancelled)
SET
UniqueCarrier = nullif(@UniqueCarrier,''),
TailNum = nullif(@TailNum,''),
ArrDelay = nullif(@ArrDelay,''),
DepDelay = nullif(@DepDelay,''),
Origin = nullif(@Origin,''),
Dest = nullif(@Dest,''),
Distance = nullif(@Distance,""),
Cancelled = nullif(@Cancelled,'')
;


