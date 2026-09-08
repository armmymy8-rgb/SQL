create database if NOT EXISTS job_mart;

drop database if EXISTS job_mart;

show databases;

select * 
from information_schema.schemata 
;

create SCHEMA job_mart.staging;

select * 
from information_schema.schemata 
;

drop schema if EXISTS job_mart.staging;

select * 
from information_schema.schemata 
;