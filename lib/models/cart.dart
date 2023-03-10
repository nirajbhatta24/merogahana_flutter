//flutter pub run build_runner build --delete-conflicting-outputs

import 'package:json_annotation/json_annotation.dart';
import 'package:mero_gahana/models/product.dart';
import 'package:mero_gahana/models/user.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "_id")
  String? id;
  Product? productId;
  int? quantity;

  Cart({this.id, this.productId, this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}