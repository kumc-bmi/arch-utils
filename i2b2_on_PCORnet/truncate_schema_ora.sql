DEFINE i2b2_metadata = &1;

declare
begin
  for indices in ( select index_name from user_indexes ) loop
    begin
      execute immediate ( 'drop index ' ||indices.index_name );
    end;
  end loop;
end;

declare
begin
  for tables in ( select table_name from user_tables ) loop
    begin
      execute immediate ( 'drop table ' ||tables.table_name );
    end;
  end loop;
end;


drop table &i2b2_metadata..BIRN ;
drop table &i2b2_metadata..CUSTOM_META ;
drop table &i2b2_metadata..I2B2 ;
drop table &i2b2_metadata..ICD10_ICD9 ;
drop table &i2b2_metadata..ONT_PROCESS_STATUS ;
drop table &i2b2_metadata..PCORNET_DEMO ;
drop table &i2b2_metadata..PCORNET_DIAG ;
drop table &i2b2_metadata..PCORNET_ENC ;
drop table &i2b2_metadata..PCORNET_ENROLL ;
drop table &i2b2_metadata..PCORNET_LAB ;
drop table &i2b2_metadata..PCORNET_MED ;
drop table &i2b2_metadata..PCORNET_PROC ;
drop table &i2b2_metadata..PCORNET_VITAL ;
drop table &i2b2_metadata..PHI ;
drop table &i2b2_metadata..SCHEMES ;
