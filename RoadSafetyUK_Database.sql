/* ----------------------------- Creating the Database ---------------------------------- */
create database road_safetyUK;
use road_safetyUK;

/* --------------------------- Creating the Table structures---------------------------- */

/* Accidents */
create table accidents(
accident_index varchar(30),
accident_severity integer
);

/* Vehicles */
create table vehicles(
accident_index varchar(30),
vehicle_code integer);

/* Vehicle_Types */
create table vehicle_types(
 vehicle_code integer,
 vehicle_type varchar(50));
 
 
/*------------------------- Loading the Values in the tables --------------------------------------*/


 /* Accidents */
  LOAD DATA INFILE 'D:\\Full_SatckDataAnalytics_Notes\\SQL\\Road_Safety_Data\\Accidents_2015.csv'
 INTO TABLE accidents
 FIELDS TERMINATED BY ','
 ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 ROWS
 (@col1, @dummy, @dummy, @dummy, @dummy, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, 
 @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, 
 @dummy, @dummy, @dummy, @dummy)
 SET accident_index = @col1, accident_severity = @col2;
 
 /* Vehicles */
 LOAD DATA INFILE 'D:\\Full_SatckDataAnalytics_Notes\\SQL\\Road_Safety_Data\\Vehicles_2015.csv'
 INTO TABLE vehicles
 FIELDS TERMINATED BY ','
 ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 ROWS
 (@col1, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, 
 @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy) 
 SET accident_index = @col1, vehicle_code = @col2;
 
 /* Vehicle_Types */
 LOAD DATA INFILE 'D:\\Full_SatckDataAnalytics_Notes\\SQL\\Road_Safety_Data\\vehicle_types.csv'
 INTO TABLE vehicle_types
 FIELDS TERMINATED BY ','
 ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 ROWS;