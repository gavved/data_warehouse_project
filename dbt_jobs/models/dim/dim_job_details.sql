with src_jobs as (select * from {{ ref('src_jobs') }})

select
    id,
    headline,
    description_text,
    description_html_formatted,
    employment_type,
    duration,
    salary_type,
    scope_of_work_min,
    scope_of_work_max
from src_jobs

