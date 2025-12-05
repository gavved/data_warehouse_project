with src_jobs as (select * from {{ ref('src_jobs') }})

select
    {{ dbt_utils.generate_surrogate_key(['experience_required',
    'driving_license_required',
    'access_to_own_car'])}} as aux_attribute_id,
    experience_required,
    driving_license_required,
    access_to_own_car
from src_jobs

