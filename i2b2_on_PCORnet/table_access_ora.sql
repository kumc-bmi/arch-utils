DEFINE i2b2_metadata = &1;

whenever sqlerror continue;
DELETE from &i2b2_metadata..TABLE_ACCESS where c_table_cd like 'PCORNET_%' ;

-- for each PCORNET_*** ontology table, insert a record into TABLE_ACCESS

whenever sqlerror exit sql.sqlcode;
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
  'PCORNET_ENC',
  'PCORNET_ENC',
  'N',
  '0',
  '\PCORI\ENCOUNTER',
  'PCORnet CDM Encounters',
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
  'PCORNET_ENROLL',
  'PCORNET_ENROLL',
  'N',
  '0',
  '\PCORI\ENROLLMENT',
  'PCORnet CDM Enrollments',
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
  'PCORNET_LAB',
  'PCORNET_LAB',
  'N',
  '0',
  '\PCORI\LAB_RESULT_CM',
  'PCORnet CDM Lab Results',
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
  'PCORNET_MED',
  'PCORNET_MED',
  'N',
  '0',
  '\PCORI\MEDICATION',
  'PCORnet CDM Medications',
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
  'PCORNET_PROC',
  'PCORNET_PROC',
  'N',
  '0',
  '\PCORI\PROCEDURE',
  'PCORnet CDM Procedures',
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
  'PCORNET_VITAL',
  'PCORNET_VITAL',
  'N',
  '0',
  '\PCORI\VITAL',
  'PCORnet CDM Vitals',
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
