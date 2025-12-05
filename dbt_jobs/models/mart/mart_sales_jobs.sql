with 
    fct_job_ads as (select * from {{ ref('fct_job_ads') }}),
    dim_occupation as (select * from {{ ref('dim_occupation') }}),
    dim_employer as (select * from {{ ref('dim_employer') }})
select
    o.occupation_label,
    f.vacancies,
    f.relevance,
    o.occupation_group,
    o.occupation_field,
    e.employer_name,
    e.employer_workplace,
    e.workplace_city
from fct_job_ads as f
left join dim_employer e on f.employer_id = e.employer_id
left join dim_occupation o on f.occupation_id = o.occupation_id
