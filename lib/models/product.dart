
import 'package:json_annotation/json_annotation.dart';
import 'package:mero_gahana/models/user.dart';
import 'package:mero_gahana/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

part 'product.g.dart';

@Entity()
@JsonSerializable()
class Product{
  @Id(assignable:true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name:'_id')
  String? productId;
  String? productname;
  String? productdetails;
  int? price;
  String? image;

  @Backlink()
  final user = ToMany<User>();

  Product(this.productId, this.productname, this.productdetails,this.price, this.image, {this.id = 0});
  
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
  
}