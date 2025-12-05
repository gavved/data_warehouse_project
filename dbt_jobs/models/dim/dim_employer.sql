with src_employer as (select * from {{ ref('src_employer') }})

select
    {{ dbt_utils.generate_surrogate_key(['employer_name'])}} as employer_id,
    employer_name,
    employer_workplace,
    employer_orgnr,
    workplace_street_address,
    workplace_region,
    workplace_postcode,
    workplace_city,
    workplace_country
from src_employer

