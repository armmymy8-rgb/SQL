-- Array

create or replace temp table job_skills_array as
select 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    array_agg(sd.skills order by sd.skills) as skills_array
from job_postings_fact as jpf
left join skills_job_dim sjd
    on jpf.job_id = sjd.job_id
left join skills_dim sd
    on sjd.skill_id = sd.skill_id
group by all
;

with a as
(
select 
    job_id,
    job_title_short,
    salary_year_avg,
    unnest(skills_array) as skill
from job_skills_array

)

select 
    job_title_short,
    skill,
    count(skill) as count_skill,
    median(salary_year_avg) as avg_salary_per_skill
from a
where job_title_short = 'Data Analyst'
    and salary_year_avg is not NULL
group by job_title_short,skill
order by 3 desc ,4 desc
limit 30
;