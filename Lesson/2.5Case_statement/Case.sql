select 
    job_title_short,
    salary_hour_avg,
    case
        when salary_hour_avg is null then 'missing'
        when salary_hour_avg < 25 then 'Low'
        when salary_hour_avg < 50 then 'Med'
        else 'High'
    end as salary_category
    from job_postings_fact
    limit 10;


SELECT  
    job_title_short,
    salary_hour_avg,
    salary_year_avg
FROM    
    job_postings_fact
WHERE   salary_hour_avg is not null or salary_year_avg is not NULL
limit 30;