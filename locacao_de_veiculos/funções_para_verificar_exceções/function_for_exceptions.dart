class FunctionsForException{

  static bool seeIfExistsIDs(int? id_list, List<dynamic>list){
    bool Test = false;
    for (var i = 0; i < list.length; i ++){
      if(id_list == list[i].id){
        Test = true;
        break;
      }
    }
    return Test;
  }

}