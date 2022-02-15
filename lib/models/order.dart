import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Order {
  final String? address;
  final String? orderId;
  int? totalPrice;

  Order({this.address, this.totalPrice, this.orderId});

  factory Order.fromJson(Map<String, dynamic> data) => _$OrderFromJson(data);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
