use role jobs_dlt_role;

use database jobs;

show schemas;

desc table staging.sales_field_job_ads;


select * from staging.sales_field_job_ads LIMIT 50;



select employment_type__label, employer__name, workplace_address__municipality, occupation__label from staging.sales_field_job_ads;

