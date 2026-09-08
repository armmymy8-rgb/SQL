--.read Lesson/2.2/2.2.3_DDL_DML_pt3.sql---
use job_mart.main;

-- CTAS

create or replace table main.job_postings_fact_staging_CTAS as
select jpf.job_id,
       jpf.job_title_short,
       jpf.salary_year_avg
from data_jobs.job_postings_fact jpf
left join data_jobs.company_dim cd
on jpf.company_id = cd.company_id
;

select *
from main.job_postings_fact_staging_CTAS
limit 10;


-- VIEW


create or replace view main.job_postings_fact_staging_view as
select jpfs.*
from main.job_postings_fact_staging jpfs
join main.preferred_roles pr
on jpfs.job_title_short = pr.role_name
where pr.priority_lvl = 1
limit 10;


select *
from main.job_postings_fact_staging_view
limit 10;


-- Temp
create temporary temp table main.job_postings_fact_staging_temp as
select *
from main.job_postings_fact_staging_view
where job_title_short = 'Data Engineer'
limit 10;


select *
from main.job_postings_fact_staging_temp;