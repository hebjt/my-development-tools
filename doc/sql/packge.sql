create or replace
PACKAGE        "PKG_LIST_BUSINESS"      as                 
  function get_page_by_number(                 
    field_list      in varchar2,                 
    table_name      in varchar2,                 
    query_condition in varchar2,                 
    order_list      in varchar2,                 
    each_count      in integer,                 
    page_number     in integer, 
    field_order     in integer, 
    field_sc        in varchar2 
  ) return pkg_custom_type.cursor_type;  
                 
  function get_total_info(              
    table_name      in varchar2,                 
    query_condition in varchar2,                 
    each_count      in integer                 
  ) return pkg_custom_type.cursor_type;  
  function get_page_by_code(                 
    field_list         in varchar2,                 
    table_name         in varchar2,                 
    query_condition    in varchar2,                 
    order_list         in varchar2,                 
    location_condition in varchar2,                 
    each_count         in integer , 
    field_order        in integer , 
    field_sc           in varchar2 
  ) return pkg_custom_type.cursor_type;  
  function get_info_by_code(          
    table_name         in varchar2,                 
    query_condition    in varchar2,                 
    order_list         in varchar2,                 
    location_condition in varchar2,                 
    each_count         in integer                 
  ) return pkg_custom_type.cursor_type;  
end;