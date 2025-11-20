USE role sysadmin;

create warehouse dev_wh;

use database jobs;

create schema if not exists warehouse;

create schema if not exists marts;