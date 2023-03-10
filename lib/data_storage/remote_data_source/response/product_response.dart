
import 'package:json_annotation/json_annotation.dart';
import 'package:mero_gahana/models/product.dart';
part 'product_response.g.dart';

//flutter pub run build_runner build  --delete-conflicting-outputs
@JsonSerializable()
class ProductResponse{
  bool? success;
  String? message;
  List<Product>? data;

  ProductResponse({this.success, this.message, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

}