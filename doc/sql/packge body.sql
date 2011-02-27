create or replace
PACKAGE BODY        "PKG_LIST_BUSINESS"           as  
  function get_page_by_number(                     
    field_list      in varchar2,                     
    table_name      in varchar2,                     
    query_condition in varchar2,                     
    order_list      in varchar2,                     
    each_count      in integer,                     
    page_number     in integer,  
    field_order     in integer,  
    field_sc        in varchar2  
  ) return pkg_custom_type.cursor_type is                 
    p_query_condition varchar2(32000);                 
    p_order_list      varchar2(2000);                 
    sql_statement     varchar2(32000);     
    i_count           integer(10);  
    str_order_field   varchar2(2000);  
    tmp_field_list    varchar2(2000);  
    result_cursor     pkg_custom_type.cursor_type;                 
  begin                 
    if (query_condition is not null) then                 
      p_query_condition := ' where ' || query_condition;                 
    end if;                 
    i_count:=0;  
    tmp_field_list:=field_list;  
    if(field_order<>-1) then         
      while(instr(tmp_field_list,',')>0) loop  
         if(i_count=field_order) then  
           str_order_field:=substr(tmp_field_list,0,instr(tmp_field_list,',')-1);  
           dbms_output.put_line('----------'||str_order_field);  
           while(instr(str_order_field,' ')>0) loop  
              str_order_field:=substr(str_order_field,instr(str_order_field,' ')+1);  
           end loop;  
           dbms_output.put_line('----------'||str_order_field);  
           exit;  
         end if;  
         tmp_field_list:=substr(tmp_field_list,instr(tmp_field_list,',')+1);  
         i_count:=i_count+1;    
      end loop;  
    else  
      str_order_field:=order_list;  
    end if;  
    if (str_order_field is not null) then                 
      p_order_list := ' order by ' || str_order_field;  
      if(field_order<>-1) then   
        p_order_list := p_order_list ||' '||field_sc;                 
      end if;  
    end if;   
    sql_statement  := ' select ' || field_list || ' from ' || table_name ||                 
                      p_query_condition || p_order_list;                 
    sql_statement  := ' select a.*, rownum record_number from (' || sql_statement || ') a ' ||                 
                      ' where rownum <=' || cast(each_count*page_number as char);                 
    sql_statement  := ' select b.* from (' || sql_statement || ') b ' ||                 
                      ' where record_number >' || cast(each_count*(page_number-1) as char);   
 
    dbms_output.put_line(sql_statement);   
    open result_cursor for sql_statement;                 
    return result_cursor;                 
  end;                 
                     
  function get_total_info(                  
    table_name      in varchar2,                     
    query_condition in varchar2,                     
    each_count      in integer                     
  ) return pkg_custom_type.cursor_type is                 
    p_query_condition varchar2(2000);                 
    sql_statement     varchar2(32000);                 
    record_count      integer;                 
    page_count        integer;                 
    result_cursor     pkg_custom_type.cursor_type;                 
  begin                 
    if (query_condition is not null) then                 
      p_query_condition := ' where ' || query_condition;                 
    end if;                 
    sql_statement  := ' select count(*) from ' || table_name || p_query_condition;             
    execute immediate sql_statement into record_count;                 
    if (record_count = 0) then                 
      page_count   := 0;                 
    else                 
      page_count   := trunc((record_count-1)/each_count) + 1;                 
    end if;                 
    sql_statement  := ' select ' || cast(record_count as char) || ' record_count, ' ||                 
                                    cast(page_count   as char) || ' page_count '    ||                 
                      ' from dual ';                 
    open result_cursor for sql_statement;                 
    return result_cursor;                 
  end;                 
                  
                   
  function get_page_by_code(                     
    field_list         in varchar2,                     
    table_name         in varchar2,                     
    query_condition    in varchar2,                     
    order_list         in varchar2,                     
    location_condition in varchar2,                     
    each_count         in integer,  
    field_order        in integer,  
    field_sc           in varchar2  
  ) return pkg_custom_type.cursor_type is            
    p_query_condition    varchar2(2000);              
    p_location_condition varchar2(2000);                 
    p_order_list         varchar2(2000);                 
    sql_statement        varchar2(32000);                 
    record_number        integer;             
    page_number          integer;             
    temp_count           integer;   
    i_count           integer(10);  
    str_order_field   varchar2(2000);  
    tmp_field_list    varchar2(2000);  
    result_cursor        pkg_custom_type.cursor_type;                 
  begin                 
    if (query_condition is not null) then                 
      p_query_condition    := ' where ' || query_condition;                 
    end if;                 
    if (location_condition is not null) then                 
      p_location_condition := ' where ' || location_condition;                 
    end if;                 
    i_count:=0;  
    tmp_field_list:=field_list;  
    if(field_order<>-1) then         
      while(instr(tmp_field_list,',')>0) loop  
         if(i_count=field_order) then  
           str_order_field:=substr(tmp_field_list,0,instr(tmp_field_list,',')-1);  
           dbms_output.put_line('----------'||str_order_field);  
           while(instr(str_order_field,' ')>0) loop  
              str_order_field:=substr(str_order_field,instr(str_order_field,' ')+1);  
           end loop;  
           dbms_output.put_line('----------'||str_order_field);  
           exit;  
         end if;  
         tmp_field_list:=substr(tmp_field_list,instr(tmp_field_list,',')+1);  
         i_count:=i_count+1;    
      end loop;  
    else  
      str_order_field:=order_list;  
    end if;  
    if (str_order_field is not null) then                 
      p_order_list := ' order by ' || str_order_field;  
      if(field_order<>-1) then  
        p_order_list := p_order_list ||' '||field_sc;                 
      end if;  
    end if;                
       
    sql_statement  := ' select count(*) from ' || table_name || p_query_condition ;         
