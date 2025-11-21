with stg_job_ads as (select * from {{ source('jobs', 'stg_ads') }})

select
    occupation__label,
    id,
    employer__name,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline
from stg_job_ads
order by application_deadline