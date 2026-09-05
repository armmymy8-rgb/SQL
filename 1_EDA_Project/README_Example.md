# Heading 1
## Heading 2
### Heading 3

Normal Text  
***Shit***  
*FUCK*  
`This is code`  

- Bullet 1
- Bullet 2  

[Link Text](https://www.google.gg/index.html)
![Alt Text](image.png)
![Alt Text](../Lesson/1_2_Data_Warehouse.png)


```sql
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
```
