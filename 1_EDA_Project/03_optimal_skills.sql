/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/


select sd.skills,
        median(salary_year_avg) as avg_salary,
        count(salary_year_avg) as skill_frequency,
        round(median(salary_year_avg)*count(salary_year_avg)/1000000,2) as Opimal_Score
from job_postings_fact jpf
inner join skills_job_dim sjd
on jpf.job_id = sjd.job_id
inner join skills_dim sd
on sjd.skill_id = sd.skill_id
where sjd.skill_id is not null
and job_title_short like '%Data Engineer%'
and job_work_from_home = 'True'
group by sd.skills
order by 4 desc
limit 20;
