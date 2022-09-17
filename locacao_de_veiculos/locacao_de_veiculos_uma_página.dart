import 'dart:io';
import 'cliente/cliente.dart';
import 'funcionario/funcionario.dart';
import 'veiculos/veiculo.dart';
import 'marcas/marca.dart';
import 'modelos/modelo.dart';
import 'locacoes/locação.dart';

var listVeiculo = <Veiculo>[];
var listMarca = <Marca>[];
var listLocacao = <Locacao>[];
var listCliente = <Cliente>[];
var listModelo = <Modelo>[];
var listFuncionario = <Funcionario>[];

void menuPrincipal (){
  print('MENU PRINCIPAL\n'
      '[ 1 ] Cadastros \n'
      '[ 2 ] Locação \n'
      '[ 3 ] Relatórios \n'
      '[ 4 ] Sair');
  print('Escolha: ');
}

void menuCadastro (){
  print('MENU CADASTROS\n'
      '[ 1 ] Cadastrar Cliente \n'
      '[ 2 ] Cadastrar Funcionário \n'
      '[ 3 ] Cadastrar Marca \n'
      '[ 4 ] Cadastrar Modelo \n'
      '[ 5 ] Cadastrar Veiculo\n'
      '[ 6 ] Menu Principal');
  print('Escolha: ');
}

void menuRelatorios (){
  print('MENU RELATÓRIOS\n'
      '[ 1 ] Locações por Cliente(nomeCliente, nomeVeic, totalPago) \n'
      '[ 2 ] Locações por Funcionário(nomeFunc, totalLoc)\n'
      '[ 3 ] Locações por Veiculo (nomeVeic, modelo, QuantidadeLocada) \n'
      '[ 4 ] Menu Principal');
  print('Escolha: ');
}

