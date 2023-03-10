
// abstract class ProductRepository {
//   Future<List<Product>> getAllProduct();

// }

// class ProductRepositoryImpl extends ProductRepository {
//   @override
//   Future<ProductResponse?> getAllProduct() async {
//     return ProductRemoteDataSource().getAllProduct();
    // bool status = await NetworkConnectivity.isOnline();
    // List<Product> lstCourse = [];
    // if (status) {
    //   lstProduct = await ProductRemoteDataSource().getAllProduct();
      // add all products to object objectbox
    //   await ProductDataSource().addAllProduct(lstProduct);
    //   return lstCourse;
    // } else {
    //   return ProductDataSource().getAllProduct();
    // }
//   }
// }


import 'package:mero_gahana/data_storage/remote_data_source/response/product_response.dart';

import '../data_storage/remote_data_source/product_data_source.dart';

class ProductRepository{
  Future<ProductResponse?> getAllProduct() async{
    return await ProductRemoteDataSource().getAllProduct();
  }
}