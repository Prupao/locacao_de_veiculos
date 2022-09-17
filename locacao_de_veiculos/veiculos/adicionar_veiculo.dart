import 'dart:io';
import '../marcas/marca.dart';
import '../modelos/modelo.dart';
import '../exibir_elementos_das_listas/exibir_elementos.dart';
import '../funções_para_verificar_exceções/function_for_exceptions.dart';
import 'veiculo.dart';

class AdicionarVeiculo{

  static int IdVeiculo = 1;
  void addVeiculo(List<Marca>listMarca, List<Modelo>listModelo, List<Veiculo>listVeiculo){
    var veiculo = Veiculo();
    print("ID_Veiculo: ${IdVeiculo}");
    veiculo.id = IdVeiculo;
    print('Informe Id_marca: ');
    veiculo.id_marca = int.parse(stdin.readLineSync()!.toUpperCase());
    print('Informe Id_modelo: ');
    veiculo.id_modelo = int.parse(stdin.readLineSync()!);
    if(FunctionsForException.seeIfExistsIDs(veiculo.id_marca,listMarca) == true && FunctionsForException.seeIfExistsIDs(veiculo.id_modelo,listModelo) == true){
      print('Informe km_rodado: ');
      veiculo.km_rodado = double.parse(stdin.readLineSync()!);
      print('Informe o Valor');
      veiculo.valor = double.parse(stdin.readLineSync()!);
      listVeiculo.add(veiculo);
      Exibir.exibirVeiculo(listVeiculo);
      IdVeiculo = IdVeiculo + 1;
    }else{
      print('Algum dos Ids digitados não existem!');
    }
  }

}
