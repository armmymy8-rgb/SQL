CREATE or replace table  main.priority_jobs_snapshot
(
    job_id              integer primary key,
    job_title_short     varchar,   
    company_name        varchar,
    job_posted_date     Timestamp,
    salary_year_avg     double,
    priority_lvl        integer,
    updated_at          Timestamp
);

INSERT into  main.priority_jobs_snapshot
(
    job_id,
    job_title_short,  
    company_name ,  
    job_posted_date,
    salary_year_avg,  
    priority_lvl,       
    updated_at          
)
select 
    jpf.job_id,
    jpf.job_title_short,
    cd.name as company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priority_lvl,
    current_Timestamp
from 
    data_jobs.main.job_postings_fact jpf
left join
    data_jobs.main.company_dim  cd
on
    jpf.company_id = cd.company_id
inner join
    staging.priority_role r
on
    jpf.job_title_short = r.role_name
;


select 
    job_title_short,
    count(*) as job_count,
    min(priority_lvl) as priority_lvl,
    min(updated_at) as updated_at
from main.priority_jobs_snapshot
group by job_title_short
limit 20;