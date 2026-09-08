with a as(
SELECT  
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
where extract(year from job_posted_date) = 2023
limit 5
),
b as(
SELECT  
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
where extract(year from job_posted_date) = 2024
limit 5
)

select * 
from a
union
select * 
from b;



select unnest([1,1,1,2])
union all
select unnest([1,1,3]);




