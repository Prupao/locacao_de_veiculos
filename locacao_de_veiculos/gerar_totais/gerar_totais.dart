import '../locacoes/locação.dart';
import '../veiculos/veiculo.dart';

class GerarTotais{

  static double gerarTotal(int? idVeiculos, int? qtdDias, List<Veiculo>listVeiculo){
    double? Total;
    for(var i = 0; i < listVeiculo.length; i++){
      if(listVeiculo[i].id == idVeiculos){
        Total = listVeiculo[i].valor! * qtdDias!;
      }
    }
    return Total!;
  }

  static void totalLocacao(List<Locacao>listLocacao) {
    double? Sum = 0;
    for(var i = 0; i < listLocacao.length; i++){
      Sum = Sum! + listLocacao[i].total!;
    }
    print('O valor final foi: ${Sum} reais');
  }

}