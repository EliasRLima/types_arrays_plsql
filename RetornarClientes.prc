create or replace procedure RetornarClientes(p_tab_clientes in typ_tab_cliente_obj,
                                             p_order_nome in number default 0,
                                             p_order_faturamento in number default 0) is

  v_sql varchar2(500);
  v_cliente cliente.typ_cliente;
  v_cursor cliente.t_cursor;

begin
  
  if p_order_nome <> 0 and p_order_faturamento <> 0 then
    open v_cursor for select * from table(cast( p_tab_clientes as typ_tab_cliente_obj)) p order by nomecliente, faturamentoanual;
  elsif p_order_nome <> 0 then
    open v_cursor for select * from table(cast( p_tab_clientes as typ_tab_cliente_obj)) p order by nomecliente;
  elsif p_order_faturamento <> 0 then
    open v_cursor for select * from table(cast( p_tab_clientes as typ_tab_cliente_obj)) p order by faturamentoanual desc;
  else
    open v_cursor for select * from table(cast( p_tab_clientes as typ_tab_cliente_obj)) p;
  end if;

  loop
    fetch v_cursor into v_cliente;
    dbms_output.put_line('CLIENTE: [' || initcap(v_cliente.nomecliente) || '] FATURAMENTO: [' || v_cliente.faturamentoanual || '];');
    exit when v_cursor%notfound;
  end loop;
end;
/
