// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      address: json['address'] as String?,
      totalPrice: json['totalPrice'] as int?,
      orderId: json['orderId'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'address': instance.address,
      'orderId': instance.orderId,
      'totalPrice': instance.totalPrice,
    };
