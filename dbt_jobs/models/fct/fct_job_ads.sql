with jobs as (select * from {{ ref('src_jobs') }})

select
    {{ dbt_utils.generate_surrogate_key(['occupation__label'])}} as occupation_id,
    id as job_details_id,
    {{ dbt_utils.generate_surrogate_key(['employer__name'])}} as employer_id,
    vacancies,
    relevance,
    application_deadline

from jobs