with jobs as (select * from {{ ref('src_jobs') }})

select
    {{ dbt_utils.generate_surrogate_key(['occupation__label'])}} as occupation_id,
    id as job_details_id,
    {{ dbt_utils.generate_surrogate_key(['employer__name', 'workplace_city'])}} as employer_id,
    {{ dbt_utils.generate_surrogate_key(['experience_required',
    'driving_license_required',
    'access_to_own_car'])}} as aux_attribute_id,
    vacancies,
    relevance,
    application_deadline

from jobs