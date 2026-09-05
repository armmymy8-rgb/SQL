/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

select sd.skills,
        count(*) as demand_count
from job_postings_fact jpf
inner join skills_job_dim sjd
on jpf.job_id = sjd.job_id
inner join skills_dim sd
on sjd.skill_id = sd.skill_id
where sjd.skill_id is not null
and job_title_short like '%Data Engineer%'
and job_work_from_home = 'True'
group by sd.skills
order by 2 desc
limit 10;


/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        38368 │
│ python     │        38117 │
│ aws        │        24514 │
│ azure      │        18707 │
│ spark      │        17591 │
│ airflow    │        13395 │
│ snowflake  │        11781 │
│ databricks │        10962 │
│ java       │         9993 │
│ kafka      │         9315 │
└────────────┴──────────────┘
  10 rows         2 columns
*/