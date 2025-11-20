use role useradmin;

create role if not exists jobs_dlt_role;

create role if not exists jobs_reader_role;

use role securityadmin;

grant role jobs_dlt_role to user extract_loader;

grant role jobs_reader_role to user gavved;
grant role jobs_dlt_role to user gavved;


grant usage on warehouse dev_wh to role jobs_dlt_role;

grant usage on database jobs to role jobs_dlt_role;

grant usage on schema jobs.staging to role jobs_dlt_role;

grant create table on schema jobs.staging to role jobs_dlt_role;

grant insert, update, delete on all tables in schema jobs.staging to role jobs_dlt_role;

grant insert, update, delete on future tables in schema jobs.staging to role jobs_dlt_role;



grant usage on warehouse dev_wh to role jobs_reader_role;

grant usage on database jobs to role jobs_reader_role;

grant usage on schema jobs.staging to role jobs_reader_role;

grant select on all tables in schema jobs.staging to role jobs_reader_role;

grant select on future tables in database jobs to role jobs_reader_role;



create role if not exists jobs_ads_dbt_role;

grant role jobs_ads_dbt_role to user transformer;

grant role jobs_ads_dbt_role to user gavved;

grant role jobs_dlt_role to role jobs_ads_dbt_role;

use role jobs_ads_dbt_role;




grant usage,
create table,
create view on schema jobs.warehouse to role jobs_ads_dbt_role;

grant select,
insert,
update,
delete on all tables in schema jobs.warehouse to role jobs_ads_dbt_role;

grant select on all views in schema jobs.warehouse to role jobs_ads_dbt_role;


grant select,
insert,
update,
delete on future tables in schema jobs.warehouse to role jobs_ads_dbt_role;

grant select on future views in schema jobs.warehouse to role jobs_ads_dbt_role;

use role jobs_ads_dbt_role;

select * from jobs.staging.sales_field_job_ads limit 10;




grant usage,
create table,
create view on schema jobs.marts to role jobs_ads_dbt_role;

grant select,
insert,
update,
delete on all tables in schema jobs.marts to role jobs_ads_dbt_role;

grant select on all views in schema jobs.marts to role jobs_ads_dbt_role;


grant select,
insert,
update,
delete on future tables in schema jobs.marts to role jobs_ads_dbt_role;

grant select on future views in schema jobs.marts to role jobs_ads_dbt_role;

use role jobs_ads_dbt_role;

