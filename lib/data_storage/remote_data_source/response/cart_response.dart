import 'package:json_annotation/json_annotation.dart';
import 'package:mero_gahana/models/cart.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  bool? success;
  String? message;
  List<Cart>? data;

  CartResponse({this.success, this.message, this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
