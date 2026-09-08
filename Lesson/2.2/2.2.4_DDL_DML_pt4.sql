select count(*) from main.job_postings_fact_staging_CTAS;
select count(*) from main.job_postings_fact_staging_view;
select count(*) from main.job_postings_fact_staging_temp;

delete from main.job_postings_fact_staging_CTAS
where salary_year_avg < 150000;


truncate table main.job_postings_fact_staging_CTAS;