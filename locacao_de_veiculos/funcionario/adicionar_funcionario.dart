import 'dart:io';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import 'funcionario.dart';
class AdicionarFuncionario{
  int IdFuncionario = 1;
  void addFuncionario(List<Funcionario>listFuncionario){
    var funcionario = Funcionario();
    print("ID_Funcionario: ${IdFuncionario}");
    funcionario.id = IdFuncionario;
    print('Informe o nome: ');
    funcionario.nome = stdin.readLineSync()!.toUpperCase();
    print('Informe o telefone: ');
    funcionario.telefone = int.parse(stdin.readLineSync()!);
    listFuncionario.add(funcionario);
    Exibir.exibirFuncionario(listFuncionario);
    IdFuncionario = IdFuncionario + 1;
  }

}