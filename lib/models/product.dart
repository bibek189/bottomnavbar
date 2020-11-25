import 'package:get/get.dart';
class Product{
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
    this.id,
    this.price,
    this.productDescription,
    this.productImage,
    this.productName,
  });

  final isFavourite = false.obs;
}