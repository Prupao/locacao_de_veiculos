import 'dart:io';
import '../cliente/cliente.dart';
import '../funcionario/funcionario.dart';
import '../veiculos/veiculo.dart';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import '../funções_para_verificar_exceções/function_for_exceptions.dart';
import '../gerar_totais/gerar_totais.dart';
import 'locação.dart';

class AdicionarLocacoes{
  int IdLocacoes = 1;
  void addLocacoes(List<Veiculo>listVeiculo, List<Cliente>listCliente, List<Funcionario>listFuncionario, List<Locacao>listLocacao){
    var locacoes = Locacao();
    print("ID_Locaçoes: ${IdLocacoes}");
    locacoes.id = IdLocacoes;
    print('Informe o Id_veiculo: ');
    locacoes.id_veiculo = int.parse(stdin.readLineSync()!);
    print('Informe o Id_cliente: ');
    locacoes.id_cliente = int.parse(stdin.readLineSync()!);
    print('Informe o Id_funcionário: ');
    locacoes.id_funcionario = int.parse(stdin.readLineSync()!);
    if(FunctionsForException.seeIfExistsIDs(locacoes.id_veiculo, listVeiculo) == true && FunctionsForException.seeIfExistsIDs(locacoes.id_cliente,listCliente) == true && FunctionsForException.seeIfExistsIDs(locacoes.id_funcionario,listFuncionario) == true){
      print('Informe a data da locação: ');
      locacoes.data_saida = stdin.readLineSync()!;
      print('Informe a datas_entregas: ');
      locacoes.data_entrega = stdin.readLineSync()!;
      print('Informe os dias locados: ');
      locacoes.dias_locado = int.parse(stdin.readLineSync()!);
      locacoes.total = GerarTotais.gerarTotal(locacoes.id_veiculo,locacoes.dias_locado, listVeiculo);
      listLocacao.add(locacoes);
      GerarTotais.totalLocacao(listLocacao);
      Exibir.exibirLocacoes(listLocacao);
      IdLocacoes = IdLocacoes + 1;
    }else{
      print('Algum dos Ids digitados não existem!');
    }
  }

}