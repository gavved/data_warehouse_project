with stg_job_ads as (select * from {{ source('jobs', 'stg_ads') }})

select
     employer__name as employer_name,
     employer__workplace as employer_workspace,
     workplace_address__municipality as workplace_city
from stg_job_ads
order by application_deadline