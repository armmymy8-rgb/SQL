
-- select 
--     jpf.job_id,
--     jpf.job_title_short,
--     jpf.salary_year_avg,
--     array_agg(sd.skills order by sd.skills) as skills_array,
--     array_agg(sd.type order by sd.type) as type_array
-- from job_postings_fact as jpf
-- left join skills_job_dim sjd
--     on jpf.job_id = sjd.job_id
-- left join skills_dim sd
--     on sjd.skill_id = sd.skill_id
-- group by all
-- limit 20
-- ;

create or replace temp table job_skills_array_struct as
select 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    array_agg(
        struct_pack(
            skill_type := sd.type,
            skill_name := sd.skills
        ) 
    ) as skills_type
from job_postings_fact as jpf
left join skills_job_dim sjd
    on jpf.job_id = sjd.job_id
left join skills_dim sd
    on sjd.skill_id = sd.skill_id
group by all
;


with a as(
select 
    job_id,
     job_title_short,
    salary_year_avg,
     unnest(skills_type).skill_type as skill_type,
     unnest(skills_type).skill_name as skill_name
from job_skills_array_struct
)

select 
    job_title_short,
    skill_type,
    median(salary_year_avg)
from a
where job_title_short = 'Data Analyst'
group by job_title_short,skill_type
order by 3 desc
;


-- select *
-- from job_skills_array_struct
-- limit 20
-- ;

-- with a as(
-- select 
--     job_id,
--      job_title_short,
--     salary_year_avg,
--      unnest(skills_type) as skills_type
-- from job_skills_array_struct
-- ),
-- b as(
-- select  job_id,
--      job_title_short,
--     salary_year_avg,
--     skills_type.skill_name,
--     skills_type.skill_type
-- from a
-- )

-- select 
--     job_title_short,
--     skill_type,
--     median(salary_year_avg)
-- from b
-- where job_title_short = 'Data Analyst'
-- group by job_title_short,skill_type
-- order by 3 desc
-- ;