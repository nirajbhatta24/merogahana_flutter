import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mero_gahana/app/constants.dart';
import 'package:mero_gahana/data_storage/remote_data_source/response/cart_response.dart';
import 'package:mero_gahana/helper/http_service.dart';

class CartRemoteDataSource {

 // Add & Update Cart
  Future<bool> addProductToCart(
      String productId, String quantity) async {
    bool isProductAddedToCart = false;

  final Dio httpServices = HttpServices().getDioInstance();
    try {
       Response? response = await httpServices.post(
        "cart/$productId/$quantity",
         options: Options(headers: {
            HttpHeaders.authorizationHeader: Constant.token,
          })
      );
      // dio ko 
      final CartResponse cartResponseData =
          CartResponse.fromJson(response.data);
      if (cartResponseData.success == true) {
        isProductAddedToCart = true;
        return isProductAddedToCart;
      }
    } catch (exception) {
      print(exception);
    }
    return isProductAddedToCart;
  }

  // Get MY Cart
  Future<CartResponse?> getMyCart() async {
    CartResponse? cartResponse;
    Dio dio = HttpServices().getDioInstance();
    print("Inside cart remote");
    try {
      print("Cart resp ");
      // dio ko response --> server le dine
      Response response = await dio.get("cart/myCart",
          );
      // response.data
      cartResponse = CartResponse.fromJson(response.data);
      if (cartResponse.success == true) {
        return cartResponse;
      } else {
        cartResponse = null;
      }
    } catch (exception) {
      print(exception);
    }
    return cartResponse;
  }



}