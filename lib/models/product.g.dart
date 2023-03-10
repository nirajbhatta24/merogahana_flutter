// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['_id'] as String?,
      json['productname'] as String?,
      json['productdetails'] as String?,
      json['price'] as int?,
      json['image'] as String?,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      '_id': instance.productId,
      'productname': instance.productname,
      'productdetails': instance.productdetails,
      'price': instance.price,
      'image': instance.image,
    };
