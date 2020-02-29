-- CREATE DATABASE plant_nursery;
USE plant_nursery;

CREATE TABLE plants
(
species_name varchar(30) NOT NULL,
common_name varchar(25),
variety varchar(25) NOT NULL,
type varchar(20),
description varchar(100),
germ_days varchar(15),
primary key(species_name, variety)
);

CREATE TABLE weather_station
(
location varchar(5) UNIQUE NOT NULL,
primary key(location)
);

CREATE TABLE tray
(
tray_id varchar(20) UNIQUE NOT NULL,
current_location varchar(5),
last_action datetime,
primary key(tray_id)
);

CREATE TABLE requirements
(
species_name varchar(30) NOT NULL,
feeding varchar(200),
watering varchar(200),
temperature varchar(200),
air_moisture varchar(200),
light varchar(200),
-- Derived Atttribute at_nursery
foreign key(species_name) references plants(species_name)
	on delete cascade
);

CREATE TABLE pots
(
pot_id varchar(20) UNIQUE NOT NULL,
tray_id varchar(20) NOT NULL,
plant_date date,
germ_date date,
volume numeric(2) 
	not null check (volume in(1, 2, 3, 4, 5, 7, 10, 15, 25)),
height numeric(2) 
	not null check (height in(3, 4, 5, 6, 6.5, 7, 8, 12, 14)),
-- derived attribute age
primary key (pot_id),
foreign key (tray_id) references tray(tray_id)
	on delete set null
);

CREATE TABLE potted
(
species_name varchar(25),
variety varchar(25),
pot_id varchar(20),
foreign key (species_name, variety) references plants(species_name, variety),
foreign key (pot_id) references pots(pot_id)
	on delete cascade
);

CREATE TABLE logs
(
pot_id varchar(20),
location varchar(5),
feeding numeric(5),
watering numeric(5),
move varchar(30),
measure_time datetime,
foreign key(pot_id) references pots(pot_id)
	on delete cascade,
foreign key(location) references weather_station(location)
);

CREATE TABLE measurement
(
location varchar(5),
temperature varchar(25),
air_moisture varchar(15),
light numeric(10),
foreign key(location) references weather_station(location)
);



