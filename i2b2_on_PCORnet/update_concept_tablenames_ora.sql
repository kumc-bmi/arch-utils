DEFINE i2b2_metadata = &1;

whenever sqlerror exit sql.sqlcode;

-- &i2b2_metadata `C_TABLENAME`s need to point at tables in &i2b2_data
UPDATE &i2b2_metadata..PCORNET_DEMO
  set C_TABLENAME = 'MULTIFACT_PATIENT_DIMENSION_VIEW'
  where regexp_like(C_TABLENAME, '^patient_dimension$', 'i');

-- PCORNET_DIAG taken care of already

UPDATE &i2b2_metadata..PCORNET_ENC
  set C_TABLENAME = 'MULTIFACT_VISIT_DIMENSION_VIEW'
  where regexp_like(C_TABLENAME, '^visit_dimension$', 'i');

UPDATE &i2b2_metadata..PCORNET_ENROLL
  set C_TABLENAME = 'MULTIFACT_VISIT_DIMENSION_VIEW'
  where regexp_like(C_TABLENAME, '^visit_dimension$', 'i');

-- PCORNET_LAB taken care of already
-- PCORNET_MED taken care of already
-- PCORNET_PROC taken care of already
