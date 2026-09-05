SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
from 
    job_postings_fact
limit 10;

SELECT
    *
from 
    company_dim
limit 30;

select
    *
from 
    information_schema.table_constraints
where 
    table_catalog = 'data_jobs'
;

pragma show_tables_expanded;

describe job_postings_fact;