DEFINE i2b2_metadata = &1;
DEFINE i2b2_data = &2;

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
  ib.c_dimcode,
  max(ib.c_name),
  update_date,
  download_date,
  sysdate,
  sourcesystem_cd
from (select * from
&i2b2_metadata..PCORNET_DIAG
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
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
from (select * from
&i2b2_metadata..PCORNET_MED
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
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
from (select * from
&i2b2_metadata..PCORNET_PROC
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
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
from (select * from
&i2b2_metadata..PCORNET_VITAL
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
;

-- PK conflict
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
from (select * from 
&i2b2_metadata..PCORNET_LAB
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
;

-- PK conflict
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
from (select * from
&i2b2_metadata..PCORNET_ENC
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
;

-- PK conflict
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
from (select * from
&i2b2_metadata..PCORNET_ENROLL
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
;
