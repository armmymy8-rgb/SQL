/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/


select sd.skills,
        median(salary_year_avg) as avg_salary,
        count(salary_year_avg) as skill_frequency
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
limit 20;



/*
┌───────────┬────────────┬─────────────────┐
│  skills   │ avg_salary │ skill_frequency │
│  varchar  │   double   │      int64      │
├───────────┼────────────┼─────────────────┤
│ rust      │   199000.0 │              27 │
│ solidity  │   192500.0 │               3 │
│ golang    │   181122.5 │              48 │
│ groovy    │   180000.0 │               1 │
│ ggplot2   │   176250.0 │               2 │
│ spring    │   175500.0 │              37 │
│ terraform │   175000.0 │             238 │
│ ocaml     │   172500.0 │               1 │
│ haskell   │   172500.0 │               1 │
│ erlang    │   172500.0 │               1 │
│ neo4j     │   171500.0 │              27 │
│ redis     │   170750.0 │              42 │
│ sheets    │   170159.0 │               4 │
│ gdpr      │   169615.5 │              24 │
│ zoom      │   168437.5 │              14 │
│ flutter   │   164000.0 │               4 │
│ graphql   │   163750.0 │              32 │
│ opencv    │   162500.0 │               3 │
│ django    │   160000.0 │               7 │
│ c         │   159500.0 │              39 │
└───────────┴────────────┴─────────────────┘
  20 rows                        3 columns
  */