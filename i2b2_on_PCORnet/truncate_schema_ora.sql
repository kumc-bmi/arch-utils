-- warning, this is very destructive

declare
begin
  for tables in ( select table_name from user_tables ) loop
    begin
      execute immediate ( 'drop table ' ||tables.table_name|| ' cascade constraints' );
    end;
  end loop;

  for indices in ( select index_name from user_indexes where index_type = 'NORMAL' ) loop
    begin
      execute immediate ( 'drop index ' ||indices.index_name );
    end;
  end loop;

  for myviews in ( select view_name from user_views ) loop
    begin
      execute immediate ( 'drop view ' ||myviews.view_name );
    end;
  end loop;

  for myprocedures in ( select object_name from user_procedures ) loop
    begin
      execute immediate ( 'drop procedure ' ||myprocedures.object_name );
    end;
  end loop;
end;
/
