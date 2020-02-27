define i2b2_metadata = &1;
define i2b2_data = &2;
define cdm_schema = &3;

--create user &i2b2_data identified by "abc";
--create user &i2b2_metadata identified by "abc";
alter user &i2b2_data quota 16G on USERS;
alter user &i2b2_metadata quota 16G on USERS;
grant create sequence to &i2b2_data;
grant create type to &i2b2_data;
grant create session to &i2b2_data;
grant create session to &i2b2_metadata;
grant create table to &i2b2_data;
grant create table to &i2b2_metadata;
grant create any index to &i2b2_data;
grant create any index to &i2b2_metadata;
grant create procedure to &i2b2_data;
grant create procedure to &i2b2_metadata;

grant create view to &i2b2_data ;
grant select on &cdm_schema..diagnosis to &i2b2_data ;
grant select on &cdm_schema..enrollment to &i2b2_data ;
grant select on &cdm_schema..lab_result_cm to &i2b2_data ;
grant select on &cdm_schema..prescribing to &i2b2_data ;
grant select on &cdm_schema..procedures to &i2b2_data ;
grant select on &cdm_schema..demographic to &i2b2_data ;
grant select on &cdm_schema..encounter to &i2b2_data ;
grant select on &cdm_schema..vital to &i2b2_data ;

grant select on &i2b2_metadata..PCORNET_DIAG to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_DEMO to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_MED to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_PROC to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_VITAL to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_LAB to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_ENC to &i2b2_data ;
grant select on &i2b2_metadata..PCORNET_ENROLL to &i2b2_data ;
