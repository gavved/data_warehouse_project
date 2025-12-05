with stg_job_ads as (select * from {{ source('jobs', 'stg_ads') }})

select
    occupation__label,
    id,
    employer__name,
    workplace_address__municipality as workplace_city,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline,
    headline,
    description__text as description_text,
    description__text_formatted as description_html_formatted,
    employment_type__label as employment_type,
    duration__label as duration,
    salary_type__label as salary_type,
    scope_of_work__min as scope_of_work_min,
    scope_of_work__max as scope_of_work_max,
    experience_required,
    driving_license_required,
    access_to_own_car
from stg_job_ads
order by application_deadline