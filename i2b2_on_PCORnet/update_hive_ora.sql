DEFINE hive_schema = &1;

whenever sqlerror continue;
delete from &hive_schema..crc_db_lookup where
  c_project_path = '/PCORI/'
;

whenever sqlerror exit sql.sqlcode;
insert into &hive_schema..crc_db_lookup (
  c_domain_id,
  c_project_path,
  c_owner_id,
  c_db_fullschema,
  c_db_datasource,
  c_db_servertype,
  c_db_nicename
) values (
  'i2b2demo',
  '/PCORI/',
  '@',
  'pcoridata',
  'java:/QueryToolPCORIDS',
  'ORACLE',
  'PCORnet CDM'
);

-- point ont at PCORIMETADATA

whenever sqlerror continue;
delete from &hive_schema..ont_db_lookup where
  c_project_path = 'PCORI/'
;

whenever sqlerror exit sql.sqlcode;
insert into &hive_schema..ont_db_lookup (
  c_domain_id,
  c_project_path,
  c_owner_id,
  c_db_fullschema,
  c_db_datasource,
  c_db_servertype,
  c_db_nicename
) values (
  'i2b2demo',
  'PCORI/',
  '@',
  'pcorimetadata',
  'java:/OntologyPCORIDS',
  'ORACLE',
  'PCORnet CDM'
);

-- workplace

whenever sqlerror continue;
delete from &hive_schema..work_db_lookup where
  c_project_path = 'PCORI/'
;

whenever sqlerror exit sql.sqlcode;
insert into &hive_schema..work_db_lookup (
  c_domain_id,
  c_project_path,
  c_owner_id,
  c_db_fullschema,
  c_db_datasource,
  c_db_servertype,
  c_db_nicename
) values (
  'i2b2demo',
  'PCORI/',
  '@',
  'Blueheronworkdata',
  'java:/WorkplaceBLUEHERONDS',
  'ORACLE',
  'PCORnet CDM'
);