void locacoesPorVeiculo(){
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

void locacoesPorClientes(){
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

void locacoesPorFuncionario(){
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

void relatorios(){
  int? OpRel;
  while(OpRel != 4){
    try{
      menuRelatorios();
      OpRel = int.parse(stdin.readLineSync()!);
      switch(OpRel){
        case 1:
          locacoesPorClientes();
          break;
        case 2:
          locacoesPorFuncionario();
          break;
        case 3:
          locacoesPorVeiculo();
          break;
        case 4:
          print('Voltando ao Menu Principal...');
          break;
        default:
          print('Opção indisponível, tente novamente');
          break;
      }
    }catch(e){
      print('FUDEU!');
      rethrow;
    }
  }
}

int IdCliente = 1;
void addCliente(){
  var cliente = Cliente();
  print("ID_Cliente: ${IdCliente}");
  cliente.id = IdCliente;
  print('Informe o nome: ');
  cliente.nome = stdin.readLineSync()!.toUpperCase();
  print('Informe o CPF: ');
  cliente.cpf = int.parse(stdin.readLineSync()!);
  print('Informe o Telefone: ');
  cliente.telefone = int.parse(stdin.readLineSync()!);
  print('Informe o Endereço(Rua / bairro / casa: ');
  cliente.endereco = stdin.readLineSync()!;
  listCliente.add(cliente);
  exibirClientes();
  IdCliente = IdCliente + 1;
}

void exibirClientes(){
  for(var i = 0; i < listCliente.length; i++){
      print('LISTA CLIENTES');
      print("Id: ${listCliente[i].id}\n"
          "Nome: ${listCliente[i].nome}\n"
          "CPF: ${listCliente[i].cpf}\n"
          "Telefone: ${listCliente[i].telefone}\n"
          "Endereço: ${listCliente[i].endereco}\n");
  }
}

int IdMarca = 1;
void addMarca(){
  var marca = Marca();
  print("ID_Marca: ${IdMarca}");
  marca.id = IdMarca;
  print('Informe o nome: ');
  marca.nome = stdin.readLineSync()!.toUpperCase();
  listMarca.add(marca);
  exibirMarca();
  IdMarca = IdMarca + 1;
}

void exibirMarca(){
  for(var i = 0; i < listMarca.length; i++){
    print('LISTA MARCAS');
    print("Id: ${listMarca[i].id}\n"
        "Nome: ${listMarca[i].nome}\n");
  }
}

int IdFuncionario = 1;
void addFuncionario(){
  var funcionario = Funcionario();
  print("ID_Funcionario: ${IdFuncionario}");
  funcionario.id = IdFuncionario;
  print('Informe o nome: ');
  funcionario.nome = stdin.readLineSync()!.toUpperCase();
  print('Informe o telefone: ');
  funcionario.telefone = int.parse(stdin.readLineSync()!);
  listFuncionario.add(funcionario);
  exibirFuncionario();
  IdFuncionario = IdFuncionario + 1;
}

void exibirFuncionario(){
  for(var i = 0; i < listFuncionario.length; i++){
    print('LISTA FUNCIONARIOS');
    print("Id: ${listFuncionario[i].id}\n"
        "Nome: ${listFuncionario[i].nome}\n"
        "Telefone: ${listFuncionario[i].telefone}\n");
  }
}

int IdModelo = 1;
void addModelo(){
  var modelo = Modelo();
  print("ID_Modelo: ${IdModelo}");
  modelo.id = IdModelo;
  print('Informe o nome: ');
  modelo.nome = stdin.readLineSync()!.toUpperCase();
  listModelo.add(modelo);
  exibirModelo();
  IdModelo = IdModelo + 1;
}

void exibirModelo(){
  for(var i = 0; i < listModelo.length; i++){
    print('LISTA MODELO');
    print("Id: ${listModelo[i].id}\n"
        "Nome: ${listModelo[i].nome}\n");
  }
}

bool seeIfExistsIDs(id_list, list){
  bool Test = false;
  for (var i = 0; i < list.length; i ++){
    if(id_list == list[i].id){
      Test = true;
      break;
    }
  }
  return Test;
}


int IdVeiculo = 1;
void addVeiculo(){
  var veiculo = Veiculo();
  print("ID_Veiculo: ${IdVeiculo}");
  veiculo.id = IdVeiculo;
  print('Informe Id_marca: ');
  veiculo.id_marca = int.parse(stdin.readLineSync()!.toUpperCase());
  print('Informe Id_modelo: ');
  veiculo.id_modelo = int.parse(stdin.readLineSync()!);
  if(seeIfExistsIDs(veiculo.id_marca, listMarca) == true && seeIfExistsIDs(veiculo.id_modelo, listModelo) == true){
    print('Informe km_rodado: ');
    veiculo.km_rodado = double.parse(stdin.readLineSync()!);
    print('Informe o Valor');
    veiculo.valor = double.parse(stdin.readLineSync()!);
    listVeiculo.add(veiculo);
    exibirVeiculo();
    IdVeiculo = IdVeiculo + 1;
  }else{
    print('Algum dos Ids digitados não existem!');
  }
}

void exibirVeiculo(){
  for(var i = 0; i < listVeiculo.length; i++){
    print('LISTA Veiculos');
    print("Id: ${listVeiculo[i].id}\n"
        "Id_modelo: ${listVeiculo[i].id_modelo}\n"
        "Id_marca: ${listVeiculo[i].id_marca}\n"
        "Km_rodado: ${listVeiculo[i].km_rodado}\n"
        "Valor: ${listVeiculo[i].valor}\n");
  }
}

void cadastros (){
  int? OpCad;
  while(OpCad != 6){
    try{
      menuCadastro();
      OpCad = int.parse(stdin.readLineSync()!);
      switch(OpCad){
        case 1:
          addCliente();
          break;
        case 2:
          addFuncionario();
          break;
        case 3:
          addMarca();
          break;
        case 4:
          addModelo();
          break;
        case 5:
          addVeiculo();
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

int IdLocacoes = 1;
void addLocacoes(){
  var locacoes = Locacao();
  print("ID_Locaçoes: ${IdLocacoes}");
  locacoes.id = IdLocacoes;
  print('Informe o Id_veiculo: ');
  locacoes.id_veiculo = int.parse(stdin.readLineSync()!);
  print('Informe o Id_cliente: ');
  locacoes.id_cliente = int.parse(stdin.readLineSync()!);
  print('Informe o Id_funcionário: ');
  locacoes.id_funcionario = int.parse(stdin.readLineSync()!);
  if(seeIfExistsIDs(locacoes.id_veiculo, listVeiculo) == true && seeIfExistsIDs(locacoes.id_cliente, listCliente) == true && seeIfExistsIDs(locacoes.id_funcionario, listFuncionario) == true){
    print('Informe a data da locação: ');
    locacoes.data_saida = stdin.readLineSync()!;
    print('Informe a datas_entregas: ');
    locacoes.data_entrega = stdin.readLineSync()!;
    print('Informe os dias locados: ');
    locacoes.dias_locado = int.parse(stdin.readLineSync()!);
    locacoes.total = gerarTotal(locacoes.id_veiculo,locacoes.dias_locado);
    listLocacao.add(locacoes);
    totalLocacao();
    exibirLocacoes();
    IdLocacoes = IdLocacoes + 1;
  }else{
    print('Algum dos Ids digitados não existem!');
  }
}

double gerarTotal(idVeiculos, qtdDias){
  double? Total;
  for(var i = 0; i < listVeiculo.length; i++){
    if(listVeiculo[i].id == idVeiculos){
        Total = listVeiculo[i].valor! * qtdDias!;
    }
  }
  return Total!;
}

void totalLocacao() {
  double? Sum = 0;
  for(var i = 0; i < listLocacao.length; i++){
    Sum = Sum! + listLocacao[i].total!;
  }
  print('O valor final foi: ${Sum} reais');
}

void exibirLocacoes(){
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

void main(){
  int? OpMain;
  while(OpMain != 4){
    try{
      menuPrincipal();
      OpMain = int.parse(stdin.readLineSync()!);
      switch(OpMain){
        case 1:
          cadastros();
          break;
        case 2:
          exibirLocacoes();
          addLocacoes();
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
