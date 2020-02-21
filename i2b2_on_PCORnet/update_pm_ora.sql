DEFINE pm_schema = &1;

whenever sqlerror continue;
delete from &pm_schema..pm_project_data where
  project_id = 'PCORI'
;

-- avoid "Concept missing"

insert into &pm_schema..pm_project_user_roles (
  project_id,
  user_id,
  user_role_cd,
  status_cd
) values (
  'PCORI',
  'OBFSC_SERVICE_ACCOUNT',
  'USER',
  'A'
);

insert into &pm_schema..pm_project_user_roles (
  project_id,
  user_id,
  user_role_cd,
  status_cd
) values (
  'PCORI',
  'OBFSC_SERVICE_ACCOUNT',
  'DATA_OBFSC',
  'A'
);

-- create project

whenever sqlerror exit sql.sqlcode;
insert into &pm_schema..pm_project_data (
  project_id,
  project_name,
  project_wiki,
  project_path,
  status_cd
) values (
  'PCORI',
  'PCORnet CDM',
  'http://informatics.kumc.edu/',
  '/PCORI', -- not a typo
  'A'
);
