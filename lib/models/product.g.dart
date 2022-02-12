// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productQuantity: json['productQuantity'] as int?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      productDescription: json['productDescription'] as String?,
      productLocation: json['productLocation'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productDescription': instance.productDescription,
      'productPrice': instance.productPrice,
      'productLocation': instance.productLocation,
      'category': instance.category,
      'productQuantity': instance.productQuantity,
    };
