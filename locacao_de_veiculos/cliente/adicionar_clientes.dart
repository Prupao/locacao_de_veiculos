import 'dart:io';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import 'cliente.dart';
class AdicionarCliente{
  static int IdCliente = 1;
  void addCliente(List<Cliente>listCliente){
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
    Exibir.exibirClientes(listCliente);
    IdCliente = IdCliente + 1;
  }

}