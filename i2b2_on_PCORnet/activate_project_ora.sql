DEFINE pm_schema = &1;
DEFINE hive_schema = &2;

delete from &pm_schema..pm_project_data where
  project_id = 'pcornet_cdm'
;

insert into &pm_schema..pm_project_data (
  project_id,
  project_name,
  project_wiki,
  project_path,
  status_cd
) values (
  'pcornet_cdm',
  'PCORnet CDM',
  'http://informatics.kumc.edu/',
  '/PCORI', -- not a typo
  'A'
);

--

delete from &hive_schema..crc_db_lookup where
  c_project_path = '/PCORI/'
;

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
  'pcornetdata',
  'java:/QueryToolPCORNETDS',
  'ORACLE',
  'PCORnet CDM'
);
