/* ---- CHALLENGES ---- */


/* We want to evaluate the median severity value of accidents caused by various Motorcycles. */
-- Median Severity value of accidents caused by various motorcycles

SET @row_index := -1;
SELECT AVG(num.severity) as median_value
FROM (
    SELECT @row_index:=@row_index + 1 AS row_index, severity
    FROM (select vt.vehicle_type as veh_type, a.accident_severity as severity
          from accidents a 
          inner join vehicles v
          on a.accident_index = v.accident_index
          inner join vehicle_types vt
          on v.vehicle_code = vt.vehicle_code
          where vt.vehicle_type like '%Motorcycle%') as tbl_severity
    ORDER BY severity
  ) AS num
  WHERE num.row_index 
  IN (FLOOR(@row_index / 2) , CEIL(@row_index / 2));
  
  
  /* We want evaluation of Accident Severity and Total Accidents per Vehicle Type */ 
-- We need to calculate average accident Severity and Total Accidents per vehicle type

select vt.vehicle_type, avg(a.accident_severity) as Accident_Severity, count(v.accident_index) as Total_Accidents
from accidents a 
inner join vehicles v
on a.accident_index = v.accident_index
inner join vehicle_types vt
on v.vehicle_code = vt.vehicle_code
group by vt.vehicle_type;


/* We want to calculate the Average Severity by vehicle type. */
-- Average Severity by vehicle type
select vt.vehicle_type, avg(a.accident_severity) as Avg_Accident_Severity
from accidents a 
inner join vehicles v
on a.accident_index = v.accident_index
inner join vehicle_types vt
on v.vehicle_code = vt.vehicle_code
group by vt.vehicle_type;

/* We want the Average Severity and Total Accidents by Motorcycle type */
-- Average Severity and Total Accidents by Motorcycles
select count(a.accident_index) as Total_Accidents_by_motorcycles, 
avg(a.accident_severity) as Average_Accident_Severity_by_motorcycles
from accidents a 
inner join vehicles v
on a.accident_index = v.accident_index
inner join vehicle_types vt
on v.vehicle_code = vt.vehicle_code
where vt.vehicle_type like '%Motorcycle%';
