create or replace procedure RetornarClientes(p_tab_clientes in cliente.typ_tab_cliente,
                                             p_order_nome in number default 0,
                                             p_order_faturamento in number default 0) is

  v_sql varchar2(500);
  v_cliente cliente.typ_cliente;
  v_cursor cliente.t_cursor;
  v_cursor2 cliente.typ_tab_cliente;

begin
  
  v_sql := 'select * 
            from table(cast(p_tab_clientes as cliente.typ_cliente)) p';
  
  if p_order_nome <> 0 and p_order_faturamento <> 0 then
    v_sql := v_sql || ' order by 2, 5';
  elsif p_order_nome <> 0 then
    v_sql := v_sql || ' order by 2';
  elsif p_order_faturamento <> 0 then
     v_sql := v_sql || ' order by 5';
  end if;
  
  --dbms_output.put_line(v_sql);
  open v_cursor for v_sql;

  loop
    fetch v_cursor into v_cliente;
    dbms_output.put_line('cliente: ' || v_cliente.nomecliente);
    exit when v_cursor%notfound;
  end loop;
end;
/
