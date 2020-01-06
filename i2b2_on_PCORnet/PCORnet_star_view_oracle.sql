DEFINE source_schema = 'DUAL';
DEFINE target_schema = 'DUAL';

CREATE OR REPLACE VIEW &target_schema..multifact_diagnosis_view (
  patient_num,
  concept_cd,
  encounter_num,
  instance_num,
  provider_id,
  start_date,
  modifier_cd,
  observation_blob,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  quantity_num,
  units_cd,
  end_date,
  location_cd,
  confidence_num,
  sourcesystem_cd,
  update_date,
  download_date,
  import_date,
  upload_id
)
AS SELECT
  cast(patid as NUMBER(38,0)),
  CASE
    when (DX_TYPE = '09') then CONCAT('ICD9:', DX)
    when (DX_TYPE = '10') then CONCAT('ICD10:', DX)
  END,
  cast(ENCOUNTERID as NUMBER(38,0)),
  1,
  PROVIDERID,
  ADMIT_DATE,
  '@', --ISSUE UNPIVOT
  cast(null as varchar(100)),
  ENC_TYPE,
  DX_TYPE,
  cast(null as decimal),
  DX_SOURCE,
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as NUMBER(38,0))
FROM &source_schema..diagnosis;

CREATE OR REPLACE VIEW &target_schema..MULTIFACT_ENROLLMENT_VIEW (
  patient_num,
  concept_cd,
  encounter_num,
  instance_num,
  provider_id,
  start_date,
  modifier_cd,
  observation_blob,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  quantity_num,
  units_cd,
  end_date,
  location_cd,
  confidence_num,
  sourcesystem_cd,
  update_date,
  download_date,
  import_date,
  upload_id
)
AS SELECT
  cast(PATID as NUMBER(38,0)),
  CONCAT('ENR_BASIS:' , ENR_BASIS),
  Cast(null as NUMBER(38,0)) ,
  1,
  '@',
  ENR_START_DATE ,
  CHART,
  cast(null as varchar(100)),
  cast(null as varchar(100)),
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  ENR_END_DATE,
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as NUMBER(38,0))
FROM &source_schema..ENROLLMENT;

CREATE OR REPLACE VIEW &target_schema..MULTIFACT_LABRESULTS_VIEW (
  patient_num,
  concept_cd,
  encounter_num,
  instance_num,
  provider_id,
  start_date,
  modifier_cd,
  observation_blob,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  quantity_num,
  units_cd,
  end_date,
  location_cd,
  confidence_num,
  sourcesystem_cd,
  update_date,
  download_date,
  import_date,
  upload_id
)
AS SELECT
  cast(PATID as NUMBER(38,0)),
  CONCAT('LOINC:', LAB_LOINC),
  cast(ENCOUNTERID as NUMBER(38,0)),
  1,
  '@',
  SPECIMEN_DATE,
  '@', --used to be RESULT_LOC
  cast(null as varchar(100)),
  CASE
    when result_num IS NULL then 'T'
    ELSE 'N'
  END,
  CASE
    when result_num IS NULL then result_qual
    ELSE 'E'
  END,
  RESULT_NUM,
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  RESULT_DATE,
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as NUMBER(38,0))
FROM &source_schema..lab_result_cm;

CREATE OR REPLACE VIEW &target_schema..MULTIFACT_PRESCRIBING_VIEW (
  patient_num,
  concept_cd,
  encounter_num,
  instance_num,
  provider_id,
  start_date,
  modifier_cd,
  observation_blob,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  quantity_num,
  units_cd,
  end_date,
  location_cd,
  confidence_num,
  sourcesystem_cd,
  update_date,
  download_date,
  import_date,
  upload_id
)
AS SELECT
  cast(PATID as NUMBER(38,0)),
  CONCAT('RXNORM:' , RXNORM_CUI),
  cast(ENCOUNTERID as NUMBER(38,0)),
  1,
  RX_PROVIDERID,
  RX_START_DATE,
  RX_FREQUENCY,
  cast(null as varchar(100)),
  cast(null as varchar(100)),
  RX_BASIS,
  cast(RX_QUANTITY as decimal),
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  RX_END_DATE,
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as NUMBER(38,0))
FROM &source_schema..prescribing;

