import 'package:json_annotation/json_annotation.dart';
import 'package:mero_gahana/models/product.dart';
import 'package:objectbox/objectbox.dart';
//flutter pub run build_runner build  --delete-conflicting-outputs

part 'user.g.dart';

@Entity()
@JsonSerializable()
class User {
  @Id(assignable: true)
  int uId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userId;
  String? fname;
  String? lname;
  String? image;
  String? username;
  String? password;

  final product = ToMany<Product>();

  User({
    this.userId,
    this.fname,
    this.lname,
    this.image,
    this.username,
    this.password,
    this.uId = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}