import 'package:mero_gahana/models/product.dart';
import 'package:mero_gahana/state/objectbox_state.dart';

import '../../helper/objectbox.dart';

class ProductDataSource{
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  //OR
  ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<List<Product>> getAllProduct() async{ 
    try{
      return Future.value(objectBoxInstance.getAllProduct());
    }catch(e){
      return[];
    }
  }

  Future addAllProduct(List<Product> lstpro) async{ 
    try{
      return Future.value(objectBoxInstance.addAllProduct(lstpro));
    }catch(e){
      return false;
    }
  }

}