import 'package:mero_gahana/data_storage/remote_data_source/cart_remote_data_source.dart';
import 'package:mero_gahana/data_storage/remote_data_source/response/cart_response.dart';

class CartRepository{


  Future<bool> addProductToCart(
      String productId, String quantity) async {
    return await CartRemoteDataSource()
        .addProductToCart(productId, quantity);
  }

  Future<CartResponse?> getAllCart() async {
    return await CartRemoteDataSource().getMyCart();
  }


}