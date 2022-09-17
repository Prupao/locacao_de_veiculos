import 'dart:io';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import 'marca.dart';
class AdicionarMarcas{
  int IdMarca = 1;
  void addMarca(List<Marca>listMarca){
    var marca = Marca();
    print("ID_Marca: ${IdMarca}");
    marca.id = IdMarca;
    print('Informe o nome: ');
    marca.nome = stdin.readLineSync()!.toUpperCase();
    listMarca.add(marca);
    Exibir.exibirMarca(listMarca);
    IdMarca = IdMarca + 1;
  }

}