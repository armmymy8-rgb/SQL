--.read Lesson/2.2/2.2.2_DDL_DML_pt2.sql---
use job_mart.main;

create table if not exists job_mart.main.preferred_roles (
    role_id integer primary key,
    role_name varchar
)
;

-- drop table if exists job_mart.main.preferred_roles;

insert into job_mart.main.preferred_roles(role_id, role_name)
values
    (1, 'Data Engineer'),
    (2, 'Data Analyst'),
    (3, 'Data Scientist')
;


alter table preferred_roles
add Column preferred_role_Yes_No boolean;

-- alter table preferred_roles
-- drop Column preferred_role_Yes_No ;

update preferred_roles
set preferred_role_Yes_No = case when role_name = 'Data Engineer' then true
                                when role_name = 'Data Analyst' then false
                                when role_name = 'Data Scientist' then false
                                else null
                            end;

-- alter table preferred_roles
-- rename to Priority_roles;

alter table preferred_roles
rename column preferred_role_Yes_No to priority_lvl;

alter table preferred_roles
alter column priority_lvl type int;



-- select * 
-- from information_schema.tables 
-- where table_catalog = 'job_mart';

select *
from preferred_roles;