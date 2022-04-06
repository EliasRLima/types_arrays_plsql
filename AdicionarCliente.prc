create or replace procedure AdicionarCliente(p_id in number,
                                             p_nomecliente in varchar2,
                                             p_datanascimento in varchar2,
                                             p_faturamentoanual in number,
                                             p_cpfcnpj in varchar2,
                                             p_tipopessoa in integer,
                                             p_tab_clientes_atualizada in out cliente.typ_tab_cliente) is
                                             
    v_cliente cliente.typ_cliente;
    V_ultimo cliente.typ_cliente;
    v_idcliente pls_integer := p_id;
    
begin 
    v_cliente.idcliente  := v_idcliente;
    v_cliente.nomecliente := p_nomecliente;
    v_cliente.datanascimento := to_date(p_datanascimento,'dd/mm/yyyy');
    v_cliente.faturamentoanual := p_faturamentoanual;
    v_cliente.cpfcnpj  := replace(replace(replace(p_cpfcnpj,'/',''),'-',''),'.','');
    v_cliente.tipopessoa  := p_tipopessoa;
    
    begin
      validarCliente(v_cliente);
      
    exception
      when cliente.e_validacao then
        dbms_output.put_line('Cliente nao sera adicionado por falha na validacao.');
        return;
      when others then
        dbms_output.put_line('Erro desconhecido ao validar cliente.');
        return;
    end;
    p_tab_clientes_atualizada(v_idcliente) := v_cliente;
end;
/
