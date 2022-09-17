import 'dart:io';
import '../cliente/cliente.dart';
import '../funcionario/funcionario.dart';
import '../locacoes/locação.dart';
import '../marcas/marca.dart';
import '../modelos/modelo.dart';
import '../veiculos/veiculo.dart';

class RelatoriosDoSistema{

  static void locacoesPorFuncionario(List<Funcionario>listFuncionario, List<Locacao>listLocacao){
    int IdFuncionario = 0;
    print('Escolha o Funcionario que gostaria de checar: ');
    IdFuncionario = int.parse(stdin.readLineSync()!);
    for(int i = 0; i < listFuncionario.length; i ++){
      int ContFuncIndi = 0;
      for(int j = 0; j < listLocacao.length; j ++){
        if( listLocacao[j].id_funcionario == listFuncionario[i].id){
          ContFuncIndi ++;
        }
      }
      if(IdFuncionario == listLocacao[i].id_funcionario){
        print('------- RELÁTORIO DE FUNCIONÁRIO -------\n'
            'O Funcionário ${listFuncionario[i].nome}\n'
            'Fez ${ContFuncIndi} locações\n');
        break;
      }
    }
  }

  static void locacoesPorClientes(List<Locacao>listLocacao, List<Veiculo>listVeiculo, List<Modelo>listModelo, List<Cliente>listCliente, List<Marca>listMarca){
    int? IdCliente;
    print('Escolha o Cliente que gostaria de checar: ');
    IdCliente = int.parse(stdin.readLineSync()!);
    for(int i = 0; i < listLocacao.length; i++){
      if(listLocacao[i].id_cliente == listCliente[IdCliente-1].id){
        print('------- RELÁTORIO DE CLIENTE -------\n'
            'O Cliente ${listCliente[IdCliente-1].nome}\n'
            'Alugou o carro ${listModelo[listVeiculo[listLocacao[i].id_veiculo!-1].id_modelo!-1].nome} da ${listMarca[listVeiculo[listLocacao[i].id_veiculo!-1].id_marca!-1].nome}\n'
            'O total pago foi ${listLocacao[i].total} reais\n');
      }
    }
  }

  static void locacoesPorVeiculo(List<Veiculo>listVeiculo, List<Locacao>listLocacao, List<Modelo>listModelo, List<Marca>listMarca){
    int IdVeiculo = 0;
    print('Escolha o Veiculo que gostaria de checar: ');
    IdVeiculo = int.parse(stdin.readLineSync()!);
    for(int i = 0; i < listVeiculo.length; i ++){
      int ContVeicIndi = 0;
      for(int j = 0; j < listLocacao.length; j ++){
        if( listLocacao[j].id_veiculo == listVeiculo[i].id){
          ContVeicIndi ++;
        }
      }
      for(int f = 0; f < listModelo.length; f++ ){
        for(int e = 0; e < listMarca.length; e++){
          if(IdVeiculo == listLocacao[i].id_veiculo && listVeiculo[i].id == listLocacao[i].id_veiculo && listVeiculo[i].id_modelo == listModelo[f].id && listVeiculo[i].id_marca == listMarca[e].id){
            print('------- RELÁTORIO DE VEICULO -------\n'
                'O Veiculo com id ${listLocacao[i].id_veiculo}\n'
                'Com nome ${listModelo[f].nome} da ${listMarca[e].nome}\n'
                'Participou de ${ContVeicIndi} locações\n');
            break;
          }
        }
      }
    }
  }

}