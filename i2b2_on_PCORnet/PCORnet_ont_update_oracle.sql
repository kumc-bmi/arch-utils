DEFINE metadata_schema = 'DUAL' ;

update &metadata_schema..pcornet_proc
  set c_facttablecolumn='MULTIFACT_PROCEDURE_VIEW.'||c_facttablecolumn
update &metadata_schema..pcornet_diag
  set c_facttablecolumn='MULTIFACT_DIAGNOSIS_VIEW.'||c_facttablecolumn
update &metadata_schema..pcornet_med
  set c_facttablecolumn='MULTIFACT_PRESCRIBING_VIEW.'||c_facttablecolumn
update &metadata_schema..pcornet_lab
  set c_facttablecolumn='MULTIFACT_LABRESULTS_VIEW.'||c_facttablecolumn
update &metadata_schema..pcornet_vital
  set c_facttablecolumn='MULTIFACT_VITAL_VIEW.'||c_facttablecolumn
-- Undo the change on diagnosis for modifiers to enable diag modifiers
update &metadata_schema..pcornet_diag
  set c_facttablecolumn='modifier_cd' where c_facttablecolumn like '%.modifier_cd'

-- Undo a default ontology change inserted to match to demodata in i2b2
UPDATE "i2b2metadata"."pcornet_diag"
  SET "c_basecode"='P'
  WHERE "c_hlevel"=2 AND "c_fullname"='\PCORI_MOD\PDX\P\'
                     AND "c_name"='Principal'
                     AND "c_synonym_cd"='N'
UPDATE "i2b2metadata"."pcornet_diag"
  SET "c_basecode"='S'
  WHERE "c_hlevel"=2 AND "c_fullname"='\PCORI_MOD\PDX\S\'
                     AND "c_name"='Secondary'
                     AND "c_synonym_cd"='N'
UPDATE "i2b2metadata"."pcornet_diag"
  SET "c_basecode"='X'
  WHERE "c_hlevel"=2 AND "c_fullname"='\PCORI_MOD\PDX\X\'
                     AND "c_name"='Unable to classify'
                     AND "c_synonym_cd"='N'
