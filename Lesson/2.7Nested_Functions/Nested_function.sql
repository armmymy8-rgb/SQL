-- Array Intro
select [1,2,3] as a;

with a as(
select 'python' as skills
union all
select 'sql'
union all
select 'R'

), 
b as(
select array_agg(skills order by skills) as kuy
from a
)

select
    kuy[1] as first,
    kuy[2] as Second,
    kuy[3] as Third
from b
;

--Struct
select {skill:'python',type:'programming'} as skills_struct
;

with a as
(
select 
    struct_pack(
        skill := 'python',
        type := 'progrmming'
    ) as shit
)

select shit.type
from a
;


with aa AS
(
select 'python' as skills, 'progroamming' as types
union all
select 'sql','query_language'
union all
select 'R','progroamming'
)

select
    struct_pack(
        skill := skills,
        type := types
    ) as heee
from aa
;

-- Array of Struct
select[
    {skill:'python',type:'programming'},
    {skill:'sql',type:'query_language'},
    {skill:'R',type:'programming'}] as a
; 


with aa AS
(
select 'python' as skills, 'progroamming' as types
union all
select 'sql','query_language'
union all
select 'R','progroamming'
),
bb as(
select
    array_agg
    (
    struct_pack(
        skill := skills,
        type := types
    )) as heee
from aa
)

select
    heee[1].skill,
    heee[2].type,
    heee[3]
from bb
;

-- MAP
with a as(
select map{'skill':'python','type':'programming'} as aaa
)

select 
    aaa['skill'],
    aaa['type'],
    aaa
from a
;


-- JSON

-- select
--     To_json('{"skill":"Python","type":"Programming"}') as skill_json;
with a as
(
select
    '[{"skill":["Python","SQL"],"type":["Programming","Query"]},
    {"skill":"R","type":"Programming"}]'::json as skill_json
)

select 
    array_agg(
    struct_pack(
        skillss := Json_extract_string(e.value, '$.skill'),
        Typeessss := Json_extract_string(e.value, '$.type')
    ) 
    order by Json_extract_string(e.value, '$.skill')
    )as shit
    
from a, json_each(skill_json) as e
;








select unnest([{skill:'python',role_:'DA'},
        {skill:'sql',role_:'DE'},
        {skill:'python',role_:'DS'}]) as kuy;




with aa as(
select[
    {skill:'python',type:'programming'},
    {skill:'sql',type:'query_language'},
    {skill:'R',type:'programming'}] as a
),
bb as(
select unnest(a) as b
from aa
)
select b.skill
from bb
; 



with aa as(
select[
    {skill:'python',type:'programming'},
    {skill:'sql',type:'query_language'},
    {skill:'R',type:'programming'}] as a
)
select
    a[1].skill,
    a[2]
from aa
; 