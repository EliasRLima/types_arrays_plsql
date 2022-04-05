create or replace noneditionable procedure validarCliente(p_cliente in cliente.typ_cliente) is

  e_validacao EXCEPTION;
begin
  if p_cliente.tipopessoa = cliente.c_tipoPessoaFisica then
    if p_cliente.nomecliente is null then
      dbms_output.put_line('O nome de pessoas fisicas é obrigatorio.');
      raise e_validacao;
    elsif p_cliente.datanascimento is null then
      dbms_output.put_line('A data de nascimento de pessoas fisicas é obrigatoria.');
      raise e_validacao;
    elsif p_cliente.cpfcnpj is null then
      dbms_output.put_line('O CPF é obrigatorio para pessoas fisicas.');
      raise e_validacao;
    end if;
  elsif p_cliente.tipopessoa = cliente.c_tipoPessoaJuridica then
    if p_cliente.nomecliente is null then
      dbms_output.put_line('O nome de pessoas juridicas é obrigatorio.');
      raise e_validacao;
    elsif p_cliente.faturamentoanual is null then
      dbms_output.put_line('O faturamento anual de pessoas juridicas é obrigatorio.');
      raise e_validacao;
    elsif p_cliente.cpfcnpj is null then
      dbms_output.put_line('O CNPJ é obrigatorio para pessoas juridicas.');
      raise e_validacao;
    end if;
  else
    dbms_output.put_line('Tipo de pessoa nao reconhecido.');
    raise e_validacao;
  end if;
end ;
/
