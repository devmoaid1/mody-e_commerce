import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Product {
  final String? productId;
  final String? productName;
  final String? productDescription;
  final double? productPrice;
  final String? productLocation;
  final String? category;
  int? productQuantity;

  Product(
      {this.productQuantity,
      this.productId,
      this.productName,
      this.productPrice,
      this.productDescription,
      this.productLocation,
      this.category});

  factory Product.fromJson(Map<String, dynamic> data) =>
      _$ProductFromJson(data);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
