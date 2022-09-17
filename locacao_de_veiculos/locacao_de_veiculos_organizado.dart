import 'dart:io';
import 'cliente/cliente.dart';
import 'funcionario/funcionario.dart';
import 'funcionario/adicionar_funcionario.dart';
import 'locacoes/adicionar_locaçoes.dart';
import 'modelos/adicionar_modelo.dart';
import 'veiculos/veiculo.dart';
import 'marcas/marca.dart';
import 'modelos/modelo.dart';
import 'locacoes/locação.dart';
import 'marcas/adicionar_marca.dart';
import 'veiculos/adicionar_veiculo.dart';
import 'menus_utilizados/menus.dart';
import 'exibir_elementos_das_listas/exibir_elementos.dart';
import 'cliente/adicionar_clientes.dart';
import 'relatorios_do_sistema/relatorios_do_sistema.dart';

var listVeiculo = <Veiculo>[];
var listMarca = <Marca>[];
var listLocacao = <Locacao>[];
var listCliente = <Cliente>[];
var listModelo = <Modelo>[];
var listFuncionario = <Funcionario>[];

var adicionarClientes = AdicionarCliente();
var adicionarMarcas = AdicionarMarcas();
var adicionarVeiculos = AdicionarVeiculo();
var adicionarModelo = AdicionarModelo();
var adicionarFuncionario = AdicionarFuncionario();
var adicionarLocacoes = AdicionarLocacoes();


void relatorios(){
  int? OpRel;
  while(OpRel != 4){
    try{
      Menus.menuRelatorios();
      OpRel = int.parse(stdin.readLineSync()!);
      switch(OpRel){
        case 1:
          RelatoriosDoSistema.locacoesPorClientes(listLocacao, listVeiculo, listModelo, listCliente, listMarca);
          break;
        case 2:
          RelatoriosDoSistema.locacoesPorFuncionario(listFuncionario, listLocacao);
          break;
        case 3:
          RelatoriosDoSistema.locacoesPorVeiculo(listVeiculo, listLocacao, listModelo, listMarca);
          break;
        case 4:
          print('Voltando ao Menu Principal...');
          break;
        default:
          print('Opção indisponível, tente novamente');
          break;
      }
    }catch(e){
      print('#=' * 15);
    }
  }
}

void cadastros (){
  int? OpCad;
  while(OpCad != 6){
    try{
      Menus.menuCadastro();
      OpCad = int.parse(stdin.readLineSync()!);
      switch(OpCad){
        case 1:
          adicionarClientes.addCliente(listCliente);
          break;
        case 2:
          adicionarFuncionario.addFuncionario(listFuncionario);
          break;
        case 3:
          adicionarMarcas.addMarca(listMarca);
          break;
        case 4:
          adicionarModelo.addModelo(listModelo);
          break;
        case 5:
          adicionarVeiculos.addVeiculo(listMarca, listModelo, listVeiculo);
          break;
        case 6:
          print('Voltando ao Menu Principal...');
          break;
        default:
          print('Opção indisponível, tente novamente');
          break;
      }
    }catch(e){
      print('*#' * 15);
    }
  }
}

void main(){
  int? OpMain;
  while(OpMain != 4){
    try{
      Menus.menuPrincipal();
      OpMain = int.parse(stdin.readLineSync()!);
      switch(OpMain){
        case 1:
          cadastros();
          break;
        case 2:
          Exibir.exibirLocacoes(listLocacao);
          adicionarLocacoes.addLocacoes(listVeiculo, listCliente, listFuncionario, listLocacao);
          break;
        case 3:
          relatorios();
          break;
        case 4:
          print('SAINDO...');
          break;
        default:
          print('Opção indisponível, tente novamente');
          break;
      }
    }catch(e){
      print('#*' * 15);
    }
  }
}