CREATE OR REPLACE VIEW &target_schema..MULTIFACT_PROCEDURE_VIEW (
  patient_num,
  concept_cd,
  encounter_num,
  instance_num,
  provider_id,
  start_date,
  modifier_cd,
  observation_blob,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  quantity_num,
  units_cd,
  end_date,
  location_cd,
  confidence_num,
  sourcesystem_cd,
  update_date,
  download_date,
  import_date,
  upload_id
)
AS SELECT
  cast(PATID as NUMBER(38,0)),
  CASE
    when (px_type = '09') then concat('ICD9:', PX)
    when (px_type = 'CH') then concat ('CPT:', PX)
    when (px_type = '10') then concat ('ICD10:', PX)
  END,
  cast(ENCOUNTERID as NUMBER(38,0)),
  1,
  PROVIDERID,
  ADMIT_DATE,
  '@',
  cast(null as varchar(100)),
  cast(null as varchar(100)),
  ENC_TYPE,
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  PX_DATE ,
  cast(null as varchar(100)),
  cast(null as decimal),
  cast(null as varchar(100)),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as NUMBER(38,0))
FROM &source_schema..procedures;

CREATE OR REPLACE VIEW &target_schema..PATIENT_DIMENSION (
  patient_num,
  vital_status_cd,
  birth_date,
  death_date,
  sex_cd,
  age_in_years_num,
  language_cd,
  race_cd,
  marital_status_cd,
  religion_cd,
  zip_cd,
  statecityzip_path,
  income_cd,
  patient_blob,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd,
  upload_id
)
AS SELECT
  cast(patid as NUMBER(38,0)),
  biobank_flag,
  birth_date,
  cast(null as timestamp), --death_date
  sex,
  cast(null as NUMBER(38,0)) ,
  cast(null as varchar(100)), --language_cd
  RACE,
  cast(null as varchar(100)), --marital_status_cd
  cast(null as varchar(100)) , --religion_cd
  cast(null as varchar(100)),
  cast(null as varchar(100)), --statecityzip_path
  cast(null as varchar(100)),
  cast(null as varchar(100)), --patient_blob
  cast(null as timestamp), --update_date
  cast(null as timestamp),
  cast(null as timestamp), --import_date
  cast(null as varchar(100)),
  cast(null as NUMBER(38,0))
FROM &source_schema..demographic;

CREATE OR REPLACE VIEW &target_schema..VISIT_DIMENSION (
  patient_num,
  encounter_num,
  active_status_cd,
  start_date,
  end_date,
  inout_cd,
  location_cd,
  location_path,
  length_of_stay,
  visit_blob,
  update_date,
  download_date,
  import_date,
  sourcesystem_cd,
  upload_id,
  drg,
  discharge_status,
  discharge_disposition,
  location_zip,
  admitting_source,
  facilityid,
  providerid
)
AS SELECT
  cast(PATID as NUMBER(38,0)),
  cast(encounterid as NUMBER(38,0)),
  cast(null as varchar(100)), --active_status_cd
  admit_date,
  discharge_date,
  enc_type, --inout_cd
  facility_location,
  cast(null as varchar(100)), --location_path
  cast(null as NUMBER(38,0)),
  cast(null as varchar(100)), --visit_blob
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as timestamp),
  cast(null as varchar(100)), --sourcesystem_cd
  cast(null as NUMBER(38,0)),
  drg,
  discharge_status,
  DISCHARGE_DISPOSITION,
  facility_location, --location_zip
  providerid,
  facilityid,
  providerid
FROM &source_schema..encounter;
