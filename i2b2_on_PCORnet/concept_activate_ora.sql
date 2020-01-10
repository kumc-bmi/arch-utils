DEFINE i2b2_metadata = 'DUAL';
DEFINE i2b2_data = 'DUAL';

-- for each PCORNET_*** ontology table, insert a record into TABLE_ACCESS
INSERT INTO &i2b2_metadata..TABLE_ACCESS (
  C_TABLE_CD,
  C_TABLE_NAME,
  C_PROTECTED_ACCESS,
  C_HLEVEL,
  C_FULLNAME,
  C_NAME,
  C_SYNONYM_CD,
  C_VISUALATTRIBUTES,
  C_FACTTABLECOLUMN,
  C_DIMTABLENAME,
  C_COLUMNNAME,
  C_COLUMNDATATYPE,
  C_OPERATOR,
  C_DIMCODE,
  C_TOOLTIP
) VALUES (
  'PCORNET_DIAG',
  'PCORNET_DIAG',
  'N',
  '0',
  '\PCORI\DIAGNOSIS',
  'PCORnet CDM Diagnoses',
  'N',
  'FA ',
  'concept_cd',
  'concept_dimension',
  'concept_path',
  'T',
  'like',
  '\PCORI\',
  'TODO'
);

INSERT INTO &i2b2_metadata..TABLE_ACCESS (
  C_TABLE_CD,
  C_TABLE_NAME,
  C_PROTECTED_ACCESS,
  C_HLEVEL,
  C_FULLNAME,
  C_NAME,
  C_SYNONYM_CD,
  C_VISUALATTRIBUTES,
  C_FACTTABLECOLUMN,
  C_DIMTABLENAME,
  C_COLUMNNAME,
  C_COLUMNDATATYPE,
  C_OPERATOR,
  C_DIMCODE,
  C_TOOLTIP
) VALUES (
  'PCORNET_DEMO',
  'PCORNET_DEMO',
  'N',
  '0',
  '\PCORI\DEMOGRAPHIC',
  'PCORnet CDM Demographics',
  'N',
  'FA ',
  'concept_cd',
  'concept_dimension',
  'concept_path',
  'T',
  'like',
  '\PCORI\',
  'TODO'
);

-- &i2b2_metadata `C_TABLENAME`s need to point at tables in &i2b2_data
UPDATE &i2b2_metadata..PCORNET_DEMO
  set C_TABLENAME = 'PATIENT_DIMENSION_VIEW'
  where regexp_like(C_FACTTABLECOLUMN, '^patient_num$', 'i');
-- PCORNET_DIAG taken care of already
UPDATE &i2b2_metadata..PCORNET_ENC
  set C_TABLENAME = 'VISIT_DIMENSION_VIEW'
  where regexp_like(C_FACTTABLECOLUMN, '^patient_num$', 'i');
UPDATE &i2b2_metadata..PCORNET_ENROLL
  set C_TABLENAME = 'MULTIFACT_ENROLLMENT_VIEW'
  where regexp_like(C_FACTTABLECOLUMN, '^patient_num$', 'i');
-- PCORNET_LAB taken care of already
-- PCORNET_MED taken care of already
-- PCORNET_PROC taken care of already

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
  -- Previously, ib.c_fullname was selected instead of ib.c_dimcode.  
  -- This was incorrect, because concept searches look for c_dimcode, 
  -- but it wasn't a huge problem because c_fullname and c_dimcode were  
  -- always identical. The SCILHS-based procedures ontology update (#26) 
  -- introduced terms where that is not true, which shed light on the error 
  -- and resulted in the change from ib.c_fullname to ib.c_dimcode.
  ib.c_dimcode, 
  max(ib.c_name), 
  update_date, 
  download_date, 
  sysdate, 
  sourcesystem_cd
from (select * from 
&i2b2_metadata..PCORNET_LAB -- for each ontology table
) ib
where ib.c_basecode is not null
group by ib.c_basecode, ib.c_dimcode
     , update_date, download_date, sysdate, sourcesystem_cd
;
