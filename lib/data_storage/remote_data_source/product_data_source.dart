import 'package:dio/dio.dart';
import 'package:mero_gahana/app/constants.dart';
import 'package:mero_gahana/data_storage/remote_data_source/response/product_response.dart';
import 'package:mero_gahana/helper/http_service.dart';

class ProductRemoteDataSource {

  Future<ProductResponse?> getAllProduct() async {
  final Dio httpServices = HttpServices().getDioInstance();
  ProductResponse? productResponse;
    try {
      Response? response = await httpServices.get(
        Constant.productURL,
      );
      print("Data response, $response");
      print("Data response status, $response");

      productResponse = ProductResponse.fromJson(response.data);
        print("Product Response success, ${productResponse.success}");
      if (productResponse.success == true) {
        // ProductResponse productResponse = ProductResponse.fromJson(response.data);
        return productResponse;
      } else {
        response = null;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load product');
    }
    return productResponse;
  }
}


