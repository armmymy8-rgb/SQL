select
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills

from 
    job_postings_fact jpf
left join 
    skills_job_dim sjd
on 
    jpf.job_id = sjd.job_id
left JOIN
    skills_dim sd
on
    sjd.skill_id = sd.skill_id
where
    sjd.skill_id is null
limit 10;