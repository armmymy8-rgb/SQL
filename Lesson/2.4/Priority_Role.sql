
CREATE or replace table staging.priority_role(
    role_id integer primary key,
    role_name varchar,
    priority_lvl integer
);

insert into staging.priority_role(role_id,role_name,priority_lvl)
values
    (1,'Data Engineer',5),
    (2,'Senior Data Engineer',1),
    (3,'Software Engineer',1),
    (4,'Data Scientist',3)
;

select *
from staging.priority_role;