dbms_output.put_line(sql_statement);              
    execute immediate sql_statement into temp_count;       
    if (temp_count = 0) then       
      sql_statement := ' select ' || field_list || ' from ' || table_name || ' where 1=2 ';       
      open result_cursor for sql_statement;       
      return result_cursor;       
    end if;        
             
    sql_statement  := ' select ' || field_list || ' from ' || table_name ||                 
                      p_query_condition || p_order_list;                 
    sql_statement  := ' select a.*, rownum record_number from (' || sql_statement || ') a ';              
    sql_statement  := ' select record_number from (' || sql_statement || ') b ' || p_location_condition;      
dbms_output.put_line( sql_statement );            
    execute immediate sql_statement into record_number;             
               
    if (record_number = 0) then             
      page_number  := 0;             
    else             
      page_number  := trunc((record_number-1)/each_count) + 1;             
    end if;             
    return  get_page_by_number(field_list, table_name, query_condition, order_list, each_count, page_number,field_order,field_sc);            
  end;            
         
  function get_info_by_code(              
    table_name         in varchar2,                     
    query_condition    in varchar2,                     
    order_list         in varchar2,                     
    location_condition in varchar2,                     
    each_count         in integer                     
  ) return pkg_custom_type.cursor_type is               
    p_query_condition    varchar2(2000);              
    p_location_condition varchar2(2000);                 
    p_order_list         varchar2(2000);                 
    field_list           varchar2(2000);                 
    sql_statement        varchar2(32000);                 
    page_count           integer;             
    page_number          integer;             
    record_count         integer;             
    record_number        integer;          
    temp_count		 integer;          
    result_cursor        pkg_custom_type.cursor_type;                 
  begin                 
    if (query_condition is not null) then                 
      p_query_condition    := ' where ' || query_condition;                 
    end if;                 
    if (location_condition is not null) then                 
      p_location_condition := ' where ' || location_condition;                 
    end if;      
    field_list := '1';                     
    if (order_list is not null) then                 
      p_order_list := ' order by ' || order_list;      
      field_list   := order_list;      
    end if;                 
       
    sql_statement  := ' select count(*) from ' || table_name || p_query_condition ;                 
    execute immediate sql_statement into temp_count;       
    if (temp_count = 0) then       
      sql_statement  := ' select 0 record_count, 1 page_count, 0 record_number, 1 page_number from dual ';                
      open result_cursor for sql_statement;       
      return result_cursor;       
    end if;       
    sql_statement  := ' select ' || field_list || ' from ' || table_name ||                 
                      p_query_condition || p_order_list;                 
    sql_statement  := ' select a.*, rownum record_number from (' || sql_statement || ') a ';              
    sql_statement  := ' select record_number from (' || sql_statement || ') b ' || p_location_condition;     
    dbms_output.put_line( sql_statement );        
    execute immediate sql_statement into record_number;             
    if (record_number = 0) then             
      page_number  := 0;             
    else             
      page_number  := trunc((record_number-1)/each_count) + 1;             
    end if;             
    record_number  := record_number - (page_number-1)*each_count;                
                 
    sql_statement  := ' select count(*) from ' || table_name ||                 
                      p_query_condition || p_order_list;                 
    execute immediate sql_statement into record_count;             
    if (record_count = 0) then             
      page_count   := 0;             
    else             
      page_count   := trunc((record_count-1)/each_count) + 1;             
    end if;             
                 
    sql_statement  := ' select ' ||                    
      cast(record_count as char)   || ' record_count, '   ||                             
      cast(page_count as char)     || ' page_count, '     ||                             
      cast(record_number as char)  || ' record_number, '  ||                        
      cast(page_number as char)    || ' page_number '    ||                        
      ' from dual ';                
    open result_cursor for sql_statement;            
    return result_cursor;            
  end;             
                   
end;