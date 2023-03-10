import 'package:mero_gahana/models/product.dart';
import 'package:mero_gahana/models/user.dart';
import 'package:mero_gahana/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  late final Box<Product>_product;
  // Constructor
  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
    _product = Box<Product>(_store);
  }

  //initilization of object box
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(getObjectBoxModel(), directory: '${dir.path}/user_jwl');

    return ObjectBoxInstance(store);
  }

  //---------------- User Queries ----------------
  int addUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

  // Login user
  User? loginUser(String username, String password) {
    return _user
        .query(
            User_.username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst();
  }

  //dashboard
  List<Product> getAllProduct(){
    return _product.getAll();
  }

  //add all product
  addAllProduct(List<Product> lstpro){
    for (var item in lstpro){
      if (_product.query(Product_.productId.equals(item.productId!)).build().findFirst() == null) {
        _product.put(item);
      }
    }
  }
}
