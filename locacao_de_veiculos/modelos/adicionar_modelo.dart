import 'dart:io';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import 'modelo.dart';

class AdicionarModelo{

  static int IdModelo = 1;
  void addModelo(List<Modelo>listModelo){
    var modelo = Modelo();
    print("ID_Modelo: ${IdModelo}");
    modelo.id = IdModelo;
    print('Informe o nome: ');
    modelo.nome = stdin.readLineSync()!.toUpperCase();
    listModelo.add(modelo);
    Exibir.exibirModelo(listModelo);
    IdModelo = IdModelo + 1;
  }

}