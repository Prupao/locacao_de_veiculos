class Exibir{

  static void exibirClientes(listCliente){
    for(var i = 0; i < listCliente.length; i++){
      print('LISTA CLIENTES');
      print("Id: ${listCliente[i].id}\n"
          "Nome: ${listCliente[i].nome}\n"
          "CPF: ${listCliente[i].cpf}\n"
          "Telefone: ${listCliente[i].telefone}\n"
          "Endereço: ${listCliente[i].endereco}\n");
    }
  }

  static void exibirMarca(listMarca){
    for(var i = 0; i < listMarca.length; i++){
      print('LISTA MARCAS');
      print("Id: ${listMarca[i].id}\n"
          "Nome: ${listMarca[i].nome}\n");
    }
  }

  static void exibirFuncionario(listFuncionario){
    for(var i = 0; i < listFuncionario.length; i++){
      print('LISTA FUNCIONARIOS');
      print("Id: ${listFuncionario[i].id}\n"
          "Nome: ${listFuncionario[i].nome}\n"
          "Telefone: ${listFuncionario[i].telefone}\n");
    }
  }

  static void exibirModelo(listModelo){
    for(var i = 0; i < listModelo.length; i++){
      print('LISTA MODELO');
      print("Id: ${listModelo[i].id}\n"
          "Nome: ${listModelo[i].nome}\n");
    }
  }

  static void exibirVeiculo(listVeiculo){
    for(var i = 0; i < listVeiculo.length; i++){
      print('LISTA Veiculos');
      print("Id: ${listVeiculo[i].id}\n"
          "Id_modelo: ${listVeiculo[i].id_modelo}\n"
          "Id_marca: ${listVeiculo[i].id_marca}\n"
          "Km_rodado: ${listVeiculo[i].km_rodado}\n"
          "Valor: ${listVeiculo[i].valor}\n");
    }
  }

  static void exibirLocacoes(listLocacao){
    for(var i = 0; i < listLocacao.length; i++){
      print('LISTA LOCAÇÕES');
      print("Id: ${listLocacao[i].id}\n"
          "Id_funcionario: ${listLocacao[i].id_funcionario}\n"
          "Id_cliente: ${listLocacao[i].id_cliente}\n"
          "Id_veiculo: ${listLocacao[i].id_veiculo}\n"
          "Data_saída: ${listLocacao[i].data_saida}\n"
          "Data_entrega: ${listLocacao[i].data_entrega}\n"
          "Dias_locados: ${listLocacao[i].dias_locado}\n");
    }
  }



}