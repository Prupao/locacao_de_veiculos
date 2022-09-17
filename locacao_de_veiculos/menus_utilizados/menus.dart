class Menus{

  static void menuPrincipal (){
    print('MENU PRINCIPAL\n'
        '[ 1 ] Cadastros \n'
        '[ 2 ] Locação \n'
        '[ 3 ] Relatórios \n'
        '[ 4 ] Sair');
    print('Escolha: ');
  }

  static void menuCadastro (){
    print('MENU CADASTROS\n'
        '[ 1 ] Cadastrar Cliente \n'
        '[ 2 ] Cadastrar Funcionário \n'
        '[ 3 ] Cadastrar Marca \n'
        '[ 4 ] Cadastrar Modelo \n'
        '[ 5 ] Cadastrar Veiculo\n'
        '[ 6 ] Menu Principal');
    print('Escolha: ');
  }

  static void menuRelatorios (){
    print('MENU RELATÓRIOS\n'
        '[ 1 ] Locações por Cliente(nomeCliente, nomeVeic, totalPago) \n'
        '[ 2 ] Locações por Funcionário(nomeFunc, totalLoc)\n'
        '[ 3 ] Locações por Veiculo (nomeVeic, modelo, QuantidadeLocada) \n'
        '[ 4 ] Menu Principal');
    print('Escolha: ');
  }

}