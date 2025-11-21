with src_employer as (select * from {{ ref('src_employer') }})

select
    {{ dbt_utils.generate_surrogate_key(['employer_name'])}} as employer_id,
    employer_name,
    employer_workspace,
    workplace_city
from src_employer

