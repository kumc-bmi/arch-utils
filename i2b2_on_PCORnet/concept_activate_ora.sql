DEFINE i2b2_metadata = &1;
DEFINE i2b2_data = &2;

whenever sqlerror exit sql.sqlcode;
delete from PCORIDATA.concept_dimension;

-- intended to run as data user:
-- grant select on &i2b2_metadata..PCORNET_DIAG to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_DEMO to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_MED to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_PROC to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_VITAL to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_LAB to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_ENC to &i2b2_data ;
-- grant select on &i2b2_metadata..PCORNET_ENROLL to &i2b2_data ;

-- activate concepts
insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_fullname,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_DEMO) ib
where ib.c_basecode is not null
  and ib.c_dimcode is not null
group by ib.c_basecode,
  ib.c_fullname,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_dimcode,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_DIAG) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_dimcode,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_dimcode,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_MED) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_dimcode,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_dimcode,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_PROC) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_dimcode,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_dimcode,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_VITAL) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_dimcode,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_dimcode,
  max(ib.c_name),
  max(update_date),
  max(download_date),
  sysdate,
  sourcesystem_cd
from (select * from &i2b2_metadata..PCORNET_LAB) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_dimcode,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_fullname,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from ( select * from &i2b2_metadata..PCORNET_ENC ) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_fullname,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;

insert into &i2b2_data..CONCEPT_DIMENSION(
  concept_cd,
  concept_path,
  name_char,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd
)
select distinct
  ib.c_basecode,
  ib.c_fullname,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from ( select * from &i2b2_metadata..PCORNET_ENROLL ) ib
where ib.c_basecode is not null
group by
  ib.c_basecode,
  ib.c_fullname,
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
;
