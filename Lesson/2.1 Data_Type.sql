select table_name,
        column_name,
        data_type
from information_schema.columns
where table_name = 'job_postings_fact'
;


describe 
job_postings_fact;


describe
select
    job_title_short,
    salary_year_avg,
from

    job_postings_fact
    ;

select cast(123 as VARCHAR) ;

select cast('123' as integer) ;



select
    extract(month from job_posted_date) as job_posted_month
from

    job_postings_fact
limit 20
    ;